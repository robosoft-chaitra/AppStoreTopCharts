//
//  TopPaidAppCollectionCell.h
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 22/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopAppsCollectionCell : UICollectionViewCell

//method to display App Info in CollectionView cell
-(void)configureWith:(TAAppInfo*)appInfo;

@end
