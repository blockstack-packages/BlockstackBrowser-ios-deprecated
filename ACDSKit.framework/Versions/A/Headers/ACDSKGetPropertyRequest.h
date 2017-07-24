//
//  ACDSKGetPropertyRequest.h
//  ACDSKit
//
//  Copyright (c) 2015 Cloud Drive. All rights reserved.
//

#import <ACDSKit/ACDSKit.h>

/**
 Request to get a property of a node. App must have read access for the property.
 
 @see ACDSKGetPropertyResponse
 */
@interface ACDSKGetPropertyRequest : ACDSKRequest

/**
 (required) ID of the node.
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

@end
