//
//  ACDSKURLSessionError.h
//  ACDSKit
//
//  Copyright (c) 2015 Cloud Drive. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Error domain for Amazon Cloud Drive SDK errors.
 */
extern NSString *const AMZNCDSKURLErrorDomain;

/**
 Error codes for Amazon Cloud Drive SDK errors.
 */
typedef NS_OPTIONS(NSInteger, AMZNCDSKURLError) {
    /**
     Error code for unexpected server response.
     */
    AMZNErrorUnexpectedServerResponse = -1000,
    /**
     Error code used when unable to fetch request.
     */
    AMZNErrorUnableToFetchRequest,
    /**
     Error code used when operation was cancelled.
     */
    AMZNCDSKURLErrorOperationCancelled,
    /**
     Error code used when unable to handle authentication challenge for request.
     */
 	AMZNCDSKURLErrorUnableToHandleAuthenticationChallenge
};
