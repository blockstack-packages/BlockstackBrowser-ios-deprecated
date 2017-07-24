//
//  ACDSKResponse.h
//  ACDSKit
//
//  Copyright (c) 2015 Cloud Drive. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 The base class for all SDK responses. For each API call, there is a corresponding subclass with its own properties for specific response data (or else the call results in an empty response).
 */
@interface ACDSKResponse : NSObject

@end
