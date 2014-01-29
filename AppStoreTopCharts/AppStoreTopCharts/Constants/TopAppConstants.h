//
//  TopAppConstants.h
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 23/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

#define KAppDirectoryPath [[ NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]stringByAppendingPathComponent:@"WishList.plist"]

#define KTopPaidAppFeed @"http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/toppaidapplications/limit=100/json"
#define KTopFreeAppFeed @"http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/topfreeapplications/limit=100/json"

#define KTopPaidChartTitle @"Top Paid Chart"
#define KTopFreeChartTitle @"Top Free Chart"

#define KWishListCellIdentifier @"WishListCell"
#define KTopAppCellIdentifier   @"TopAppsCell"
#define KTopAppHeaderView       @"TopAppHeaderView"

#define KCollectionViewEdgeInset UIEdgeInsetsMake(5.0f, 5.0f, 5.0f, 5.0f)
#define KHeaderViewZeroSize CGSizeMake(0, 0)
#define KHeaderViewRefSize CGSizeMake(768, 44)

#define KBorderWidth 1.0
#define KBorderColor [[UIColor lightGrayColor] CGColor]
#define KCornerRadius 15.0

#define KWishListKey @"WishList"
