//
//  ACDSKDownloadFileRequest.h
//  ACDSKit
//
//  Copyright (c) 2015 Cloud Drive. All rights reserved.
//

#import <ACDSKit/ACDSKit.h>

/**
 Request to download the contents of a file node.
 
 @see ACDSKDownloadFileResponse
 @see ACDSKNode
 */
@interface ACDSKDownloadFileRequest : ACDSKRequest

/**
 (required) The node ID of the file.
 */
@property (nonatomic, copy) NSString *fileID;

/**
 (optional) The maximum length of either side of the downloaded image. The image will be sized such that it would fit in a square of the given length while maintaining its original aspect ratio. Image size will only ever be reduced - images will not be enlarged.
 
 Do not set for requests to download files other than images - otherwise, request will result in an error.
 */
@property (nonatomic) NSUInteger viewBox;

/**
 (optional) Whether the content-disposition header of the response should contain "attachment". Defaults to NO. responseContentDisposition overrides this value.
 */
@property (nonatomic) BOOL download;

/**
 (optional) The content-type header of the response.
 */
@property (nonatomic, copy) NSString *responseContentType;

/**
 (optional) The content-disposition header of the response.
 */
@property (nonatomic, copy) NSString *responseContentDisposition;

/**
 (optional) The path of the location to which the file should be downloaded. If no path is provided, the file will be downloaded to an arbitrary location.
 */
@property (nonatomic, copy) NSString *downloadPath;

/**
 Returns a new request to download a file with the given file node ID.
 @param fileID Node ID of the file.
 @return New request to download a file.
 */
+ (instancetype)requestWithFileID:(NSString *)fileID;

/**
 Initializes a request to download a file with the given file node ID.
 @param fileID Node ID of the file.
 @return Initialized request to download a file.
 */
- (instancetype)initWithFileID:(NSString *)fileID;

@end
