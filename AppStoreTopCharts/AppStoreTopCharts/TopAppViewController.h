//
//  ASFirstViewController.h
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 22/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JsonFeedParser;

@interface TopAppViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) NSArray        *topAppsList;
@property (nonatomic, strong) JsonFeedParser *jsonParser;

@end
