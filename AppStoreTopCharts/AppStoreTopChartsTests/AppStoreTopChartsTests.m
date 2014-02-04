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

@property (nonatomic, retain)  TopAppTestcase *topAppTestcase1;

@end

@implementation AppStoreTopChartsTests

- (void)setUp
{
    [super setUp];
    self.topAppTestcase1 = [[TopAppTestcase alloc]initNetWorkOperationTestCase:[NSURL URLWithString:@"http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/toppaidapplications/limit=10/json"]];

}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testURLFeed
{
    XCTAssert(self.topAppTestcase1.jsonUrl, @"URL should be valid");
}



-(void)testJsonParse
{
    XCTAssert(self.topAppTestcase1.jsonDictionary, @"JsonFeed Parsing Error");
}

-(void)testTopAppList
{
    XCTAssert(self.topAppTestcase1.topApps, @"TopApp list should not be empty");
}

-(void)testAppEntriesInServer
{
    XCTAssert([self.topAppTestcase1 appEntries], @"TopApp list should not be empty");
}

-(void)testTopAppModel
{
     XCTAssert([self.topAppTestcase1 topApp], @"TopApp list should not be empty");
}

-(void)testAppName
{
    XCTAssert(self.topAppTestcase1.topApp.appName, @"App Name should not be empty");
}

-(void)testAppAuthorName
{
    XCTAssert(self.topAppTestcase1.topApp.authorName, @"App Author should not be empty");
}

-(void)testAppPrice
{
    XCTAssert(self.topAppTestcase1.topApp.price, @"App Price should not be empty");
}

-(void)testAppImageUrl
{
    XCTAssert(self.topAppTestcase1.topApp.appImageUrl , @"App ImageURL should not be empty");
}

-(void)testAppReleseDate
{
    XCTAssert(self.topAppTestcase1.topApp.releaseDate , @"App releseDate should not be empty");
}

-(void)testAppReferenceLink
{
    XCTAssert(self.topAppTestcase1.topApp.referenceLink , @"App referenceLink should not be empty");
}

-(void)testAppCategory
{
    XCTAssert(self.topAppTestcase1.topApp.category , @"App category should not be empty");
}

-(void)testAppCopyRight
{
    XCTAssert(self.topAppTestcase1.topApp.copyright , @"App CopyRight should not be empty");
}

-(void)testAppSummary
{
    XCTAssert(self.topAppTestcase1.topApp.summary , @"App summary should not be empty");
}

-(void)testAppInfoDict
{
     XCTAssert(self.topAppTestcase1.topApp.appInfoDictionary , @"App Indo Dictionary should not be empty");
}

@end
