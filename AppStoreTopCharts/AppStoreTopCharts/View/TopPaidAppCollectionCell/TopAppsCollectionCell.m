//
//  TopPaidAppCollectionCell.m
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 22/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import "TopAppsCollectionCell.h"
#import "TANetworkOperationCenter.h"

@interface TopAppsCollectionCell()

@property (strong, nonatomic) TAAppInfo *topApp;
@property (strong, nonatomic) NSData *imageData;

@property (weak, nonatomic) IBOutlet UILabel *appNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIImageView  *appImageView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *imageActivityIndicator;

@end

@implementation TopAppsCollectionCell

#pragma mark - Display AppInfo

-(void)configureAppInfo:(TAAppInfo*)appInfo
{
    self.topApp = appInfo;
//    initializing the URLConnection to server with appImageURL
    TANetworkOperationCenter *networkCenter = [[TANetworkOperationCenter alloc]initNetworkConnectionFromURL:appInfo.appImageUrl];
    networkCenter.delegate = self;
}


#pragma  mark - NetWEorkOPeration Delegate Methods

-(void)didStartReceivingResponseFromServer
{
//    Initialzing the  image data when Start recieving response From server
    self.appImageView.image = nil;
    [self.imageActivityIndicator startAnimating];
    self.imageData = [[NSData alloc]init];
}

-(void)didReceiveDataFromResponseData:(NSData*)responseData
{
//    loading data received from server to imagedata
    self.imageData = responseData;
}

-(void)didFinishLoadingDataFromServer
{
//    displaying the App DEtails in collectionview cell
    [self.imageActivityIndicator stopAnimating];
    [self.imageActivityIndicator setHidesWhenStopped:YES];
    
    self.layer.borderWidth  = TACellBorderWidth;
    self.layer.borderColor  = [[UIColor lightGrayColor] CGColor];
    self.layer.cornerRadius = TACornerRadius;
    self.appNameLabel.text  = self.topApp.appName;
    self.categoryLabel.text = self.topApp.category;
    self.priceLabel.text    = self.topApp.price;
    self.appImageView.image = [UIImage imageWithData:self.imageData];
}



@end
