//
//  PopUpView.h
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 24/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopUpView : UIView
- (IBAction)hideView:(id)sender;

+ (id)popUpView;
-(void)startAnimation;
@end
