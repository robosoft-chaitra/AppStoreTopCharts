//
//  TopPaidAppCollectionCell.m
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 22/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import "TopAppsCollectionCell.h"
#import "TANetworkOperationCenter.h"


@implementation TopAppsCollectionCell

#pragma mark - Display AppInfo

//Method to Display appInfo in grid of UIcollectionView
-(void)displayAppInfoInGrid:(TopApp*)appInfo
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
    
    self.layer.borderWidth  = KCellBorderWidth;
    self.layer.borderColor  = [[UIColor lightGrayColor] CGColor];
    self.layer.cornerRadius = KCornerRadius;
    self.appNameLabel.text  = self.topApp.appName;
    self.categoryLabel.text = self.topApp.category;
    self.priceLabel.text    = self.topApp.price;
    self.appImageView.image = [UIImage imageWithData:self.imageData];
}



@end
