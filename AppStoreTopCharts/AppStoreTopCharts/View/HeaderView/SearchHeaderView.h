//
//  SearchHeaderView.h
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 24/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SearchAppsDelegate<NSObject>

-(void)searchAppByNameInGrid:(NSString *)appName;
-(void)didFinishedSearchigForApp :(NSString *)appName;

@end
@interface SearchHeaderView : UICollectionReusableView<UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *appSearchBar;
@property (weak, nonatomic)id<SearchAppsDelegate> delegate;

@end
