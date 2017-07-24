//
//  ACDSKUploadFileRequest.h
//  ACDSKit
//
//  Copyright (c) 2015 Cloud Drive. All rights reserved.
//

#import <ACDSKit/ACDSKit.h>

/**
 Request to upload the contents of a new file node.
 
 @see ACDSKUploadFileResponse
 @see ACDSKNode
 */
@interface ACDSKUploadFileRequest : ACDSKRequest

/**
 Required location of content file you want to upload
 */
@property (nonatomic, copy) NSString *filePath;

/**
 Required file name. Max to 256 Characters.
 */
@property (nonatomic, copy) NSString *name;

/**
 Optional list of parent IDs. If no parent folders are provided, the file will be placed in the default root folder.
 */
@property (nonatomic, copy) NSArray *parents;

/**
 Optional extra information which is indexed. For example the value can be "PHOTO"
 */
@property (nonatomic, copy) NSArray *labels;

/**
 Optional List of properties to be added for the file.
 */
@property (nonatomic, copy) NSDictionary *properties;

/**
 Optional deduplication: disables checking for duplicates when uploading
 */
@property (nonatomic) BOOL suppressDeduplication;

+ (instancetype)requestWithName:(NSString *)name filePath:(NSString *)filePath;
- (instancetype)initWithName:(NSString *)name filePath:(NSString *)filePath;

@end
