//
//  ACDSKPaginatedResponse.h
//  ACDSKit
//
//  Copyright (c) 2015 Cloud Drive. All rights reserved.
//

#import "ACDSKResponse.h"

/**
 Response for requests that support pagination.
 */
@interface ACDSKPaginatedResponse : ACDSKResponse <NSCoding, NSCopying>

/**
 Total number of items across all pages.
 */
@property (nonatomic, assign) int64_t count;

/**
 A token indicating where the contents of the next page should begin. Set to the startToken of the following request to list additional nodes.
 */
@property (nonatomic, strong) NSString *nextToken;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
