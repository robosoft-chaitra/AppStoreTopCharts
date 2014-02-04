//
//  AppStoreTopChartsTests.m
//  AppStoreTopChartsTests
//
//  Created by Chaithra TV on 22/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TopAppTestcase.h"

@interface AppStoreTopChartsTests : XCTestCase

@property (nonatomic, retain)  TopAppTestcase *topAppTestcase;

@end

@implementation AppStoreTopChartsTests

- (void)setUp
{
    [super setUp];
    self.topAppTestcase = [[TopAppTestcase alloc]initTopAppTestCase];

}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testJsonData
{
    XCTAssert(self.topAppTestcase.jsonData, @"JsonFeed Should not be nil");
}

-(void)testJsonParse
{
    XCTAssert(self.topAppTestcase.jsonDictionary, @"JsonFeed Parsing Error");
}

-(void)testTopAppList
{
    XCTAssert(self.topAppTestcase.topApps, @"TopApp list should not be empty");
}

-(void)testAppEntriesInServer
{
    XCTAssert(self.topAppTestcase.appEntries, @"TopApp list should not be empty");
}

-(void)testTopAppModel
{
     XCTAssert(self.topAppTestcase.topApp, @"TopApp list should not be empty");
}

-(void)testAppName
{
    XCTAssert(self.topAppTestcase.topApp.appName, @"App Name should not be empty");
}

-(void)testAppAuthorName
{
    XCTAssert(self.topAppTestcase.topApp.authorName, @"App Author should not be empty");
}

-(void)testAppPrice
{
    XCTAssert(self.topAppTestcase.topApp.price, @"App Price should not be empty");
}

-(void)testAppImageUrl
{
    XCTAssert(self.topAppTestcase.topApp.appImageUrl , @"App ImageURL should not be empty");
}

-(void)testAppReleseDate
{
    XCTAssert(self.topAppTestcase.topApp.releaseDate , @"App releseDate should not be empty");
}

-(void)testAppReferenceLink
{
    XCTAssert(self.topAppTestcase.topApp.referenceLink , @"App referenceLink should not be empty");
}

-(void)testAppCategory
{
    XCTAssert(self.topAppTestcase.topApp.category , @"App category should not be empty");
}

-(void)testAppCopyRight
{
    XCTAssert(self.topAppTestcase.topApp.copyright , @"App CopyRight should not be empty");
}

-(void)testAppSummary
{
    XCTAssert(self.topAppTestcase.topApp.summary , @"App summary should not be empty");
}

-(void)testAppInfoDict
{
     XCTAssert(self.topAppTestcase.topApp.appInfoDictionary , @"App Indo Dictionary should not be empty");
}

@end
