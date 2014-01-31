//
//  NetworkOperationCenter.m
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 30/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import "TANetworkOperationCenter.h"

@implementation TANetworkOperationCenter

#pragma mark - Init methods
-(id)initNetworkConnectionFromURL:(NSURL *)requestedURL
{
    if(self = [super init])
    {
        self.urlRequest = [NSURLRequest requestWithURL:requestedURL];
        self.urlConnection = [NSURLConnection connectionWithRequest:self.urlRequest delegate:self];
        
        if(!self.urlConnection)
            NSLog(@"Connection is not established");
    }
    return self;
}

#pragma mark - NAURLConnection delegate methods
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
//    Initialize array when start receiving response
    [self.delegate didStartReceivingResponseFromServer];
    if(response == nil)
        NSLog(@"server not responding");
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
//    delegate method to handle response data
    [self.delegate didReceiveDataFromResponseData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
// inform the user if error occured
    NSLog(@"Connection failed! Error - %@ %@", [error localizedDescription], [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
//   delegate method to handle after loading data
    [self.delegate didFinishLoadingDataFromServer];
}


@end
