//
//  SearchHeaderView.h
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 24/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TASearchAppsDelegate<NSObject>

//Delegate method to search for app using appName
-(void)didSearchForApps:(NSString *)appName reference:(UISearchBar*)refSearchBar;

@end

@interface TASearchHeaderView : UICollectionReusableView<UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *appSearchBar;
@property (weak, nonatomic)id<TASearchAppsDelegate> delegate;

@end
