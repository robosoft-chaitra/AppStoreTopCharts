//
//  PopUpView.h
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 24/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TAPopUpViewDelegate <NSObject>
//CR: Delegate methods should always pass the view which delegate is listening from.
//Ex, -(void)popUpViewDidAppear:(TAPopUpView*)popUpView;

//method to hide/Show popup on collectionview
-(void)popUpViewDidAppear;
//hiding the popup when cancelButton clicked
-(void)popUpViewCancelButtonClicked;
//loading the app To WishList
-(void)addAppToWishList:(NSString*)appName;

@end

@interface TAPopUpView : UIView

@property (weak, nonatomic) IBOutlet UILabel *appNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *copyrightLabel;
@property (weak, nonatomic) IBOutlet UILabel *releseDateLabel; //CR: Correct the typo should be releaseDateLabel
@property (weak, nonatomic) IBOutlet UIImageView *appImageView;
@property (weak, nonatomic) IBOutlet UITextView *summaryTextField;
@property (weak, nonatomic) IBOutlet UIButton *priceButton;
@property (weak, nonatomic) IBOutlet UIButton *wishListButton;
@property (weak, nonatomic) IBOutlet UIButton *referenceLinkButton;

@property (weak,   nonatomic) id<TAPopUpViewDelegate> delegate;

//loading the nibFile of popup from Bundle CR:This is instead, loading view from the nib
+ (id)popUpView;

//Start Animating the popup
-(void)startAnimation:(TopApp*)topApp; //CR: Comment is redundant. Method name is too abstract.

- (IBAction)hideView:(id)sender;
- (IBAction)installApp:(id)sender;
- (IBAction)addToWishList:(id)sender;
- (IBAction)showReferenceLink:(id)sender;


@end
