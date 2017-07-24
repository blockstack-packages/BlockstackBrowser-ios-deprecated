//
//  ACDSKRemoveChildFromParentRequest.h
//  ACDSKit
//
//  Copyright (c) 2015 Cloud Drive. All rights reserved.
//

#import <ACDSKit/ACDSKit.h>

/**
 Request to remove a child node from a parent. A successful request results in an empty response.
 
 @see ACDSKEmptyResponse
 @see ACDSKNode
 */
@interface ACDSKRemoveChildFromParentRequest : ACDSKRequest

/**
 (required) ID of the parent node from which the child should be removed.
 */
@property (nonatomic, copy) NSString *parentID;

/**
 (required) ID of the child node that should be removed from the parent.
 */
@property (nonatomic, copy) NSString *childID;

@end
