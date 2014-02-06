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

// designated initalizer to initialize topApplication 
-(id)initTopAppFromAppStoreDictionary:(NSDictionary *)appStoreDictionary
{
    if(self = [super init])
    {
         //CR: should not use dot operator within the init and dealloc.
         //read http://qualitycoding.org/objective-c-init/
         _appName       = [self seperateAppNameFromSubTitle:[appStoreDictionary valueForKeyPath:@"im:name.label"]];
         self.authorName    = [appStoreDictionary valueForKeyPath:@"im:artist.label"];
         self.summary       = [appStoreDictionary valueForKeyPath:@"summary.label"];
         self.price         = [appStoreDictionary valueForKeyPath:@"im:price.label"];
         self.copyright     = [appStoreDictionary valueForKeyPath:@"rights.label"];
         self.category      = [appStoreDictionary valueForKeyPath:@"category.attributes.label"];
         self.referenceLink = [appStoreDictionary valueForKeyPath:@"link.attributes.href"];
         self.appImageUrl   = [NSURL URLWithString:[[[appStoreDictionary  valueForKey:@"im:image"]   objectAtIndex:0] valueForKey:@"label"]] ;
         self.releaseDate   = [appStoreDictionary valueForKeyPath:@"im:releaseDate.attributes.label"];
         self.appInfoDictionary = appStoreDictionary;
    }
    return self;
}

//Method to seperate the subtitles
-(NSString*)seperateAppNameFromSubTitle:(NSString*)originalString
{
     //CR: This is too arcane to understand. How do you handle error cases?
     //Refactor this.
     return [[[[[[[[[[originalString componentsSeparatedByString:@"\u2013"] objectAtIndex: 0]
                                    componentsSeparatedByString:@"\u2014"] objectAtIndex: 0]
                                    componentsSeparatedByString:@"-"] objectAtIndex: 0]
                                    componentsSeparatedByString:@":"] objectAtIndex: 0]
                                    componentsSeparatedByString:@"by"] objectAtIndex: 0];
}

//overriding init method
-(id)init
{
     //CR: if you are calling another constructor, self = [super init] is superfluous.
    if(self = [super init])
    {
        self =  [self initTopAppFromAppStoreDictionary:nil];
    }
     return self;
}

@end
