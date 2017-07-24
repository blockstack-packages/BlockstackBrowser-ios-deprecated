//
//  ACDSKGetPropertyResponse.h
//
//  Copyright (c) 2015 Amazon.com. All rights reserved.
//

#import <ACDSKit/ACDSKit.h>

/**
 Response for request to get a property of a node.
 
 @see ACDSKGetPropertyRequest
 */
@interface ACDSKGetPropertyResponse : ACDSKResponse <NSCoding, NSCopying>

/**
 Property key.
 */
@property (nonatomic, strong) NSString *key;

/**
 Property value.
 */
@property (nonatomic, strong) NSString *value;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
