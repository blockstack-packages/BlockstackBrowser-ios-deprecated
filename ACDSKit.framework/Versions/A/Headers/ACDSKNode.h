//
//  ACDSKNode.h
//
//  Copyright (c) 2015 Amazon.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ACDSKResponse.h"

@class ACDSKContentProperties;

/**
 Nodes are the fundamental resource in Cloud Drive. They are used to represent different kinds of digital assets including files and folders. Nodes can be associated to other nodes in a parent-child relationship. Nodes can contain just metadata (i.e. when representing a folder) or they can contain metadata and binary content (i.e. when representing a photo).
 */
@interface ACDSKNode : ACDSKResponse <NSCoding, NSCopying>

/**
 Status of the node. Possible values include: AVAILABLE, TRASH, PURGED.
 */
@property (nonatomic, strong) NSString *status;

/**
 Labels associated with the node. Max length of each label is 256 characters. Max number of labels is 10.
 */
@property (nonatomic, strong) NSArray *labels;

/**
 Unique identifier of the node.
 */
@property (nonatomic, strong) NSString *nodeId;

/**
 Whether the node is restricted to the calling app only or is accessible to all applications.
 */
@property (nonatomic, assign) BOOL restricted;

/**
 List of the node's parent node IDs, if any.
 */
@property (nonatomic, strong) NSArray *parents;

/**
 Metadata specific to the content of the node.
 
 @see ACDSKContentProperties
 @see ACDSKImageProperties
 @see ACDSKVideoProperties
 @see ACDSKDocumentProperties
 */
@property (nonatomic, strong) ACDSKContentProperties *contentProperties;

/**
 Short description of the node. Max length is 500 characters.
 */
@property (nonatomic, strong) NSString *nodeDescription;

/**
 Key-value pairs associated with the node. Can be used to store arbitrary metadata about the node.
 */
@property (nonatomic, strong) NSDictionary *properties;

/**
 User-friendly name of the node, e.g. file name if node represents a file. Max length is 256 characters.
 */
@property (nonatomic, strong) NSString *name;

/** 
 Kind of the node. Possible values include: FILE, ASSET, FOLDER, ALBUM.
 */
@property (nonatomic, strong) NSString *kind;

/**
 Whether the node has been shared.
 */
@property (nonatomic, assign) BOOL isShared;

/**
 Asset nodes attached to the node Assets provides various flavors of a file or folder like thumbnails for images, trailers for videos, and cover photos for folders. Asset nodes are similar to file nodes except their kind is ASSET rather than FILE, and they can't have any children.
 */
@property (nonatomic, strong) NSArray *assets;

/**
 Temporary URL string for directly accessing the content of this node without authentication. Must be specifically requested.
 */
@property (nonatomic, strong) NSString *tempLink;

/**
 Whether the node is the root of the tree of nodes.
 */
@property (nonatomic, assign) BOOL isRoot;

/**
 Version of the node metadata. Later versions may include additional fields.
 */
@property (nonatomic, assign) NSInteger version;

/**
 Whether the node was moved to the trash directly (as opposed to having been moved as a result of a parent node being moved to the trash).
 */
@property (nonatomic, assign) BOOL exclusivelyTrashed;

/**
 The date that the node was first created. Formatted as ISO8601 date, e.g. 2015-04-03T02:01:00.123Z
 */
@property (nonatomic, strong) NSString *createdDate;

/**
  The ETag value returned with the node when it was requested. ETag is essentially an identifier for a specific version of a resource. If the ETag of a requested node is the same as the version of the node you already have, it means the versions are the same (i.e. the node has not changed).
 */
@property (nonatomic, strong) NSString *eTagResponse;

/**
 User-friendly ID of the application that created the node, e.g. CloudDriveApp.
 */
@property (nonatomic, strong) NSString *createdBy;

/**
 The date that the node was last modified. Formatted as ISO8601 date, e.g. 2015-04-03T02:01:00.123Z
 */
@property (nonatomic, strong) NSString *modifiedDate;

/**
 Whether the node was moved to the trash as a result of a parent node being moved to the trash (as opposed to having been moved directly).
 */
@property (nonatomic, assign) BOOL recursivelyTrashed;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
