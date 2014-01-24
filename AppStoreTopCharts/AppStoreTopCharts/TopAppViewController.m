//
//  ASFirstViewController.m
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 22/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import "TopAppViewController.h"
#import "TopAppsCollectionCell.h"
#import "SearchHeaderView.h"
#import "JsonFeedParser.h"
#import "PopUpView.h"
#import "TopApp.h"

@interface TopAppViewController ()
{
    BOOL  isFiltered;
    BOOL  isHeaderViewActive;
}

@end

@implementation TopAppViewController

#pragma mark - View methods
- (void)viewDidLoad
{
    [super viewDidLoad];
    isFiltered = false;
    isHeaderViewActive = NO;
    self.topApps = [[NSArray alloc]init];
    self.jsonParser    = [[JsonFeedParser alloc]init];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    if([self.navigationItem.title isEqualToString:KTopPaidChartTitle])
    {
        self.topApps = [self.jsonParser fetchAppInfoFromJsonFeed:KTopPaidAppFeed];
    }
    else  if([self.navigationItem.title isEqualToString:KTopFreeChartTitle])
    {
        self.topApps = [self.jsonParser fetchAppInfoFromJsonFeed:KTopFreeAppFeed];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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
    TopAppsCollectionCell *topPaidAppCollectionCell = [collectionView dequeueReusableCellWithReuseIdentifier:KTopAppCellIdentifier
                                                                                                forIndexPath:indexPath];
    
    TopApp *topApp;
    if(isFiltered)
        topApp = [self.filteredApps objectAtIndex:indexPath.row];
    else
        topApp = [self.topApps objectAtIndex:indexPath.row];
    
    [topPaidAppCollectionCell displayAppInfoInGrid:topApp.appName
                                       appImageUrl:topApp.appImageUrl
                                       appCategory:topApp.category
                                          appPrice:topApp.price];
    
    return topPaidAppCollectionCell;
}

#pragma mark - UICollectionView Delegate


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    TopApp *topApp ;
//    if(isFiltered)
//        topApp = [self.filteredApps objectAtIndex:indexPath.row];
//    else
//        topApp = [self.topApps objectAtIndex:indexPath.row];
//    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:topApp.appName message:topApp.authorName delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//    [alert show];
    
    PopUpView *popup = [PopUpView popUpView];
    if(![[self.topAppCollectionView subviews] isKindOfClass:[PopUpView class]])
    {
        [self.topAppCollectionView addSubview:popup];
        [popup startAnimation];
    }
}

- (UICollectionReusableView *)collectionView: (UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    SearchHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:
                                         UICollectionElementKindSectionHeader withReuseIdentifier:@"SearchHeaderView" forIndexPath:indexPath];
    headerView.delegate = self;
    return headerView;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5.0f, 5.0f, 5.0f, 5.0f);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (isHeaderViewActive == NO)
        return CGSizeMake(0, 0);
    else
        return CGSizeMake(768, 44);
}

#pragma mark - SearchApp Delegate Methods
-(void)searchAppByNameInGrid:(NSString *)appName 
{
     if(appName.length == 0)
     {
         isFiltered = FALSE;
     }
     else
     {
        isFiltered = true;
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
     [self.topAppCollectionView reloadData];
}

-(void)didFinishedSearchigForApp:(NSString *)appName
{
    if([self.filteredApps count] == 0 && appName.length > 0)
    {
        UIAlertView *noResultsAlert = [[UIAlertView alloc]initWithTitle:@"Search results Not Found" message:@"App not Found" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [noResultsAlert show];
    }

    isHeaderViewActive = NO;
    [self.topAppCollectionView reloadData];

}


- (IBAction)searchAppsByName:(id)sender
{
    isHeaderViewActive = YES;
    [self.topAppCollectionView reloadData];
}
@end
