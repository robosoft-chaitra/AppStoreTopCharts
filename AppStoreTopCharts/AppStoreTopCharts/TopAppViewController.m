//
//  ASFirstViewController.m
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 22/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import "TopAppViewController.h"
#import "TopAppsCollectionCell.h"

@interface TopAppViewController ()
{
    BOOL  isFiltered;
    BOOL  isHeaderViewActive;
    BOOL  isPopUpViewAppers;
}

@end

@implementation TopAppViewController

#pragma mark - View setUp methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpModel];
    [self setUpPopUpView];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];

//    Asynchronously loading the TopApp from json Feed
    dispatch_async(kBgQueue, ^{
        
        if(self.tabBarController.selectedIndex == KTopPaidAppTabBarItemIndex)
//            loading Apps to Applist For TopPaid Apps
            self.topApps = [self.jsonParser fetchAppInfoFromJsonFeed:KTopPaidAppFeed];
        
        else  if(self.tabBarController.selectedIndex == KTopFreeAppTabBarItemIndex)
//            loading Apps to AppList for TopFree Apps
            self.topApps = [self.jsonParser fetchAppInfoFromJsonFeed:KTopFreeAppFeed];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.topAppCollectionView reloadData];
            
        });
    });
}

#pragma mark - Initialization methods

-(void)setUpModel
{
//    Initializing model & parser
    isFiltered = NO;
    isHeaderViewActive = NO;
    isPopUpViewAppers = NO;
    self.topApps = [[NSArray alloc]init];
    self.jsonParser    = [[JsonFeedParser alloc]init];
}

-(void)setUpPopUpView
{
//    adding popupview as subview to collectionview & initially hidingview
    self.popupView = [PopUpView popUpView];
    self.popupView.delegate = self;
    [self.topAppCollectionView addSubview:self.popupView];
     self.popupView.alpha = 0.0f;
    
//    TapGesture to hide the popupview
    self.hidePopupGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hidePopUpView:)];

}


#pragma mark - UICollectionView DataSource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    int itemCount;

    if(isFiltered)
        itemCount = [self.filteredApps count];
    else
        itemCount = [self.topApps count];

    return itemCount;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TopAppsCollectionCell *topAppCollectionCell = [collectionView dequeueReusableCellWithReuseIdentifier:KTopAppCellIdentifier
                                                   
                                                                                                forIndexPath:indexPath];
    TopApp *topApp;
    if(isFiltered)
        topApp = [self.filteredApps objectAtIndex:indexPath.row];
    else
        topApp = [self.topApps objectAtIndex:indexPath.row];
    
//    method to display appInfo in collectionview grid
    [topAppCollectionCell displayAppInfoInGrid:topApp];
    
    return topAppCollectionCell;
}

#pragma mark - UICollectionView Delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    If popup appered on screen then hiding popup else showing popup
    if(!isPopUpViewAppers)
    {
        if(isFiltered)
             [self.popupView startAnimation: [self.filteredApps objectAtIndex:indexPath.row]];
        else
             [self.popupView startAnimation: [self.topApps objectAtIndex:indexPath.row]];
        
//        method to adjust the popupview to center of screen
        self.popupView.center = [self adjustCenterForPopUpView];
    }
    else
        [self.popupView  hideView:self.popupView];
}


- (UICollectionReusableView *)collectionView: (UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
//    headerview to display searchBar on SearchButton Click
    SearchHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:
                                         UICollectionElementKindSectionHeader withReuseIdentifier:@"SearchHeaderView" forIndexPath:indexPath];
    headerView.delegate = self;
    return headerView;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
//    adjust EdgeInset for CollectionView
    return KCollectionViewEdgeInset;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
//    Hiding/Showing search Bar on button click
    if (isHeaderViewActive == NO)
        return KHeaderViewZeroSize;
    else
        return KHeaderViewRefSize;
}

#pragma mark - IBAction SearchBarButton method
- (IBAction)searchAppsByName:(id)sender
{
    isHeaderViewActive = (isHeaderViewActive == YES) ? NO : YES;
    [self.topAppCollectionView reloadData];
}

