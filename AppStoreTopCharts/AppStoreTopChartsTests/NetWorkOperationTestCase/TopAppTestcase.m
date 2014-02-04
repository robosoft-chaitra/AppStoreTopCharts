//
//  TANetworkOperationTestcase.m
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 31/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import "TopAppTestcase.h"

@implementation TopAppTestcase

-(id)initTopAppTestCase
{
    if(self = [super init])
    {
        NSError *error;
        self.topApps = [[NSMutableArray alloc]init];
        self.jsonData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"TopAppsFeed" ofType:@"json"]];
        self.jsonDictionary = [NSJSONSerialization JSONObjectWithData:self.jsonData
                                                               options:kNilOptions error:&error];
        if(error)
        {
            NSLog(@"Unable to Parse JsonData");
        }
        else
        {
            self.appEntries = [NSArray arrayWithArray:[self.jsonDictionary valueForKeyPath:@"feed.entry"]];
    
            for (NSDictionary *appEntry in self.appEntries)
            {
                self.topApp = [[TopApp alloc] initTopAppFromAppStoreDictionary:appEntry];
                [self.topApps addObject:self.topApp];
            }
        }
    }
    return self;
}

@end
