//
//  ASFirstViewController.m
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 22/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import "TopPaidAppViewController.h"
#import "JsonFeedParser.h"

@interface TopPaidAppViewController ()

@end

@implementation TopPaidAppViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.jsonFeed       = [[JsonFeedParser alloc]initJsonParser];
    self.topPaidAppList = [self.jsonFeed fetchAppInfoFromJsonFeed:@"http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/toppaidapplications/limit=25/json"];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)searchTopPaidApp:(id)sender
{
    
}
@end
