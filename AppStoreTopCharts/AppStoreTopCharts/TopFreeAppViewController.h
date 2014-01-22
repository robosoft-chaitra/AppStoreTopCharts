//
//  ASSecondViewController.h
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 22/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JsonFeedParser;
@interface TopFreeAppViewController : UIViewController

@property (nonatomic, strong) JsonFeedParser *jsonFeed;

@end
