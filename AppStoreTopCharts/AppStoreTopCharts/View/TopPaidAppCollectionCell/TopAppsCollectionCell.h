//
//  TopPaidAppCollectionCell.h
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 22/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopAppsCollectionCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *appNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *appImageView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *imageActivityIndicator;

-(void)displayAppInfoInGrid:(NSString *)appName appImageUrl:(NSURL *)imageUrl appCategory:(NSString *)category appPrice:(NSString *)price;

@end
