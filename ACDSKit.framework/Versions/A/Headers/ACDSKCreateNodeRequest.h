//
//  ACDSKCreateNodeRequest.h
//  ACDSKit
//
//  Copyright (c) 2015 Cloud Drive. All rights reserved.
//

#import <ACDSKit/ACDSKit.h>

/**
 Request to create a node. Can be used to create a folder.
 
 @see ACDSKCreateNodeResponse
 @see ACDSKNode
 */
@interface ACDSKCreateNodeRequest : ACDSKRequest

/**
 (required) Name of the node. Max length is 256 characters.
 */
@property (nonatomic, copy) NSString *name;

/**
 (required) Kind of the node. Possible values include: FILE, ASSET, FOLDER, ALBUM.
 */
@property (nonatomic, strong) NSString *kind;

/**
 (optional) Labels associated with the node, e.g. @"ExampleLabel". Max length of each label is 256 characters. Max number of labels is 10.
 */
@property (nonatomic, copy) NSArray *labels;

/**
 (optional) Key-value pairs associated with the node. Can be used to store arbitrary metadata about the node.
 */
@property (nonatomic, copy) NSDictionary *properties;

/**
 (optional) List of parent node IDs. If no parent node ID is provided, the node will be located in the default root folder.
 */
@property (nonatomic, copy) NSArray *parents;

/**
 (optional) Globally unique client local ID. This can be used to influence the node ID of the node to be created. The same local ID will always map to the same node ID. Attempting to create a node using a local ID that was already used to create a node previously will result in an error. Example usage is to set local ID to the unique path of the folder in the local filesystem that is being mapped to Cloud Drive. Should be URL encoded. Max length is 100 characters.
 */
@property (nonatomic, copy) NSString *localID;

@end
