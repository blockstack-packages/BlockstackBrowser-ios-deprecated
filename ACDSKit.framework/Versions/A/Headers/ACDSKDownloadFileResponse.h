//
//  ACDSKDownloadFileResponse.h
//
//  Copyright (c) 2015 Amazon.com. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Response for request to download the contents of a file node.
 
 @see ACDSKDownloadFileRequest
 @see ACDSKNode
 */
@interface ACDSKDownloadFileResponse : NSObject <NSCoding, NSCopying>

/**
 The path of the location of the downloaded file.
 */
@property (nonatomic, strong) NSString *location;

/**
 The content-type header of the response.
 */
@property (nonatomic, strong) NSString *responseContentType;

/**
 The content-disposition header of the response.
 */
@property (nonatomic, strong) NSString *responseContentDisposition;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
