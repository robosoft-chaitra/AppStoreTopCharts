//
//  PopUpView.m
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 24/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import "PopUpView.h"

@implementation PopUpView

- (IBAction)hideView:(id)sender
{
    self.alpha = 0.0f;
    [self.delegate popUpViewCancelButtonClicked];
}
    
+ (id)popUpView
{
    PopUpView *popUpView = [[[NSBundle mainBundle] loadNibNamed:@"PopUpView" owner:nil options:nil] lastObject];
    
    if ([popUpView isKindOfClass:[PopUpView class]])
        return popUpView;
    else
        return nil;
}

-(void)startAnimation
{
    [UIView animateWithDuration:0.2
                     animations:^(void){
                         self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
                         self.alpha = 0.5f;
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
    [self.delegate popUpViewDidAppear];
    [self displayDetailsInPopUpView];
}

-(void)displayDetailsInPopUpView
{
    self.appNameLabel.text    = self.topApp.appName;
    self.categoryLabel.text   = self.topApp.category;
    self.authorLabel.text     = self.topApp.authorName;
    self.priceLabel.text      = self.topApp.price;
    self.copyrightLabel.text  = self.topApp.copyright;
    self.releseDateLabel.text = self.topApp.releaseDate;
    self.refLinkLabel.text    = self.topApp.referenceLink;
    self.summaryTextField.text= self.topApp.summary;
    self.appImageView.image   = [UIImage imageWithData:[NSData dataWithContentsOfURL:self.topApp.appImageUrl]];
}

@end
