//
//  JsonFeedParser.h
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 22/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonFeedParser : NSObject

@property (nonatomic, retain) NSMutableArray *appsList;

-(id)initJsonParser;
-(NSArray *) fetchAppInfoFromAppStore:(NSString*) JsonUrl;

@end
