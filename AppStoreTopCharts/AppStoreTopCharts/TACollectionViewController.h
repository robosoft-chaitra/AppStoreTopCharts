
//
//  ASFirstViewController.h
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 22/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TANetworkOperationCenter.h"
#import "TASearchHeaderView.h"
#import "TAPopUpView.h"

//CR: Use these - NS_ENUM(<#_type#>, <#_name#>)
NS_ENUM(NSInteger, AppTabBarItem)
{
    TAPaidAppTabBarItem,
    TAFreeAppTabBarItem
};


@interface TACollectionViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource,TASearchAppsDelegate, TAPopUpViewDelegate,TANetworkOperationsDelegate>


@end
