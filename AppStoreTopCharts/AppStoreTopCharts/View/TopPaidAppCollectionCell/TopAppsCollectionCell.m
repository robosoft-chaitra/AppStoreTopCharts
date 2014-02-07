//
//  TopPaidAppCollectionCell.m
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 22/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import "TopAppsCollectionCell.h"
#import "AsyncImageView.h"

@interface TopAppsCollectionCell()

@property (strong, nonatomic) NSData *imageData;

@property (weak, nonatomic) IBOutlet UILabel *appNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIImageView  *appImageView;

@end

@implementation TopAppsCollectionCell

#pragma mark - Display AppInfo

-(void)configureWith:(TAAppInfo *)appInfo
{
    self.layer.borderWidth  = TACellBorderWidth;
    self.layer.borderColor  = [[UIColor lightGrayColor] CGColor];
    self.layer.cornerRadius = TACornerRadius;
    
    self.appNameLabel.text  = appInfo.appName;
    self.categoryLabel.text = appInfo.category;
    self.priceLabel.text    = appInfo.price;
    self.appImageView.imageURL = appInfo.appImageUrl;
}

@end
