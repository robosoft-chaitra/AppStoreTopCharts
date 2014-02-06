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
//CR: Delegate methods should always pass the view which delegate is listening from.
//Ex, -(void)popUpViewDidAppear:(TAPopUpView*)popUpView;

//method to hide/Show popup on collectionview
-(void)popUpViewDidAppear:(TAPopUpView*)popUpView;
//hiding the popup when cancelButton clicked
-(void)popUpViewCancelButtonClicked;
//loading the app To WishList
-(void)addAppToWishList:(NSString*)appName;

@end

@interface TAPopUpView : UIView

@property (weak,   nonatomic) id<TAPopUpViewDelegate> delegate;

//loading the nibFile of popup from Bundle CR:This is instead, loading view from the nib
+ (id)popUpView;

//Start Animating the popup
-(void)startAnimatingPopupView:(TAAppInfo*)appInfo; //CR: Comment is redundant. Method name is too abstract.
- (IBAction)hideView:(id)sender;


@end
