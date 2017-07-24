//
//  ACDSKAccountEndpointRequest.h
//  ACDSKit
//
//  Copyright (c) 2015 Cloud Drive. All rights reserved.
//

#import <ACDSKit/ACDSKit.h>

/**
 Request to get endpoints to use for current customer for all other API calls. This request is made on your behalf as necessary. There is generally no need to explicitly make such a request.
 
 @see ACDSKAccountEndpointResponse
 */
@interface ACDSKAccountEndpointRequest : ACDSKRequest

@end
