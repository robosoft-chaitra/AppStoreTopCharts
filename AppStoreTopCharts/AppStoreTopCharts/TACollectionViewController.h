
//
//  ASFirstViewController.h
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 22/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TASearchHeaderView.h"
#import "TAPopUpView.h"

NS_ENUM(NSInteger, TabBarItem)
{
    TAPaidAppTabBarItem,
    TAFreeAppTabBarItem
};

@interface TACollectionViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource,TASearchAppsDelegate, TAPopUpViewDelegate>

@end
