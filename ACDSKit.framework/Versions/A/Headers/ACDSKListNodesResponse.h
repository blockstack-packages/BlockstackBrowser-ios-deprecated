//
//  ACDSKListNodesResponse.h
//  ACDSKit
//
//  Copyright (c) 2015 Cloud Drive. All rights reserved.
//

#import <ACDSKit/ACDSKit.h>

/**
 Response for request to list nodes.
 
 @see ACDSKListNodesRequest
 */
@interface ACDSKListNodesResponse : ACDSKPaginatedResponse

/**
 Array of nodes.
 
 @see ACDSKNode
 */
@property (nonatomic, strong) NSArray *data;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
