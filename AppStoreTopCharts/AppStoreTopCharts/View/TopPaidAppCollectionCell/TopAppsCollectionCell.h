//
//  TopPaidAppCollectionCell.h
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 22/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TANetworkOperationCenter.h"


@interface TopAppsCollectionCell : UICollectionViewCell<NSURLConnectionDataDelegate, NSURLConnectionDelegate, TANetworkOperationsDelegate>

//method to display App Info in CollectionView cell
-(void)configureAppInfo:(TAAppInfo*)appInfo;

@end
