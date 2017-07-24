//
//  ACDSKListPropertiesRequest.h
//  ACDSKit
//
//  Copyright (c) 2015 Cloud Drive. All rights reserved.
//

#import <ACDSKit/ACDSKit.h>

/**
 Request to list the properties associated with a node. Properties are key-value pairs. They can be used to store arbitrary metadata about the node. App can only list properties for which it has read access.
 
 @see ACDSKListPropertiesResponse
 */
@interface ACDSKListPropertiesRequest : ACDSKRequest

/**
 (required) ID of the node.
 */
@property (nonatomic, copy) NSString *nodeID;

/**
 (required) The owner of the property. Should be the friendlyName of your registered app. If you forgot your app's friendlyName, you can find it in the createdBy value of a node that your app created. Does not need to be URL encoded - this will be done automatically.
 */
@property (nonatomic, copy) NSString *owner;

@end
