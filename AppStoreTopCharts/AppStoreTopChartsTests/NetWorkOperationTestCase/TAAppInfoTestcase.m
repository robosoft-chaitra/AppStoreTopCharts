//
//  TANetworkOperationTestcase.m
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 31/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import "TAAppInfoTestcase.h"
#import "TAAppInfo.h"
@implementation TAAppInfoTestcase

-(id)initTopAppTestCase
{
    if(self = [self init])
    {
        NSError *error;
        self.topApps = [[NSMutableArray alloc]init];
        self.jsonData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"TopAppsFeed" ofType:@"json"]];
        self.jsonDictionary = [NSJSONSerialization JSONObjectWithData:self.jsonData
                                                               options:kNilOptions error:&error];
        if(error)
        {
            NSLog(@"Unable to Parse JsonData %@",error.localizedDescription);
        }
        else
        {
            self.appEntries = [NSArray arrayWithArray:[self.jsonDictionary valueForKeyPath:@"feed.entry"]];
    
            for (NSDictionary *appEntry in self.appEntries)
            {
                TAAppInfo *appData = [[TAAppInfo alloc] initFromAppStoreDictionary:appEntry];
                [self.topApps addObject:appData];
            }
        }
    }
    self.appInfo = [self.topApps objectAtIndex:0];
    return self;
}

@end
