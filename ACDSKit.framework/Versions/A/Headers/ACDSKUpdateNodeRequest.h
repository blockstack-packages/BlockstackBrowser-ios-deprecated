//
//  ACDSKUpdateNodeRequest.h
//  ACDSKit
//
//  Copyright (c) 2015 Cloud Drive. All rights reserved.
//

#import <ACDSKit/ACDSKit.h>

/**
 Request to update a node.
 
 @see ACDSKUpdateNodeResponse
 */
@interface ACDSKUpdateNodeRequest : ACDSKRequest

/**
 (required) ID of the node.
 */
@property (nonatomic, copy) NSString *nodeID;

/**
 (optional) ETag of node from a previous response. Enables clients to do a conditional update. If ETag does not match (indicating that node has since been modified), node will not be updated.
 */
@property (nonatomic, copy) NSString *ETag;

/**
 (optional) User-friendly name of the node, e.g. file name if node represents a file. Max length is 256 characters.
 */
@property (nonatomic, copy) NSString *name;

/**
 (optional) Labels associated with the node, e.g. @"ExampleLabel". Max length of each label is 256 characters. Max number of labels is 10.
 */
@property (nonatomic, copy) NSArray *labels;

/**
 (optional) Short description of the node. Max length is 500 characters.
 */
@property (nonatomic, copy) NSString *nodeDescription;

@end
