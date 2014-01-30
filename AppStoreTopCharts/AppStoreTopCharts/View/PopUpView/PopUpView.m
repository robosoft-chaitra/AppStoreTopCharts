//
//  PopUpView.m
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 24/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import "PopUpView.h"

@implementation PopUpView

+ (id)popUpView
{
    PopUpView *popUpView;
//    loading the popup based on Device
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        popUpView = [[[NSBundle mainBundle] loadNibNamed:@"PopUpViewiPad" owner:nil options:nil] lastObject];
    }
    else
    {
        popUpView = [[[NSBundle mainBundle] loadNibNamed:@"PopUpViewiPhone" owner:nil options:nil] lastObject];
    }
    
    if ([popUpView isKindOfClass:[PopUpView class]])
        return popUpView;
    else
        return nil;
}

#pragma mark - Animation Methods

//start animating the popup & Displaying Info
-(void)startAnimation:(TopApp*)topApp
{
    [self setUpUI];
    [UIView animateWithDuration:0.2
                     animations:^(void){
                         self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
                         self.alpha = 0.5f;
                         [self displayDetailsInPopUpView:topApp];
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
    [self.delegate popUpViewDidAppear];
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
//    TODO: method to go to RefeneceLink site
}

#pragma mark - Display AppDetails methods

-(void)displayDetailsInPopUpView:(TopApp*)topApp
{
    //    to display appDetails in Popup
    self.appNameLabel.text    = topApp.appName;
    self.categoryLabel.text   = topApp.category;
    self.authorLabel.text     = topApp.authorName;
    self.copyrightLabel.text  = topApp.copyright;
    self.releseDateLabel.text = topApp.releaseDate;
    self.summaryTextField.text= topApp.summary;
    self.appImageView.image   = [UIImage imageWithData:[NSData dataWithContentsOfURL:topApp.appImageUrl]];
    [self.priceButton setTitle:topApp.price forState:UIControlStateNormal];
    [self.referenceLinkButton setTitle:topApp.referenceLink forState:UIControlStateNormal];
}

-(void)setUpUI
{
//  method to  add Border to button & popup View
    self.layer.borderWidth = KBorderWidth;
    self.layer.borderColor = KBorderColor;
    self.layer.cornerRadius = KCornerRadius;
    self.priceButton.layer.borderWidth = KBorderWidth;
    self.priceButton.layer.borderColor = KBorderColor;
    self.wishListButton.layer.borderWidth = KBorderWidth;
    self.wishListButton.layer.borderColor = KBorderColor;
}

@end
