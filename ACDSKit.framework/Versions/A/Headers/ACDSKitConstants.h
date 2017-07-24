//
//  ACDSKitConstants.h
//  ACDSKit
//
//  Copyright (c) 2015 Cloud Drive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ACDSKit/AMZNCDSKURLError.h>

/**
 Error domain for Amazon Cloud Drive SDK errors.
 */
extern NSString *const ACDSKErrorDomain;

/**
 Error codes for Amazon Cloud Drive SDK errors.
 */
typedef NS_OPTIONS(NSInteger, ACDSKError) {
    /**
     Error code for unexpected server response.
     */
    ACDSKErrorUnexpectedServerResponse = AMZNErrorUnexpectedServerResponse,
    /**
     Error code used when unable to fetch request.
     */
    ACDSKErrorUnableToFetchRequest = AMZNErrorUnableToFetchRequest,
    /**
     Error code for invalid request.
     */
    ACDSKErrorInvalidRequest,
    /**
     Error code for unexpected server response indicating that request is retriable.
     */
    ACDSKErrorRetriableUnexpectedServerResponse
};