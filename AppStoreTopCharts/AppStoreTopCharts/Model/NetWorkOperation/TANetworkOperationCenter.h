//
//  NetworkOperationCenter.h
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 30/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NetworkOperationsDelegate <NSObject>

//initialzation method When Start Receiving Response From  Server
-(void)didStartReceivingResponseFromServer;

//receiving response data From server
-(void)didReceiveDataFromResponseData:(NSData*)responseData;

//display the data after finish loadin from server
-(void)didFinishLoadingDataFromServer;

@end

@interface TANetworkOperationCenter : NSObject<NSURLConnectionDataDelegate, NSURLConnectionDelegate>

@property (weak, nonatomic)id<NetworkOperationsDelegate> delegate;


//Designated Initializer 
-(id)initNetworkConnectionFromURL:(NSURL*)RequestURL;

@end
