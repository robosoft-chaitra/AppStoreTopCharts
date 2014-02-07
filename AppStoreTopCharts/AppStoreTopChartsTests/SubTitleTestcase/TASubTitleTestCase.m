//
//  ASSubTitleTestCase.m
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 07/02/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface TASubTitleTestCase : XCTestCase

@end

@implementation TASubTitleTestCase

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

-(void)testAppNameNil
{
   XCTAssertNil([self seperateAppNameFromSubTitle:nil], @"main String is nil");
}

- (void)testEmptyAppName
{
    XCTAssertEqual([self seperateAppNameFromSubTitle:@""],@"", @"main String is empty");
}

-(void)testSubtitleNil
{
    XCTAssertEqualObjects([self seperateAppNameFromSubTitle:@"Cycloramic Studio 360 Panorama"], @"Cycloramic Studio 360 Panorama", @"Subtile found");
}

-(void)testSubtitleContainSingleDash
{
    XCTAssertEqualObjects([self seperateAppNameFromSubTitle:@"Minecraft – Pocket Edition"], @"Minecraft", @"subtitle not contain single dash");
}

-(void)testSubTileContainDoubleDash
{
     XCTAssertEqualObjects([self seperateAppNameFromSubTitle:@"7 Minute Workout Challenge -- Fitness Guide Inc"], @"7 Minute Workout Challenge", @"subtitle not contain double dash");
}

-(void)testSubTileContainDash
{
    XCTAssertEqualObjects([self seperateAppNameFromSubTitle:@"Emoji Emoticons Pro — Best Emojis Emoticon Keyboard with Text Tricks for SMS, Facebook and Twitter - Avocado Hills, Inc."], @"Emoji Emoticons Pro", @"subtitle not contain  dash");
}

-(void)testSubTileContainColon
{
    XCTAssertEqualObjects([self seperateAppNameFromSubTitle:@"Hide N Seek : MC Mini Game With Worldwide Multiplayer"], @"Hide N Seek", @"subtitle not contain  colon");
}

-(void)testSubTileContainBy
{
    XCTAssertEqualObjects([self seperateAppNameFromSubTitle:@"Sing! Karaoke by Smule"], @"Sing! Karaoke", @"subtitle not contain  by");
}

-(void)testSubTileContainBrace
{
    XCTAssertEqualObjects([self seperateAppNameFromSubTitle:@"YouTube music video player edition (Download free app & play songs like radio! Share playlist URL to Facebook, Twitter, Google Gmail, Tumblr, Path, WhatsApp and Line. DISCLAIMER: This is not an mp3, lyric or ringtone downloader)"], @"YouTube music video player edition", @"subtitle not contain  by");
}


-(NSString*)seperateAppNameFromSubTitle:(NSString*)originalString
{
    NSString *subTitle1dash = [[originalString componentsSeparatedByString:@" \u2013"]objectAtIndex:0];
    NSString *subTitle2dash = [[subTitle1dash componentsSeparatedByString:@" \u2014"]objectAtIndex:0];
    NSString *subTitledash = [[subTitle2dash componentsSeparatedByString:@" -"]objectAtIndex:0];
    NSString *subTitleColon = [[subTitledash componentsSeparatedByString:@" :"]objectAtIndex:0];
    NSString *subTitleBrace = [[subTitleColon componentsSeparatedByString:@" ("]objectAtIndex:0];
    
    return [[subTitleBrace componentsSeparatedByString:@" by"]objectAtIndex:0];
}


@end
