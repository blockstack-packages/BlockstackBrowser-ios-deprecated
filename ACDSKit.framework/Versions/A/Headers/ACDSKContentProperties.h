//
//  ACDSKContentProperties.h
//
//  Copyright (c) 2015 Amazon.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ACDSKImageProperties;
@class ACDSKVideoProperties;
@class ACDSKDocumentProperties;

/**
 Metadata specific to the content of a node. Every node has content properties.
 
 @see ACDSKNode
 */
@interface ACDSKContentProperties : NSObject <NSCoding, NSCopying>

/**
 MD5 hash of the content of the node.
 */
@property (nonatomic, strong) NSString *md5;

/**
 Content type of the node, e.g. image/jpeg.
 */
@property (nonatomic, strong) NSString *contentType;

/**
 Document-specific metadata of the node. If node is not a document, property is set to nil.
 
 @see ACDSKDocumentProperties
 */
@property (nonatomic, strong) ACDSKDocumentProperties *document;

/**
 Byte size of the node content.
 */
@property (nonatomic, assign) NSInteger size;

/**
 Image-specific metadata of the node. If node is not an image, property is set to nil.
 
 @see ACDSKImageProperties
 */
@property (nonatomic, strong) ACDSKImageProperties *image;

/**
 Version of the content properties. Later versions may include additional fields.
 */
@property (nonatomic, assign) NSInteger version;

/**
 File extension of the node, not including the '.', e.g. jpg.
 */
@property (nonatomic, strong) NSString *fileExtension;

/**
 Video-specific metadata of the node. If node is not a video, property is set to nil.
 
 @see ACDSKVideoProperties
 */
@property (nonatomic, strong) ACDSKVideoProperties *video;

/**
 Date extracted from the node content (for images and videos). Formatted as ISO8601 date, e.g. 2015-04-03T02:01:00.123Z
 */
@property (nonatomic, strong) NSString *contentDate;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