#pragma mark - SearchForApp Delegate Method
-(void)didSearchForApps:(NSString *)appName
{
     if(appName.length == 0)
              isFiltered = NO;
     else
     {
        isFiltered = YES;
        self.filteredApps = [[NSMutableArray alloc] init];
        for (TopApp *topApp in self.topApps)
        {
//            Searching for App By using appName
            NSRange nameRange = [topApp.appName rangeOfString:appName options:NSCaseInsensitiveSearch];
            if(nameRange.location != NSNotFound)
            {
                [self.filteredApps addObject:topApp];
            }
        }
    }
    if([self.filteredApps count] == 0 && appName.length > 0)
    {
        UIAlertView *noResultsAlert = [[UIAlertView alloc]initWithTitle:@"Search results Not Found" message:@"App not Found" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [noResultsAlert show];
    }
     [self.topAppCollectionView reloadData];
}

#pragma mark - PopView Delegate methods
-(void)popUpViewDidAppear
{
//    adding HideGesture if popup appered on scrren
    isPopUpViewAppers = YES;
    self.topAppCollectionView.scrollEnabled = NO;
    self.topAppCollectionView.alpha = 0.8;
    [self.view addGestureRecognizer:self.hidePopupGestureRecognizer];
}

-(void)popUpViewCancelButtonClicked
{
//    removing HideGesture if popup not appered on screen
    isPopUpViewAppers = NO;
    self.topAppCollectionView.scrollEnabled = YES;
    self.topAppCollectionView.alpha = 1.0;
    [self.view removeGestureRecognizer:self.hidePopupGestureRecognizer];
}

-(void)addAppToWishList:(NSString *)appName
{
//    method to load WishListApps From application Directory
    [self loadFromAppDirectory];
    NSIndexPath *indexpath = [[self.topAppCollectionView indexPathsForSelectedItems ] objectAtIndex:0];
    TopApp *topApp = [self.topApps objectAtIndex:indexpath.row];
    
    if(![self.wishListApps containsObject:topApp.appInfoDictionary])
        [self.wishListApps addObject:topApp.appInfoDictionary];
    else
    {
        UIAlertView *wishListAlert = [[UIAlertView alloc]initWithTitle:@"" message:@"App Already added to WishList" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil,nil];
        [wishListAlert show];
    }
    
//    Writing Wishlist of Apps to application Directory
    [self.wishListApps writeToFile:KAppDirectoryPath atomically:YES];
}

#pragma mark- Updating Center for PopupView
-(CGPoint)adjustCenterForPopUpView
{
//    method to get center Point of screen
    CGPoint screenPoint  = CGPointMake(([UIScreen mainScreen].bounds.size.width)/2, ([UIScreen mainScreen].bounds.size.height)/2);
    UIWindow *mainWindow = [[UIApplication sharedApplication] keyWindow];
    CGPoint windowCenter = [mainWindow convertPoint:screenPoint fromWindow:nil];
    CGPoint ViewCenter   = [self.topAppCollectionView convertPoint:windowCenter fromView:mainWindow];
   
    return ViewCenter;
}

#pragma mark - Gesture Recognizer method
-(void)hidePopUpView:(UITapGestureRecognizer*)recognizer
{
//    method to hide the PopupView in HideGesture
        [self.popupView  hideView:self.popupView];
}

-(void)loadFromAppDirectory
{
    NSError *error;
//    If PlistList is not found on ApplicationDirectory then load plist from Plist
    if (![[NSFileManager defaultManager] fileExistsAtPath:KAppDirectoryPath])
    {
        NSString *bundle = [[NSBundle mainBundle] pathForResource:@"WishList" ofType:@"plist"];
        [[NSFileManager defaultManager] copyItemAtPath:bundle toPath:KAppDirectoryPath error:&error];
    }
//    loading wishlistApp From ApplicationDirectory
    self.wishListApps =[[NSArray arrayWithContentsOfFile:KAppDirectoryPath] mutableCopy];
    if (self.wishListApps.count == 0)
         self.wishListApps = [[NSMutableArray alloc]init];
}

@end
