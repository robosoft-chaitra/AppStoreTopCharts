//
//  JsonFeedParser.m
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 22/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import "JsonFeedParser.h"
#import "TopApp.h"


@implementation JsonFeedParser


#pragma mark - Json Parsing

//Method to Parse the Data from json feed
-(NSArray *)fetchAppInfoFromJsonFeed:(NSString *)JsonFeed
{
    self.appsList   = [[NSMutableArray alloc]init];
    
    NSURL * JsonUrl = [NSURL URLWithString:JsonFeed];
    NSData *appData = [NSData dataWithContentsOfURL:JsonUrl];
    
    NSError *error;
             if ([appData length] > 0 && error == nil)
             {
                 NSDictionary* appStoreDict = [NSJSONSerialization JSONObjectWithData:appData
                                                                          options:kNilOptions
                                                                            error:&error];
                 
                 NSArray *appEntries = [NSArray arrayWithArray:[[appStoreDict valueForKey:@"feed"] valueForKey:@"entry"] ];
                for (NSDictionary *entry in  appEntries)
                 {
//                 convering application Entries into TopApp Object
                     TopApp *topApp = [[TopApp alloc]initTopAppFromAppStoreDictionary:entry];
                     [self.appsList addObject:topApp];
                 }
             }
             else if ([appData length] == 0 && error == nil)
             {
                 NSLog(@"Nothing was downloaded.");
             }
             else if (error != nil){
                 NSLog(@"Error = %@", [error userInfo]);
             }
    return self.appsList;
}

@end
