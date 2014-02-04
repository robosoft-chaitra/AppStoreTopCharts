//
//  WishListViewController.h
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 29/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WishListViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *selectedApps;
@property (nonatomic, strong) NSMutableArray *appDictionaryList;
@property (nonatomic, strong) NSString *appDocumentDirectoryPath;

@end
