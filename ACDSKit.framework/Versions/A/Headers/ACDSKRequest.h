//
//  ACDSKRequest.h
//  ACDSKit
//
//  Copyright (c) 2015 Cloud Drive. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 The base class for all SDK requests. For each API call, there is a corresponding subclass with its own properties for specific request parameters.
 */
@interface ACDSKRequest : NSObject <NSCopying, NSCoding>

/**
 Timeout interval for the request (in seconds). Defaults to 0, which indicates no timeout.
 */
@property (nonatomic) NSTimeInterval timeoutInterval;

/**
 Maximum number of retries that the request should perform when HTTP status code 429, 500, or 503 is received from the server. Defaults to 0, which indicates no maximum.
 */
@property (nonatomic) NSUInteger maxRetryCount;

@end
