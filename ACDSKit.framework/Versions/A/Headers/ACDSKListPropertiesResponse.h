//
//  ACDSKListPropertiesResponse.h
//
//  Copyright (c) 2015 Amazon.com. All rights reserved.
//

#import <ACDSKit/ACDSKit.h>

/**
 Response for request to list the properties associated with a node.
 
 @see ACDSKListPropertiesRequest
 */
@interface ACDSKListPropertiesResponse : ACDSKResponse <NSCoding, NSCopying>

/**
 Number of properties.
 */
@property (nonatomic, assign) int64_t count;

/**
 Dictionary containing the property key-value pairs.
 */
@property (nonatomic, strong) NSDictionary *data;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
