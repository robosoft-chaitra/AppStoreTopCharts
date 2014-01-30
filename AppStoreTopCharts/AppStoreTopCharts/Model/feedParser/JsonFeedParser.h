//
//  JsonFeedParser.h
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 22/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonFeedParser : NSObject

//method to Fetch Info from JsonFeed 
-(NSMutableArray *) fetchAppInfoFromJsonFeed:(NSString*) JsonFeed;

@end
