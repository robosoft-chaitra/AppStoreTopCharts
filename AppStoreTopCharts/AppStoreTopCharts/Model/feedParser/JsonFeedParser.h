//
//  JsonFeedParser.h
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 22/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonFeedParser : NSObject

-(NSArray *) fetchAppInfoFromJsonFeed:(NSString*) JsonFeed;

@end
