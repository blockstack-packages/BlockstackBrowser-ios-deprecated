//
//  ACDSKAccountEndpointResponse.h
//
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Response for request to get endpoints for current customer. Includes whether the customer exists as well as content and metadata URL strings.
 
 @see ACDSKAccountEndpointRequest
 */
@interface ACDSKAccountEndpointResponse : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *contentUrl;

/**
 Endpoint for retrieving metadata information.
 */
@property (nonatomic, strong) NSString *metadataUrl;

/**
 Whether the customer exists.
 */
@property (nonatomic, assign) BOOL customerExists;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
