//
//  TopPaidAppCollectionCell.m
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 22/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import "TopAppsCollectionCell.h"
#import "TopApp.h"

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) 

@implementation TopAppsCollectionCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

#pragma mark - Display AppInfo

//Method to Display appInfo in grid of UIcollectionView
-(void)displayAppInfoInGrid:(TopApp*)appInfo
{
    [self.imageActivityIndicator startAnimating];
    dispatch_async(kBgQueue, ^{
        NSData* data = [NSData dataWithContentsOfURL: appInfo.appImageUrl];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self performSelector:@selector(displayAppImage:) withObject:data];
        });
    });
    self.layer.borderWidth  = 0.1f;
    self.layer.borderColor  = [[UIColor lightGrayColor] CGColor];
    self.layer.cornerRadius = 10.0f;
    self.appNameLabel.text  = appInfo.appName;
    self.categoryLabel.text = appInfo.category;
    self.priceLabel.text    = appInfo.price;
}

//Method to display appImage Async
- (void)displayAppImage:(NSData *)imageData
{
     NSError* error;
    
    [self.imageActivityIndicator stopAnimating];
    [self.imageActivityIndicator setHidesWhenStopped:YES];

    if (error == nil && [imageData length] > 0)
    {
        self.appImageView.image = [UIImage imageWithData:imageData];
    }
    
    else if ([imageData length] == 0 && error == nil)
    {
        NSLog(@"Nothing was downloaded.");
    }
    
    else if (error != nil){
        NSLog(@"Error = %@", [error userInfo]);
    }
}

@end
