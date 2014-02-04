//
//  TANetworkOperationTestcase.h
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 31/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import "TANetworkOperationCenter.h"

@interface TopAppTestcase : TopApp

@property (nonatomic, strong) NSURL *jsonUrl;
@property (nonatomic, strong) NSDictionary *jsonDictionary;
@property (nonatomic, strong) NSMutableArray *topApps;
@property (nonatomic, strong) NSArray *appEntries;
@property (nonatomic, strong) TopApp *topApp;

-(id)initNetWorkOperationTestCase:(NSURL*)jsonFeed;

@end
