//
//  PopUpView.h
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 24/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopApp.h"

@protocol PopUpViewDelegate <NSObject>

-(void)popUpViewDidAppear;
-(void)popUpViewCancelButtonClicked;

@end

@interface PopUpView : UIView

@property (weak, nonatomic) IBOutlet UILabel *appNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *copyrightLabel;
@property (weak, nonatomic) IBOutlet UILabel *releseDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *refLinkLabel;
@property (weak, nonatomic) IBOutlet UIImageView *appImageView;
@property (weak, nonatomic) IBOutlet UITextView *summaryTextField;

@property (weak,   nonatomic) id<PopUpViewDelegate> delegate;
@property (strong, nonatomic) TopApp *topApp;

+ (id)popUpView;
- (void)startAnimation;
- (IBAction)hideView:(id)sender;

@end
