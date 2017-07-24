//
//  ACDSKAddPropertyRequest.h
//  ACDSKit
//
//  Copyright (c) 2015 Cloud Drive. All rights reserved.
//

#import <ACDSKit/ACDSKit.h>

/**
 Request to add a single property (key-value pair) to a node. If the key already exists, then its value will be overwritten.
 
 @see ACDSKAddPropertyResponse
 @see ACDSKDeletePropertyRequest
 @see ACDSKNode
 */
@interface ACDSKAddPropertyRequest : ACDSKRequest

/**
 (required) The ID of the node to which the property should be added.
 */
@property (nonatomic, copy) NSString *nodeID;

/**
 (required) The owner of the property. Should be the friendlyName of your registered app. If you forgot your app's friendlyName, you can find it in the createdBy value of a node that your app created. Does not need to be URL encoded - this will be done automatically.
 */
@property (nonatomic, copy) NSString *owner;

/**
 (required) The key of the property. Key should be composed of alphanumeric characters and the underscore "_". Max length is 50 characters.
 */
@property (nonatomic, copy) NSString *key;

/**
 (required) The value of the property. Max length is 500 characters.
 */
@property (nonatomic, copy) NSString *value;

@end
