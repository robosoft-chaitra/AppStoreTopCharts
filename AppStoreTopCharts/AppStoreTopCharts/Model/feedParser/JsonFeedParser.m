//
//  JsonFeedParser.m
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 22/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import "JsonFeedParser.h"
#import "TopApp.h"
#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

@implementation JsonFeedParser

-(id)initJsonParser
{
   if(self = [super init])
   {
       self.appsList = [[NSMutableArray alloc]init];
   }
    return self;
}

-(NSArray *)fetchAppInfoFromJsonFeed:(NSString *)JsonFeed
{
//    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
//    dispatch_async(kBgQueue, ^{
//        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:JsonFeed]];
//        [NSURLConnection sendAsynchronousRequest:urlRequest
//                                           queue:queue
//                               completionHandler:^(NSURLResponse *response,NSData *appData,NSError *error)
//         {
    NSURL * JsonUrl = [NSURL URLWithString:JsonFeed];
    NSData *appData = [NSData dataWithContentsOfURL:JsonUrl];
    NSError *error;
             if ([appData length] > 0 && error == nil)
             {
                 NSDictionary* appStoreDict = [NSJSONSerialization JSONObjectWithData:appData
                                                                          options:kNilOptions
                                                                            error:&error];
                 
                 NSArray *entries = [NSArray arrayWithArray:[[appStoreDict valueForKey:@"feed"] valueForKey:@"entry"] ];
                
                 for (NSDictionary *entry in  entries)
                 {
                     TopApp *topApp = [[TopApp alloc]initTopAppFromAppStoreDict:entry];
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
//         }];
//    });
   
    return self.appsList;
}

@end
