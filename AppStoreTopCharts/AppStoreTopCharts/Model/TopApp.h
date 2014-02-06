//
//  TopApp.h
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 22/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import <Foundation/Foundation.h>

//CR: Document about a class briefly.
@interface TopApp : NSObject

//TopApp Model Class Properties
@property (nonatomic, strong) NSString *appName;
@property (nonatomic, strong) NSString *authorName;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSURL    *appImageUrl;
@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSString *copyright;
@property (nonatomic, strong) NSString *summary;
@property (nonatomic, strong) NSString *releaseDate;
@property (nonatomic, strong) NSString *referenceLink;
@property (nonatomic, strong) NSDictionary *appInfoDictionary;

//CR: Omit quoting the name of the class in the init methods.
-(id)initTopAppFromAppStoreDictionary:(NSDictionary*) appStoreDictionary;

@end
