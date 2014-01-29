//
//  TopApp.m
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 22/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import "TopApp.h"

@implementation TopApp

#pragma mark- init Method

// designated initalizer for topApp 
-(id)initTopAppFromAppStoreDictionary:(NSDictionary *)appStoreDictionary
{
    if(self = [super init])
    {
        self = [self convertToAppFromDictionary:appStoreDictionary];
        
    }
    return self;
}

//Method to seperate the subtitles
-(NSString*)seperateAppNameFromSubTitle:(NSString*)originalString
{
    return [[[[[[[[[[originalString componentsSeparatedByString:@"\u2013"] objectAtIndex: 0]
                                    componentsSeparatedByString:@"\u2014"] objectAtIndex: 0]
                                    componentsSeparatedByString:@"-"] objectAtIndex: 0]
                                    componentsSeparatedByString:@":"] objectAtIndex: 0]
                                    componentsSeparatedByString:@"by"] objectAtIndex: 0];
}

-(id)convertToAppFromDictionary:(NSDictionary*)appStoreDictionary
{
     self.appName       = [self seperateAppNameFromSubTitle:[[appStoreDictionary valueForKey:@"im:name"]   valueForKey:@"label"]];
     self.authorName    = [[appStoreDictionary valueForKey:@"im:artist"] valueForKey:@"label"];
     self.summary       = [[appStoreDictionary valueForKey:@"summary"]   valueForKey:@"label"];
     self.price         = [[appStoreDictionary valueForKey:@"im:price"]  valueForKey:@"label"];
     self.copyright     = [[appStoreDictionary valueForKey:@"rights"]    valueForKey:@"label"];
     self.category      = [[[appStoreDictionary valueForKey:@"category"] valueForKey:@"attributes"] valueForKey:@"label"];
     self.referenceLink = [[[appStoreDictionary valueForKey:@"link"]     valueForKey:@"attributes"] valueForKey:@"href"];
     self.appImageUrl   = [NSURL URLWithString:[[[appStoreDictionary     valueForKey:@"im:image"]   objectAtIndex:0] valueForKey:@"label"]] ;
     self.releaseDate   = [[[appStoreDictionary valueForKey:@"im:releaseDate"] valueForKey:@"attributes"]valueForKey:@"label"];
     self.appDictionary = appStoreDictionary;
     
     return self;

}
@end
