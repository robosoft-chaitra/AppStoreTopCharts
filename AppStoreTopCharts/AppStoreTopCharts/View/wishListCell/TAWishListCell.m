//
//  WishListCell.m
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 29/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import "TAWishListCell.h"

@implementation TAWishListCell

-(void)displayAppInfoForWishListApp:(TopApp *)wishListApp
{
    //CR: Remove the following comment. What a method does should be
    //be explained in header, and not
//  method to display WishList app on tableview
    self.appNameLabel.text  = wishListApp.appName;
    self.categoryLabel.text = wishListApp.category;
    self.authorLabel.text   = wishListApp.authorName;
    
    //CR: Image is being loaded synchronously. Potential performance issue.
    //Check AsyncImageView at: https://github.com/nicklockwood/AsyncImageView
    self.appImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:wishListApp.appImageUrl]];
    [self.priceButton setTitle:wishListApp.price forState:UIControlStateNormal];
    self.priceButton.layer.borderWidth = 1.0;
    self.priceButton.layer.borderColor = [[UIColor lightGrayColor] CGColor];
}

#pragma mark - IBAction: Install App
- (IBAction)installApp:(id)sender
{
//    Method to Install APP
    UIAlertView *installAlert = [[UIAlertView alloc]initWithTitle:@"Install APP" message:[NSString stringWithFormat:@"Would you like to Install App:%@",self.appNameLabel.text] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:Nil, nil];
    [installAlert show];
}

@end
