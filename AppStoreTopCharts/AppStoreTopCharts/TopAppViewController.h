
//
//  ASFirstViewController.h
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 22/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TANetworkOperationCenter.h"
#import "SearchHeaderView.h"
#import "PopUpView.h"

typedef enum
{
    KTopPaidAppTabBarItemIndex,
    KTopFreeAppTabBarItemIndex
    
}TabBarItem;

@interface TopAppViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource,SearchAppsDelegate, PopUpViewDelegate,NetworkOperationsDelegate>

@property (nonatomic, strong) NSMutableArray *wishListApps; //Array of Wishlist Apps
@property (nonatomic, strong) NSMutableArray *filteredApps; //Array of Filtered Apps
@property (nonatomic, strong) NSMutableArray *topApps;      //Array of TopApps

@property (nonatomic, strong) NSString  *appDocumentDirectoryPath; //Document directory Path
@property (nonatomic, strong) PopUpView *popupView ;   //popup to view details of app

@property (strong, nonatomic) UITapGestureRecognizer     *hidePopupGestureRecognizer;   //Tapgesture to hide popup
@property (strong, nonatomic) IBOutlet UICollectionView  *topAppCollectionView;

//method to search for app using AppName
- (IBAction)searchAppsByName:(id)sender;

@end
