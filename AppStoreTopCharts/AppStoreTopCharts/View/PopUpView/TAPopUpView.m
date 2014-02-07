//
//  PopUpView.m
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 24/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import "TAPopUpView.h"
#import "AsyncImageView.h"

@interface TAPopUpView()

@property (weak, nonatomic) IBOutlet UILabel *appNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *copyrightLabel;
@property (weak, nonatomic) IBOutlet UILabel *releaseDateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *appImageView;
@property (weak, nonatomic) IBOutlet UITextView *summaryTextField;
@property (weak, nonatomic) IBOutlet UIButton *priceButton;
@property (weak, nonatomic) IBOutlet UIButton *wishListButton;
@property (weak, nonatomic) IBOutlet UIButton *referenceLinkButton;

- (IBAction)installApp:(id)sender;
- (IBAction)addToWishList:(id)sender;
- (IBAction)showReferenceLink:(id)sender;

@end


@implementation TAPopUpView

+ (id)popUpView
{
    TAPopUpView *popUpView;
//    loading the view based on Device
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        popUpView = [[[NSBundle mainBundle] loadNibNamed:@"TAPopUpViewiPad" owner:nil options:nil] lastObject];
    }
    else
    {
        popUpView = [[[NSBundle mainBundle] loadNibNamed:@"TAPopUpView" owner:nil options:nil] lastObject];
    }
    
    if ([popUpView isKindOfClass:[TAPopUpView class]])
        return popUpView;
    else
        return nil;
}

#pragma mark - Animation Methods

-(void)startAnimatingPopupView:(TAAppInfo*)appInfo
{
    [self setUpUI];
    [UIView animateWithDuration:0.2
                     animations:^(void){
                         self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
                         self.alpha = 0.5f;
                         [self displayDetailsInPopUpView:appInfo];
                        }
                     completion:^(BOOL finished){
                         [self bounceOutAnimationStopped];
                     }];
    
}

-(void) bounceOutAnimationStopped
{
    [UIView animateWithDuration:0.1
                     animations:^(void){
                         self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
                         self.alpha = 0.8f;
                       
                        }
                     completion:^(BOOL finished){
                         [self bounceInAnimationStopped];
                         
                     }];
}

-(void) bounceInAnimationStopped
{
    [UIView animateWithDuration:0.1
                     animations:^(void){
                         self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
                         self.alpha = 1.0f;
                     }
                     completion:^(BOOL finished){
                         [self animationStopped];
                     }];
}

-(void)animationStopped
{
//    method to Disable scrolling of collectionview
    [self.delegate popUpViewDidAppear:self];
}

#pragma mark - IBAction methods

- (IBAction)hideView:(id)sender
{
//    hiding the popup & enabling scrolling of collectionview
    self.alpha = 0.0f;
    [self.delegate popUpViewCancelButtonClicked];
}

- (IBAction)installApp:(id)sender
{
//    Method to Install app
    [self.priceButton setTitle:@"INSTALL" forState:UIControlStateNormal];

}

- (IBAction)addToWishList:(id)sender
{
//    delegate method to add to WishList
    [self.delegate addAppToWishList:self.appNameLabel.text];
}

- (IBAction)showReferenceLink:(id)sender
{
    NSLog(@"reference link = %@",self.referenceLinkButton.titleLabel.text);
}

#pragma mark - Display AppDetails methods

-(void)displayDetailsInPopUpView:(TAAppInfo*)topApp
{
//    to display appDetails in Popup
    self.appNameLabel.text     = topApp.appName;
    self.categoryLabel.text    = topApp.category;
    self.authorLabel.text      = topApp.authorName;
    self.copyrightLabel.text   = topApp.copyright;
    self.releaseDateLabel.text = topApp.releaseDate;
    self.summaryTextField.text = topApp.summary;
    self.appImageView.imageURL = topApp.appImageUrl;
    
    [self.priceButton setTitle:topApp.price forState:UIControlStateNormal];
    [self.referenceLinkButton setTitle:topApp.referenceLink forState:UIControlStateNormal];
}

-(void)setUpUI
{
//  method to  add Border to button & popup View
    self.layer.borderWidth  = TAButtonBorderWidth;
    self.layer.borderColor  = [[UIColor lightGrayColor] CGColor];
    self.layer.cornerRadius = TACornerRadius;
    self.priceButton.layer.borderWidth = TAButtonBorderWidth;
    self.priceButton.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.wishListButton.layer.borderWidth = TAButtonBorderWidth;
    self.wishListButton.layer.borderColor = [[UIColor lightGrayColor] CGColor];
}

@end
