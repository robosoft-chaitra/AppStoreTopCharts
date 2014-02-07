//
//  TANetworkOperationTestcase.h
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 31/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

@class TAAppInfo;
@interface TAAppInfoTestcase : NSObject

@property (nonatomic, strong) NSData *jsonData;
@property (nonatomic, strong) NSDictionary *jsonDictionary;
@property (nonatomic, strong) NSMutableArray *topApps;
@property (nonatomic, strong) NSArray *appEntries;
@property (nonatomic, strong) TAAppInfo *appInfo;

-(id)initTopAppTestCase;

@end
