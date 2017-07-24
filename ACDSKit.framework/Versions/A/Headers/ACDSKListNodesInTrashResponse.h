//
//  ACDSKListNodesInTrashResponse.h
//
//  Copyright (c) 2015 Amazon.com. All rights reserved.
//

#import <ACDSKit/ACDSKit.h>

/**
 Response for request to list nodes in the trash.
 
 @see ACDSKListNodesInTrashRequest
 */
@interface ACDSKListNodesInTrashResponse : ACDSKPaginatedResponse <NSCoding, NSCopying>

/**
 Array of nodes.
 
 @see ACDSKNode
 */
@property (nonatomic, strong) NSArray *data;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
