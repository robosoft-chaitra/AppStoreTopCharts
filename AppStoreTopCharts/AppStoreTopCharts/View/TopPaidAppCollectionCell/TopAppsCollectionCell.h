//
//  TopPaidAppCollectionCell.h
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 22/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TopApp;

@interface TopAppsCollectionCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *appNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIImageView  *appImageView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *imageActivityIndicator;

//method to display App Info in CollectionView cell
-(void)displayAppInfoInGrid:(TopApp*)appInfo;

@end
