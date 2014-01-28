//
//  ASFirstViewController.m
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 22/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import "TopAppViewController.h"
#import "TopAppsCollectionCell.h"
#import "JsonFeedParser.h"
#import "TopApp.h"

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

-(void)setUpModel
{
    isFiltered = NO;
    isHeaderViewActive = NO;
    isPopUpViewAppers = NO;
    self.topApps = [[NSArray alloc]init];
    self.jsonParser    = [[JsonFeedParser alloc]init];
    
}

-(void)setUpPopUpView
{
    self.popupView = [PopUpView popUpView];
    self.popupView.delegate = self;
    if(![[self.topAppCollectionView subviews] isKindOfClass:[PopUpView class]])
    {
        [self.topAppCollectionView addSubview:self.popupView];
         self.popupView.alpha = 0.0f;
    }
    
    self.hidePopupGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hidePopUpView:)];

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    dispatch_async(kBgQueue, ^{
            if([self.navigationItem.title isEqualToString:KTopPaidChartTitle])
                self.topApps = [self.jsonParser fetchAppInfoFromJsonFeed:KTopPaidAppFeed];
        
            else  if([self.navigationItem.title isEqualToString:KTopFreeChartTitle])
                self.topApps = [self.jsonParser fetchAppInfoFromJsonFeed:KTopFreeAppFeed];
        
      dispatch_async(dispatch_get_main_queue(), ^{
            [self.topAppCollectionView reloadData];
            
        });
    });
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
    
    [topAppCollectionCell displayAppInfoInGrid:topApp];
    
    self.wishListGestureReognizer = [[UILongPressGestureRecognizer alloc]
                                     initWithTarget:self action:@selector(addAppToWishList:)];
    self.wishListGestureReognizer.minimumPressDuration = 1.0;
    [topAppCollectionCell addGestureRecognizer:self.wishListGestureReognizer];
    
    return topAppCollectionCell;
}

#pragma mark - UICollectionView Delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(!isPopUpViewAppers)
    {
        if(isFiltered)
            self.popupView.topApp = [self.filteredApps objectAtIndex:indexPath.row];
        else
            self.popupView.topApp = [self.topApps objectAtIndex:indexPath.row];
        
        self.popupView.center = [self updateCenterForPopUpView];
        [self.popupView startAnimation];
    }
    else
        [self.popupView  hideView:self.popupView];
}


- (UICollectionReusableView *)collectionView: (UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    SearchHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:
                                         UICollectionElementKindSectionHeader withReuseIdentifier:@"SearchHeaderView" forIndexPath:indexPath];
    headerView.delegate = self;
    return headerView;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return KCollectionViewEdgeInset;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
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
    isPopUpViewAppers = YES;
    self.topAppCollectionView.scrollEnabled = NO;
    self.topAppCollectionView.alpha = 0.7;
    [self.view addGestureRecognizer:self.hidePopupGestureRecognizer];

}

-(void)popUpViewCancelButtonClicked
{
    isPopUpViewAppers = NO;
    self.topAppCollectionView.scrollEnabled = YES;
    self.topAppCollectionView.alpha = 1.0;
    [self.view removeGestureRecognizer:self.hidePopupGestureRecognizer];
}

#pragma mark- Updating Center for PopupView
-(CGPoint)updateCenterForPopUpView
{
    CGPoint screenPoint  = CGPointMake(([UIScreen mainScreen].bounds.size.width)/2, ([UIScreen mainScreen].bounds.size.height)/2);
    UIWindow *mainWindow = [[UIApplication sharedApplication] keyWindow];
    CGPoint windowCenter = [mainWindow convertPoint:screenPoint fromWindow:nil];
    CGPoint ViewCenter   = [self.topAppCollectionView convertPoint:windowCenter fromView:mainWindow];
   
    return ViewCenter;
}

#pragma mark - adding app to wishList Gesture

-(void)addAppToWishList:(UILongPressGestureRecognizer*)recognizer
{
    NSLog(@"Long Press Gesture recognizer");
}

-(void)hidePopUpView:(UITapGestureRecognizer*)recognizer
{
        [self.popupView  hideView:self.popupView];
}

@end
