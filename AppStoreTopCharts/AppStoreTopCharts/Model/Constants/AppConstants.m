//
//  AppConstants.m
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 30/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import "AppConstants.h"

@implementation AppConstants

CGFloat const KButtonBorderWidth    = 1.0f;
CGFloat const KCellBorderWidth      = 0.1f;
CGFloat const KCornerRadius         = 15.0f;
CGFloat const KZeroAplhaValue       = 0.0f;

CGFloat const KEdgeInsetTopValue    = 0.5f;
CGFloat const KEdgeInsetRightValue  = 0.5f;
CGFloat const KEdgeInsetBottomValue = 0.5f;
CGFloat const KEdgeInsetLeftValue   = 0.5f;

CGFloat const KHeaderViewZeroHeight = 0.0f;
CGFloat const KHeaderViewZeroWidth  = 0.0f;

CGFloat const KHeaderViewRefHeight  = 44.0f;
CGFloat const KHeaderViewRefWidth   = 768.0f;

NSString *const kTopPaidAppJsonFeed = @"http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/toppaidapplications/limit=100/json";
NSString *const kTopFreeAppJsonFeed = @"http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/topfreeapplications/limit=100/json";

NSString *const kAppCellIndentifier = @"TopAppsCell";
NSString *const kHeaderCellIndentifier = @"SearchHeaderView";

@end
