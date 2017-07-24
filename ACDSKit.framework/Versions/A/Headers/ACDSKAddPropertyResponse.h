//
//  ACDSKAddPropertyResponse.h
//
//  Copyright (c) 2015 Amazon.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ACDSKit/ACDSKit.h>

/**
 Response for request to add single property (key-value pair) to a node.
 
 @see ACDSKAddPropertyRequest
 */
@interface ACDSKAddPropertyResponse : ACDSKResponse <NSCoding, NSCopying>

/**
 The key of the property.
 */
@property (nonatomic, strong) NSString *key;

/**
 The value of the property.
 */
@property (nonatomic, strong) NSString *value;

/**
 The location of the property.
 */
@property (nonatomic, strong) NSString *location;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
