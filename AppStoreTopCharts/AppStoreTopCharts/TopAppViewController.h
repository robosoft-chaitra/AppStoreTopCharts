
//
//  ASFirstViewController.h
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 22/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JsonFeedParser.h"
#import "SearchHeaderView.h"
#import "PopUpView.h"

@interface TopAppViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource,SearchAppsDelegate, PopUpViewDelegate>

@property (nonatomic, strong) NSMutableArray *wishListApps; //Array of Wishlist Apps
@property (nonatomic, strong) NSMutableArray *filteredApps; //Array of Filtered Apps
@property (nonatomic, strong) NSArray        *topApps;      //Array of TopApps

@property (nonatomic, strong) JsonFeedParser *jsonParser;   //Parse the jsonFeed async
@property (nonatomic, strong) PopUpView      *popupView ;   //popup to view details of app

@property (strong, nonatomic) UITapGestureRecognizer     *hidePopupGestureRecognizer;   //Tapgesture to hide popup
@property (strong, nonatomic) IBOutlet UICollectionView  *topAppCollectionView;

//method to search for app using AppName
- (IBAction)searchAppsByName:(id)sender;

@end
