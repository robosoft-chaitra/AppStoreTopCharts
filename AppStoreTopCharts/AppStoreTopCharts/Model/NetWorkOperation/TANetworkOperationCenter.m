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
-(id)initNetworkConnectionFromURL:(NSURL *)requestURL
{
    if(self = [super init])
    {
        NSURLRequest *request = [NSURLRequest requestWithURL:requestURL];
        NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
        
        if(!connection)
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
        NSLog(@"Connection not responding");
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.delegate didReceiveDataFromResponseData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    // inform the user if error occured
    
    NSLog(@"Connection failed! Error - %@ %@",
          
          [error localizedDescription],
          
          [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
   
    [self.delegate didFinishLoadingDataFromServer];
}


@end
