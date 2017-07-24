//
//  ACDSKChangeChunk.h
//
//  Copyright (c) 2015 Amazon.com. All rights reserved.
//

#import <ACDSKit/ACDSKit.h>

/**
 Chunk of nodes that had changes.
 
 @see ACDSKGetChangesResponse
 */
@interface ACDSKChangeChunk : NSObject <NSCoding, NSCopying>

/**
 A flag from the service to indicate that the client should start over getting changes.
 */
@property (nonatomic, assign) BOOL reset;

/**
 Array of nodes that had changes.
 
 @see ACDSKNode
 */
@property (nonatomic, strong) NSArray *nodes;

/**
 A token representing a frontier of changed nodes.
 
 @see ACDSKGetChangesRequest
 */
@property (nonatomic, strong) NSString *checkpoint;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
