//
//  WishListCell.m
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 29/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import "TAWishListCell.h"
#import "AsyncImageView.h"

@interface TAWishListCell()

@property (weak, nonatomic) IBOutlet UIImageView *appImageView;
@property (weak, nonatomic) IBOutlet UILabel *appNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UIButton *priceButton;

//IBAction: ToInstall APP
- (IBAction)installApp:(id)sender;

@end

@implementation TAWishListCell

-(void)configureWith:(TAAppInfo *)wishListAppInfo
{
    self.appNameLabel.text  = wishListAppInfo.appName;
    self.categoryLabel.text = wishListAppInfo.category;
    self.authorLabel.text   = wishListAppInfo.authorName;
    self.appImageView.imageURL = wishListAppInfo.appImageUrl;
    
    [self.priceButton setTitle:wishListAppInfo.price forState:UIControlStateNormal];
    self.priceButton.layer.borderWidth = 1.0;
    self.priceButton.layer.borderColor = [[UIColor lightGrayColor] CGColor];
}

#pragma mark - IBAction: Install App
- (IBAction)installApp:(id)sender
{
    UIAlertView *installAlert = [[UIAlertView alloc]initWithTitle:@"Install APP" message:[NSString stringWithFormat:@"Would you like to Install App:%@",self.appNameLabel.text] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:Nil, nil];
    [installAlert show];
}

@end
