
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
typedef enum
{
    KTopPaidAppTabBarItemIndex,
    KTopFreeAppTabBarItemIndex
    
}TabBarItem;

@interface TACollectionViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource,TASearchAppsDelegate, TAPopUpViewDelegate,TANetworkOperationsDelegate>

@property (nonatomic, strong) NSMutableArray *wishListApps; //Array of Wishlist Apps
@property (nonatomic, strong) NSMutableArray *filteredApps; //Array of Filtered Apps
@property (nonatomic, strong) NSMutableArray *topApps;      //Array of TopApps

//CR: StandardPaths of Nick Lockwood
@property (nonatomic, strong) NSString  *appDocumentDirectoryPath; //Document directory Path
@property (nonatomic, strong) TAPopUpView *popupView ;   //popup to view details of app

@property (strong, nonatomic) UITapGestureRecognizer     *hidePopupGestureRecognizer;   //Tapgesture to hide popup

//CR: Always have the outlets in .m
@property (strong, nonatomic) IBOutlet UICollectionView  *topAppCollectionView;

//method to search for app using AppName
- (IBAction)searchAppsByName:(id)sender;

@end
