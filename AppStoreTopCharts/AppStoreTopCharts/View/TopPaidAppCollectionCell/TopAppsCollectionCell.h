//
//  TopPaidAppCollectionCell.h
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 22/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TopApp;
@protocol WishListMenuDelegate <NSObject>

@optional
-(void)addToWishList:(id)sender forCell:(UICollectionViewCell*)cvCell;
@end

@interface TopAppsCollectionCell : UICollectionViewCell


@property (weak, nonatomic) IBOutlet UILabel *appNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *appImageView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *imageActivityIndicator;

@property (weak, nonatomic) id<WishListMenuDelegate> delegate;

-(void)displayAppInfoInGrid:(TopApp*)appInfo;

@end
