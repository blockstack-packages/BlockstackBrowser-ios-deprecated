//
//  ACDSKDocumentProperties.h
//
//  Copyright (c) 2015 Amazon.com. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 Document-specific metadata of a node.
 
 @see ACDSKContentProperties
 @see ACDSKNode
 */
@interface ACDSKDocumentProperties : NSObject <NSCoding, NSCopying>

/**
 Title of the document.
 */
@property (nonatomic, strong) NSString *title;

/**
 List of authors of the document.
 */
@property (nonatomic, strong) NSArray *authors;

/**
 Version of the document.
 */
@property (nonatomic, strong) NSString *documentVersion;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
