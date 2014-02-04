//
//  WishListCell.h
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 29/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WishListCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *appImageView;
@property (weak, nonatomic) IBOutlet UILabel *appNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UIButton *priceButton;

//IBAction: ToInstall APP
- (IBAction)installApp:(id)sender;

//Method to display the AppInfo on wishListCell
- (void)displayAppInfoForWishListApp:(TopApp*)wishListApp;

@end
