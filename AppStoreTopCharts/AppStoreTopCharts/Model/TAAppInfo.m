//
//  TopApp.m
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 22/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import "TAAppInfo.h"

@implementation TAAppInfo

#pragma mark- init Method

// designated initalizer to initialize topApplication 
-(id)initFromAppStoreDictionary:(NSDictionary *)appStoreDictionary
{
    if(self = [super init])
    {
         _appName       = [self seperateAppNameFromSubTitle:[appStoreDictionary valueForKeyPath:@"im:name.label"]];
         _authorName    = [appStoreDictionary valueForKeyPath:@"im:artist.label"];
         _summary       = [appStoreDictionary valueForKeyPath:@"summary.label"];
         _price         = [appStoreDictionary valueForKeyPath:@"im:price.label"];
         _copyright     = [appStoreDictionary valueForKeyPath:@"rights.label"];
         _category      = [appStoreDictionary valueForKeyPath:@"category.attributes.label"];
         _referenceLink = [appStoreDictionary valueForKeyPath:@"link.attributes.href"];
         _appImageUrl   = [NSURL URLWithString:[[[appStoreDictionary  valueForKey:@"im:image"]   objectAtIndex:0] valueForKey:@"label"]] ;
         _releaseDate   = [appStoreDictionary valueForKeyPath:@"im:releaseDate.attributes.label"];
         _appInfoDictionary = appStoreDictionary;
    }
    return self;
}

//Method to exclude the subtitles from appName
-(NSString*)seperateAppNameFromSubTitle:(NSString*)originalString
{
//     possible subtitle starting characters are: \u2013, \u2014, - ,: ,(, by
     
//     \u2013 for unicode of single dash -
     NSString *subTitle1dash = [[originalString componentsSeparatedByString:@"\u2013"]objectAtIndex:0];
//     \u2014 for unicode of double dash --
      NSString *subTitle2dash = [[subTitle1dash componentsSeparatedByString:@"\u2014"]objectAtIndex:0];
     
     NSString *subTitledash = [[subTitle2dash componentsSeparatedByString:@"-"]objectAtIndex:0];
     
       NSString *subTitleColon = [[subTitledash componentsSeparatedByString:@":"]objectAtIndex:0];
     
     NSString *subTitleBrace = [[subTitleColon componentsSeparatedByString:@"("]objectAtIndex:0];
     
     return [[subTitleBrace componentsSeparatedByString:@"by"]objectAtIndex:0];
     

}

-(id)init
{
      return [self initFromAppStoreDictionary:nil];
}

@end
