//
//  AppStoreTopChartsTests.m
//  AppStoreTopChartsTests
//
//  Created by Chaithra TV on 22/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TAAppInfoTestcase.h"
#import "TAAppInfo.h"

//ToDo:unit testing for A valid model 
@interface AppStoreTopChartsTests : XCTestCase

@property (nonatomic, retain)  TAAppInfoTestcase *topAppTestcase;

@end

@implementation AppStoreTopChartsTests

- (void)setUp
{
    [super setUp];
    self.topAppTestcase = [[TAAppInfoTestcase alloc]initTopAppTestCase];

}

-(void)testJsonData
{
    NSData *jsonData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"TopAppsFeed" ofType:@"json"]];
    XCTAssertEqualObjects(self.topAppTestcase.jsonData,jsonData, @"JsonFeed Should not be valid data");
}

-(void)testJsonParse
{
    NSError *error;
    NSData *jsonData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"TopAppsFeed" ofType:@"json"]];
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                   options:kNilOptions error:&error];

    XCTAssertEqualObjects(self.topAppTestcase.jsonDictionary, jsonDictionary,@"JsonFeed Parsing Error");
}



-(void)testAppEntriesInServer
{
    NSError *error;
     NSData *jsonData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"TopAppsFeed" ofType:@"json"]];
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData
                                                          options:kNilOptions error:&error];
    NSArray *entries = [NSArray arrayWithArray:[jsonDictionary valueForKeyPath:@"feed.entry"]];
   
    XCTAssertEqualObjects(self.topAppTestcase.appEntries, entries, @"app entries should be proper");
}

-(void)testTopAppList
{
    NSError *error;
    NSData *jsonData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"TopAppsFeed" ofType:@"json"]];
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                   options:kNilOptions error:&error];
    NSArray *entries = [NSArray arrayWithArray:[jsonDictionary valueForKeyPath:@"feed.entry"]];
    NSMutableArray *apps = [[NSMutableArray alloc]init];
    for (NSDictionary *appEntry in entries)
    {
        TAAppInfo *appDetail = [[TAAppInfo alloc] initFromAppStoreDictionary:appEntry];
        [apps addObject:appDetail];
    }
    XCTAssertEqual(self.topAppTestcase.topApps.count,apps.count, @"TopApp list not equal");
}

-(void)testAppName
{
    NSError *error;
    NSData *jsonData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"TopAppsFeed" ofType:@"json"]];
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                   options:kNilOptions error:&error];
    NSArray *entries = [NSArray arrayWithArray:[jsonDictionary valueForKeyPath:@"feed.entry"]];
    
    XCTAssertEqualObjects(self.topAppTestcase.appInfo.appName, [[entries objectAtIndex:0] valueForKeyPath:@"im:name.label"], @"app name should be same");
}

-(void)testAppAuthorName
{
    NSError *error;
    NSData *jsonData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"TopAppsFeed" ofType:@"json"]];
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                   options:kNilOptions error:&error];
    NSArray *entries = [NSArray arrayWithArray:[jsonDictionary valueForKeyPath:@"feed.entry"]];
    
    XCTAssertEqualObjects(self.topAppTestcase.appInfo.authorName, [[entries objectAtIndex:0] valueForKeyPath:@"im:artist.label"], @"author name should be same");

}

-(void)testAppPrice
{
    NSError *error;
    NSData *jsonData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"TopAppsFeed" ofType:@"json"]];
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                   options:kNilOptions error:&error];
    NSArray *entries = [NSArray arrayWithArray:[jsonDictionary valueForKeyPath:@"feed.entry"]];
    
    XCTAssertEqualObjects(self.topAppTestcase.appInfo.price, [[entries objectAtIndex:0] valueForKeyPath:@"im:price.label"], @"price should be same");
}

-(void)testAppImageUrl
{
    NSError *error;
    NSData *jsonData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"TopAppsFeed" ofType:@"json"]];
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                   options:kNilOptions error:&error];
    NSArray *entries = [NSArray arrayWithArray:[jsonDictionary valueForKeyPath:@"feed.entry"]];
    
    NSURL *imageUrl = [NSURL URLWithString:[[[[entries objectAtIndex:0] valueForKey:@"im:image"]   objectAtIndex:0] valueForKey:@"label"]];
    
    XCTAssertEqualObjects(self.topAppTestcase.appInfo.appImageUrl,imageUrl, @"Image URL should be same");
}

-(void)testAppReleseDate
{
    NSError *error;
    NSData *jsonData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"TopAppsFeed" ofType:@"json"]];
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                   options:kNilOptions error:&error];
    NSArray *entries = [NSArray arrayWithArray:[jsonDictionary valueForKeyPath:@"feed.entry"]];
    
    XCTAssertEqualObjects(self.topAppTestcase.appInfo.releaseDate, [[entries objectAtIndex:0] valueForKeyPath:@"im:releaseDate.attributes.label"], @"releseDate should be same");
}

-(void)testAppReferenceLink
{
    NSError *error;
    NSData *jsonData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"TopAppsFeed" ofType:@"json"]];
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                   options:kNilOptions error:&error];
    NSArray *entries = [NSArray arrayWithArray:[jsonDictionary valueForKeyPath:@"feed.entry"]];
    
    XCTAssertEqualObjects(self.topAppTestcase.appInfo.referenceLink, [[entries objectAtIndex:0] valueForKeyPath:@"link.attributes.href"], @"reference Link name should be same");

}

-(void)testAppCategory
{
    NSError *error;
    NSData *jsonData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"TopAppsFeed" ofType:@"json"]];
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                   options:kNilOptions error:&error];
    NSArray *entries = [NSArray arrayWithArray:[jsonDictionary valueForKeyPath:@"feed.entry"]];
    
    XCTAssertEqualObjects(self.topAppTestcase.appInfo.category, [[entries objectAtIndex:0] valueForKeyPath:@"category.attributes.label"], @"category should be same");
}

-(void)testAppCopyRight
{
    NSError *error;
    NSData *jsonData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"TopAppsFeed" ofType:@"json"]];
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                   options:kNilOptions error:&error];
    NSArray *entries = [NSArray arrayWithArray:[jsonDictionary valueForKeyPath:@"feed.entry"]];
    
    XCTAssertEqualObjects(self.topAppTestcase.appInfo.copyright, [[entries objectAtIndex:0] valueForKeyPath:@"rights.label"], @"copyright should be same");
}

-(void)testAppSummary
{
    NSError *error;
    NSData *jsonData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"TopAppsFeed" ofType:@"json"]];
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                   options:kNilOptions error:&error];
    NSArray *entries = [NSArray arrayWithArray:[jsonDictionary valueForKeyPath:@"feed.entry"]];
    
    XCTAssertEqualObjects(self.topAppTestcase.appInfo.summary, [[entries objectAtIndex:0] valueForKeyPath:@"summary.label"], @"summary should be same");
}

-(void)testAppInfoDict
{
    NSError *error;
    NSData *jsonData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"TopAppsFeed" ofType:@"json"]];
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                   options:kNilOptions error:&error];
    NSArray *entries = [NSArray arrayWithArray:[jsonDictionary valueForKeyPath:@"feed.entry"]];
    
    XCTAssertEqualObjects(self.topAppTestcase.appInfo.appInfoDictionary, [entries objectAtIndex:0], @"app dictioanary should be same");

}

@end
