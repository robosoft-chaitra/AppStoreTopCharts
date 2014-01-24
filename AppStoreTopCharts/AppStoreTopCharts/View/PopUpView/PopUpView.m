//
//  PopUpView.m
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 24/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import "PopUpView.h"

@implementation PopUpView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (IBAction)hideView:(id)sender
{
    self.alpha = 0.0f;
    self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.6, 0.6);
    [self removeFromSuperview];
    
}

+ (id)popUpView
{
    PopUpView *popUpView = [[[NSBundle mainBundle] loadNibNamed:@"PopUpView" owner:nil options:nil] lastObject];
    
    // make sure customView is not nil or the wrong class!
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
                         self.alpha = 0.5;
                         NSLog(@"uiview pror=%@",[self description]);
                         //                         NSLog(@"alph=%f",self.alpha);
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
                         self.alpha = 0.8;
                         NSLog(@"uiview pror=%@",[self description]);
                         //                          NSLog(@"alph=%f",self.alpha);
                     }
                     completion:^(BOOL finished){
                         [self bounceInAnimationStopped];
                         
                     }];
}

-(void) bounceInAnimationStopped
{
    [UIView animateWithDuration:0.1 animations:^(void){
        self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
        self.alpha = 1;
        NSLog(@"uiview pror=%@",[self description]);
        //         NSLog(@"alph=%f",self.alpha);
    }completion:^(BOOL finished){
        [self animationStopped];
    }];
}

-(void)animationStopped
{
    
}

@end
