//
//  AppConstants.m
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 30/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import "TAAppConstants.h"

@implementation TAAppConstants

CGFloat const TAZeroAplhaValue      = 0.0f;

CGFloat const TAButtonBorderWidth   = 1.0f;
CGFloat const TACellBorderWidth     = 0.1f;
CGFloat const TACornerRadius        = 15.0f;

CGFloat const TAEdgeInsetTopValue    = 0.5f;
CGFloat const TAEdgeInsetRightValue  = 0.5f;
CGFloat const TAEdgeInsetBottomValue = 0.5f;
CGFloat const TAEdgeInsetLeftValue   = 0.5f;

CGFloat const TAHeaderViewRefHeight  = 44.0f;
CGFloat const TAHeaderViewRefWidth   = 768.0f;

NSString *const TATopPaidAppJsonFeed = @"http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/toppaidapplications/limit=250/json";
NSString *const TATopFreeAppJsonFeed = @"http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/topfreeapplications/limit=250/json";

NSString *const TACellIndentifier         = @"TopAppsCell";
NSString *const TAHeaderCellIndentifier   = @"TASearchHeaderView";
NSString *const TAWishListCellIndentifier = @"TAWishListCell";

NSString *const TAWishListPlist = @"WishList.plist";

@end
