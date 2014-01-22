//
//  TopApp.m
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 22/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import "TopApp.h"

@implementation TopApp

// designated initalizer for topApp 
-(id)initTopAppFromAppStoreDict:(NSDictionary *)appDictionary
{
    if(self = [super init])
    {
        self.appName       = [[appDictionary valueForKey:@"im:name"] valueForKey:@"label"];
        self.authorName    = [[appDictionary valueForKey:@"im:artist"] valueForKey:@"label"];
        self.summary       = [[appDictionary valueForKey:@"summary"] valueForKey:@"label"];
        self.price         = [[appDictionary valueForKey:@"im:price"] valueForKey:@"label"];
        self.copyright     = [[appDictionary valueForKey:@"rights"] valueForKey:@"label"];
        self.category      = [[[appDictionary valueForKey:@"category"] valueForKey:@"attributes"] valueForKey:@"label"];
        self.releaseDate   = [[[appDictionary valueForKey:@"im:releaseDate"] valueForKey:@"attributes"]valueForKey:@"label"];
        self.referenceLink = [[[appDictionary valueForKey:@"link"] valueForKey:@"attributes"] valueForKey:@"href"];
        self.appImagePath  = [appDictionary valueForKey:@"im:image"];
    }
    return self;
}

@end
