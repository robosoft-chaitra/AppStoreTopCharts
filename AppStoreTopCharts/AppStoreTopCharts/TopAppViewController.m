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


@end

@implementation TopAppViewController

#pragma mark - View methods
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.topAppsList = [[NSArray alloc]init];
    self.jsonParser    = [[JsonFeedParser alloc]init];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    if([self.navigationItem.title isEqualToString:KTopPaidChartTitle])
    {
        self.topAppsList = [self.jsonParser fetchAppInfoFromJsonFeed:KTopPaidAppFeed];
    }
    else  if([self.navigationItem.title isEqualToString:KTopFreeChartTitle])
    {
        self.topAppsList = [self.jsonParser fetchAppInfoFromJsonFeed:KTopFreeAppFeed];
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
    return self.topAppsList.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TopAppsCollectionCell *topPaidAppCollectionCell = [collectionView dequeueReusableCellWithReuseIdentifier:KTopAppCellIdentifier
                                                                                                forIndexPath:indexPath];
    TopApp *topPaidApp = [self.topAppsList objectAtIndex:indexPath.row];
    [topPaidAppCollectionCell displayAppInfoInGrid:topPaidApp.appName appImageUrl:topPaidApp.appImageUrl appCategory:topPaidApp.category appPrice:topPaidApp.price];
    
    return topPaidAppCollectionCell;
}

#pragma mark - UICollectionView Delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    TopApp *topPaidApp = [self.topAppsList objectAtIndex:indexPath.row];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:topPaidApp.appName message:topPaidApp.authorName delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
}

#pragma mark - Apps Search Methods

-(void)SearchAppByName
{
    NSMutableArray *allEntries = [[NSMutableArray alloc]init];
    for(TopApp *topApp in self.topAppsList)
    {
        [allEntries addObject:topApp.appName];
    }
   
}


@end
