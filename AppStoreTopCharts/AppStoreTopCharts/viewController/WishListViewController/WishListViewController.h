//
//  WishListViewController.h
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 29/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TopApp;
@interface WishListViewController : UITableViewController

@property(nonatomic, retain) NSMutableArray *selectedApps;
@property(nonatomic, retain) NSMutableArray *appDictionaryList;

@end
