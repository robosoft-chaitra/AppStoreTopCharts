//
//  ASFirstViewController.h
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 22/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JsonFeedParser;

@interface TopPaidAppViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) NSArray        *topPaidAppList;
@property (nonatomic, strong) JsonFeedParser *jsonFeed;

@end
