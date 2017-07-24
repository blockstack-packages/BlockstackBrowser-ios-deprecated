//
//  ACDSKAddChildToParentRequest.h
//  ACDSKit
//
//  Copyright (c) 2015 Cloud Drive. All rights reserved.
//

#import <ACDSKit/ACDSKit.h>

/**
 Request to add a node as a child of a parent node. Can be used to add a file (or folder) to a folder. A successful request results in an empty response.
 
 @see ACDSKEmptyResponse
 @see ACDSKNode
 */
@interface ACDSKAddChildToParentRequest : ACDSKRequest

/**
 (required) ID of parent node to which child node should be added.
 */
@property (nonatomic, copy) NSString *parentID;

/**
 (required) ID of child node to add to parent node.
 */
@property (nonatomic, copy) NSString *childID;

@end
