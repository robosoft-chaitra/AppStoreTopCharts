//
//  WishListCell.h
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 29/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TAWishListCell : UITableViewCell

//Method to display the AppInfo on wishListCell
- (void)configureWith:(TAAppInfo*)wishListAppInfo;

@end
