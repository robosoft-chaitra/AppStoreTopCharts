
//
//  ASFirstViewController.h
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 22/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchHeaderView.h"


@class JsonFeedParser;
@interface TopAppViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource,SearchAppsDelegate>

@property (nonatomic, strong) NSMutableArray *filteredApps;
@property (nonatomic, strong) NSArray        *topApps;
@property (nonatomic, strong) JsonFeedParser *jsonParser;

@property (strong, nonatomic) IBOutlet UICollectionView *topAppCollectionView;
- (IBAction)searchAppsByName:(id)sender;

@end
