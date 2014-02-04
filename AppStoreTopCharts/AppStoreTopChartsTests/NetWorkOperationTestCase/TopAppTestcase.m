//
//  TANetworkOperationTestcase.m
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 31/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import "TopAppTestcase.h"

@implementation TopAppTestcase

-(id)initNetWorkOperationTestCase:(NSURL*)jsonFeed
{
    if(self = [super init])
    {
        NSError *error;
        self.jsonUrl = jsonFeed;
        self.topApps = [[NSMutableArray alloc]init];
        NSData *jsonData = [NSData dataWithContentsOfURL:self.jsonUrl];
    
        self.jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData
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
        //            converting AppEntries Into TopApp Object
                self.topApp = [[TopApp alloc] initTopAppFromAppStoreDictionary:appEntry];
        //            Storing to TopApp Array
                [self.topApps addObject:self.topApp];
            }
        }
    }
    return self;
}

@end
