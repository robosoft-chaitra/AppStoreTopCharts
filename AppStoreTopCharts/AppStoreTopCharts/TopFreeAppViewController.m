//
//  ASSecondViewController.m
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 22/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import "TopFreeAppViewController.h"
#import "JsonFeedParser.h"

@interface TopFreeAppViewController ()

@end

@implementation TopFreeAppViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.jsonFeed       = [[JsonFeedParser alloc]initJsonParser];
    self.topFreeAppList = [self.jsonFeed fetchAppInfoFromJsonFeed:@"http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/topfreeapplications/limit=25/json"];
   
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
     NSLog(@"new array count= %d",self.topFreeAppList.count);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

@end
