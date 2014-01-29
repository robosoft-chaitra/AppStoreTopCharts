//
//  WishListCell.m
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 29/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import "WishListCell.h"
#import "TopApp.h"
@implementation WishListCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)displayAppInfoForWishListApp:(TopApp *)wishListApp
{

    self.appNameLabel.text  = wishListApp.appName;
    self.categoryLabel.text = wishListApp.category;
    self.authorLabel.text   = wishListApp.authorName;
    self.appImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:wishListApp.appImageUrl]];
    [self.priceButton setTitle:wishListApp.price forState:UIControlStateNormal];
    self.priceButton.layer.borderWidth = KBorderWidth;
    self.priceButton.layer.borderColor = KBorderColor;
}

- (IBAction)installApp:(id)sender {
}
@end
