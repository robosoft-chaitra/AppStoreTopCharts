//
//  TopAppConstants.h
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 23/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

#define KTopPaidAppFeed @"http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/toppaidapplications/limit=25/json"
#define KTopFreeAppFeed @"http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/topfreeapplications/limit=25/json"

#define KTopPaidChartTitle @"Top Paid Chart"
#define KTopFreeChartTitle @"Top Free Chart"

#define KTopAppCellIdentifier @"TopAppsCell"
#define KTopAppHeaderView @"TopAppHeaderView"
