//
//  ASFirstViewController.m
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 22/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import "TopPaidAppViewController.h"
#import "TopPaidAppCollectionCell.h"
#import "JsonFeedParser.h"

@interface TopPaidAppViewController ()

@end

@implementation TopPaidAppViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.jsonFeed       = [[JsonFeedParser alloc]initJsonParser];
    self.topPaidAppList = [self.jsonFeed fetchAppInfoFromJsonFeed:@"http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/toppaidapplications/limit=25/json"];
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
    if(self.topPaidAppList.count == 0)
        return 25;
    else
       return self.topPaidAppList.count;
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TopPaidAppCollectionCell *topPaidAppCollectionCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TopPaidAppCell"
                                                                                                   forIndexPath:indexPath];
    return topPaidAppCollectionCell;
}


@end
