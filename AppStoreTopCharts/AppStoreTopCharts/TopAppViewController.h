
//
//  ASFirstViewController.h
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 22/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchHeaderView.h"
#import "PopUpView.h"

@class PopUpView;
@class JsonFeedParser;

@interface TopAppViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource,SearchAppsDelegate, PopUpViewDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, strong) NSMutableArray *filteredApps;
@property (nonatomic, strong) NSArray        *topApps;
@property (nonatomic, strong) JsonFeedParser *jsonParser;
@property (nonatomic, strong) PopUpView      *popupView ;

@property (strong, nonatomic) UITapGestureRecognizer       *hidePopupGestureRecognizer;
@property (strong, nonatomic) UILongPressGestureRecognizer *wishListGestureReognizer;
@property (strong, nonatomic) IBOutlet UICollectionView   *topAppCollectionView;
- (IBAction)searchAppsByName:(id)sender;
@end
