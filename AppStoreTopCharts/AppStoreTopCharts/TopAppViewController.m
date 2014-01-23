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

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.topAppsList = [[NSArray alloc]init];
    self.jsonFeed    = [[JsonFeedParser alloc]initJsonParser];
   
   
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    if([self.navigationItem.title isEqualToString:@"Top Paid Chart"])
    {
        self.topAppsList = [self.jsonFeed fetchAppInfoFromJsonFeed:@"http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/toppaidapplications/limit=25/json"];
    }
    else  if([self.navigationItem.title isEqualToString:@"Top Free Chart"])
    {
        self.topAppsList = [self.jsonFeed fetchAppInfoFromJsonFeed:@"http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/topfreeapplications/limit=25/json"];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma Mark - UICollectionView DataSource Methods

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
    TopAppsCollectionCell *topPaidAppCollectionCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TopPaidAppCell"
                                                                                                forIndexPath:indexPath];
    TopApp *topPaidApp = [self.topAppsList objectAtIndex:indexPath.row];
    [topPaidAppCollectionCell displayAppInfoInGrid:topPaidApp.appName appImageUrl:topPaidApp.appImageUrl appCategory:topPaidApp.category appPrice:topPaidApp.price];
    
    return topPaidAppCollectionCell;
}




@end
