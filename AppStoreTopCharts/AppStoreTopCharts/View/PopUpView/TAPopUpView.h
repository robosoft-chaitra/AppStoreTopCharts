//
//  PopUpView.h
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 24/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TAPopUpView;

@protocol TAPopUpViewDelegate <NSObject>

//method to hide/Show popup on collectionview
-(void)popUpViewDidAppear:(TAPopUpView*)popUpView;

//hiding the popup when cancelButton clicked
-(void)popUpViewCancelButtonClicked;

//loading the app To WishList
-(void)addAppToWishList:(NSString*)appName;

@end

@interface TAPopUpView : UIView

@property (weak,   nonatomic) id<TAPopUpViewDelegate> delegate;

//loading view from the nib
+ (id)popUpView;

//start animating the popup with bouncing effect & Displaying appInfo
-(void)startAnimatingPopupView:(TAAppInfo*)appInfo;

//hiding the popupview 
- (IBAction)hideView:(id)sender;

@end
