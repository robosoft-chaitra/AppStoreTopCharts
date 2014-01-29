//
//  PopUpView.h
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 24/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TopApp;
@protocol PopUpViewDelegate <NSObject>

//method to hide/Show popup on collectionview
-(void)popUpViewDidAppear;
-(void)popUpViewCancelButtonClicked;
-(void)addAppToWishList:(NSString*)appName;

@end

@interface PopUpView : UIView

@property (weak, nonatomic) IBOutlet UILabel *appNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *copyrightLabel;
@property (weak, nonatomic) IBOutlet UILabel *releseDateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *appImageView;
@property (weak, nonatomic) IBOutlet UITextView *summaryTextField;
@property (weak, nonatomic) IBOutlet UIButton *priceButton;
@property (weak, nonatomic) IBOutlet UIButton *wishListButton;
@property (weak, nonatomic) IBOutlet UIButton *referenceLinkButton;

@property (weak,   nonatomic) id<PopUpViewDelegate> delegate;

+ (id)popUpView;

-(void)startAnimation:(TopApp*)topApp;

- (IBAction)hideView:(id)sender;
- (IBAction)installApp:(id)sender;
- (IBAction)addToWishList:(id)sender;
- (IBAction)showReferenceLink:(id)sender;


@end
