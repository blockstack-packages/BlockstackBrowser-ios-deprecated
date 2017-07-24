//
//  ACDSKClient.h
//  ACDSKit
//
//  Copyright (c) 2015 Cloud Drive. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ACDSKAccountEndpointRequest;
@class ACDSKAccountQuotaRequest;
@class ACDSKAccountQuotaResponse;
@class ACDSKAccountInfoRequest;
@class ACDSKAccountInfoResponse;
@class ACDSKAccountUsageRequest;
@class ACDSKAccountUsageResponse;
@class ACDSKListNodesRequest;
@class ACDSKListNodesResponse;
@class ACDSKGetNodeRequest;
@class ACDSKGetNodeResponse;
@class ACDSKUpdateNodeRequest;
@class ACDSKUpdateNodeResponse;
@class ACDSKCreateNodeRequest;
@class ACDSKCreateNodeResponse;
@class ACDSKAddPropertyRequest;
@class ACDSKAddPropertyResponse;
@class ACDSKGetPropertyRequest;
@class ACDSKGetPropertyResponse;
@class ACDSKListPropertiesRequest;
@class ACDSKListPropertiesResponse;
@class ACDSKDeletePropertyRequest;
@class ACDSKEmptyResponse;
@class ACDSKTask;
@class ACDSKListNodesInTrashRequest;
@class ACDSKListNodesInTrashResponse;
@class ACDSKRestoreNodeFromTrashRequest;
@class ACDSKRestoreNodeFromTrashResponse;
@class ACDSKMoveNodeToTrashRequest;
@class ACDSKMoveNodeToTrashResponse;
@class ACDSKAccountEndpointResponse;
@class ACDSKGetChangesRequest;
@class ACDSKGetChangesResponse;
@class ACDSKListChildrenRequest;
@class ACDSKListChildrenResponse;
@class ACDSKAddChildToParentRequest;
@class ACDSKRemoveChildFromParentRequest;
@class ACDSKDownloadFileRequest;
@class ACDSKDownloadFileResponse;
@class ACDSKUploadFileRequest;
@class ACDSKUploadFileResponse;

/**
 Client for interacting with Amazon Cloud Drive. All calls are asynchronous, non-blocking, and executed on a background thread. They take a failure block that provides an error with the reason for the failure, as well as a success block that provides a response object. Long running calls such as uploading and downloading also take a progress block that provides a progress value. When updating UI in a client callback block, be sure to do so on the main thread. Each call immediately returns a task object that represents the asynchronous request and can be cancelled. When logout occurs, you should deallocate any existing client instance. You should also cancel any client tasks in progress (or at least ignore the response).
 */
@interface ACDSKClient : NSObject

/**
 Client initializer that takes a token provider block. The easiest way to provide an auth token is with LoginWithAmazon using the open source AMZNAuthorizationProvider. See the SDK guide for more information.
 
 @param tokenProvider Block that returns a valid access token.
 @return An initialized client.
 */
- (instancetype)initWithTokenProvider:(NSString *(^)(void))tokenProvider;

/**
 Convenience method for instantiating and initializing a new client object with a token provider block. The easiest way to provide an auth token is with LoginWithAmazon using the open source AMZNAuthorizationProvider. See the SDK guide for more information.
 
 @param tokenProvider Block that returns a valid access token.
 @return A new initialized client.
 */
+ (instancetype)clientWithTokenProvider:(NSString *(^)(void))tokenProvider;

/**
 Get endpoints to use for current customer for all other API calls. This request is made on your behalf as necessary. There is generally no need to explicitly make such a request.

 @param request The configured request object.
 @param errorHandler Request failure block that handles a given error. When updating UI, be sure to do so on the main thread.
 @param successHandler Request success block that handles a given response. When updating UI, be sure to do so on the main thread.
 @return Task object that represents the asynchronous request and can be cancelled.
 
 @see ACDSKAccountEndpointRequest
 @see ACDSKAccountEndpointResponse
 */
- (ACDSKTask *)getAccountEndpoint:(ACDSKAccountEndpointRequest *)request
                             fail:(void(^)(NSError *error))errorHandler
                          success:(void(^)(ACDSKAccountEndpointResponse *response))successHandler;

/**
 Get account quota information, including quota (total space), space available, and the time that the information was last calculated. Available space should not be used as an indicator of whether upload is possible - instead, check for a 403 status code when requesting to upload a file.
 
 @param request The configured request object.
 @param errorHandler Request failure block that handles a given error. When updating UI, be sure to do so on the main thread.
 @param successHandler Request success block that handles a given response. When updating UI, be sure to do so on the main thread.
 @return Task object that represents the asynchronous request and can be cancelled.
 
 @see ACDSKAccountQuotaResponse
 @see ACDSKAccountQuotaRequest
 */
- (ACDSKTask *)getAccountQuota:(ACDSKAccountQuotaRequest *)request
                          fail:(void(^)(NSError *error))errorHandler
                       success:(void(^)(ACDSKAccountQuotaResponse *response))successHandler;

/**
 Get account info, including version of accepted terms of use and also account status.
 
 @param request The configured request object.
 @param errorHandler Request failure block that handles a given error. When updating UI, be sure to do so on the main thread.
 @param successHandler Request success block that handles a given response. When updating UI, be sure to do so on the main thread.
 @return Task object that represents the asynchronous request and can be cancelled.
 
 @see ACDSKAccountInfoResponse
 @see ACDSKAccountInfoRequest
 */
- (ACDSKTask *)getAccountInfo:(ACDSKAccountInfoRequest *)request
                         fail:(void(^)(NSError *error))errorHandler
                      success:(void(^)(ACDSKAccountInfoResponse *response))successHandler;

/**
 Get account usage information, including a summary for each type of data stored in Cloud Drive.
 
 @param request The configured request object.
 @param errorHandler Request failure block that handles a given error. When updating UI, be sure to do so on the main thread.
 @param successHandler Request success block that handles a given response. When updating UI, be sure to do so on the main thread.
 @return Task object that represents the asynchronous request and can be cancelled.
 
 @see ACDSKAccountUsageResponse
 @see ACDSKAccountUsageRequest
 */
- (ACDSKTask *)getAccountUsage:(ACDSKAccountUsageRequest *)request
                         fail:(void(^)(NSError *error))errorHandler
                      success:(void(^)(ACDSKAccountUsageResponse *response))successHandler;

/**
 List nodes.
 
 @param request The configured request object.
 @param errorHandler Request failure block that handles a given error. When updating UI, be sure to do so on the main thread.
 @param successHandler Request success block that handles a given response. When updating UI, be sure to do so on the main thread.
 @return Task object that represents the asynchronous request and can be cancelled.
 
 @see ACDSKListNodesResponse
 @see ACDSKListNodesRequest
 */
- (ACDSKTask *)listNodes:(ACDSKListNodesRequest *)request
                    fail:(void(^)(NSError *error))errorHandler
                 success:(void(^)(ACDSKListNodesResponse *response))successHandler;

/**
 Get a node.

 @param request The configured request object.
 @param errorHandler Request failure block that handles a given error. When updating UI, be sure to do so on the main thread.
 @param successHandler Request success block that handles a given response. When updating UI, be sure to do so on the main thread.
 @return Task object that represents the asynchronous request and can be cancelled.
 
 @see ACDSKGetNodeResponse
 @see ACDSKGetNodeRequest
 */
- (ACDSKTask *)getNode:(ACDSKGetNodeRequest *)request
                  fail:(void(^)(NSError *error))errorHandler
               success:(void(^)(ACDSKGetNodeResponse *response))successHandler;

/**
 Update a node.
 
 @param request The configured request object.
 @param errorHandler Request failure block that handles a given error. When updating UI, be sure to do so on the main thread.
 @param successHandler Request success block that handles a given response. When updating UI, be sure to do so on the main thread.
 @return Task object that represents the asynchronous request and can be cancelled.
 
 @see ACDSKUpdateNodeResponse
 @see ACDSKUpdateNodeRequest
 */
- (ACDSKTask *)updateNode:(ACDSKUpdateNodeRequest *)request
                  fail:(void(^)(NSError *error))errorHandler
               success:(void(^)(ACDSKUpdateNodeResponse *response))successHandler;

/**
 Create a node. Can be used to create a folder.
 
 @param request The configured request object.
 @param errorHandler Request failure block that handles a given error. When updating UI, be sure to do so on the main thread.
 @param successHandler Request success block that handles a given response. When updating UI, be sure to do so on the main thread.
 @return Task object that represents the asynchronous request and can be cancelled.
 
 @see ACDSKCreateNodeResponse
 @see ACDSKCreateNodeRequest
 */
- (ACDSKTask *)createNode:(ACDSKCreateNodeRequest *)request
                       fail:(void(^)(NSError *error))errorHandler
                    success:(void(^)(ACDSKCreateNodeResponse *response))successHandler;

/**
 Add a single property (key-value pair) to a node. If the key already exists, then its value will be overwritten.
 
 @param request The configured request object.
 @param errorHandler Request failure block that handles a given error. When updating UI, be sure to do so on the main thread.
 @param successHandler Request success block that handles a given response. When updating UI, be sure to do so on the main thread.
 @return Task object that represents the asynchronous request and can be cancelled.
 
 @see ACDSKAddPropertyResponse
 @see ACDSKAddPropertyRequest
 */
- (ACDSKTask *)addNodeProperty:(ACDSKAddPropertyRequest *)request
                          fail:(void(^)(NSError *error))errorHandler
                       success:(void(^)(ACDSKAddPropertyResponse *response))successHandler;

/**
 Get a property of a node. App must have read access for the property.
 
 @param request The configured request object.
 @param errorHandler Request failure block that handles a given error. When updating UI, be sure to do so on the main thread.
 @param successHandler Request success block that handles a given response. When updating UI, be sure to do so on the main thread.
 @return Task object that represents the asynchronous request and can be cancelled.
 
 @see ACDSKGetPropertyResponse
 @see ACDSKGetPropertyRequest
 */
- (ACDSKTask *)getNodeProperty:(ACDSKGetPropertyRequest *)request
                          fail:(void(^)(NSError *error))errorHandler
                       success:(void(^)(ACDSKGetPropertyResponse *response))successHandler;

/**
 List the properties associated with a node. Properties are key-value pairs. They can be used to store arbitrary metadata about the node. App can only list properties for which it has read access.
 
 @param request The configured request object.
 @param errorHandler Request failure block that handles a given error. When updating UI, be sure to do so on the main thread.
 @param successHandler Request success block that handles a given response. When updating UI, be sure to do so on the main thread.
 @return Task object that represents the asynchronous request and can be cancelled.
 
 @see ACDSKListPropertiesResponse
 @see ACDSKListPropertiesRequest
 */
- (ACDSKTask *)listNodeProperties:(ACDSKListPropertiesRequest *)request
                             fail:(void(^)(NSError *error))errorHandler
                          success:(void(^)(ACDSKListPropertiesResponse *response))successHandler;

/**
 Delete a single property (key-value pair) from a node. App must have write access for the property. A successful request results in an empty response.
 
 @param request The configured request object.
 @param errorHandler Request failure block that handles a given error. When updating UI, be sure to do so on the main thread.
 @param successHandler Request success block that handles a given response. When updating UI, be sure to do so on the main thread.
 @return Task object that represents the asynchronous request and can be cancelled.
 
 @see ACDSKDeletePropertyRequest
 @see ACDSKEmptyResponse
 */
- (ACDSKTask *)deleteNodeProperty:(ACDSKDeletePropertyRequest *)request
                             fail:(void(^)(NSError *error))errorHandler
                          success:(void(^)(ACDSKEmptyResponse *response))successHandler;

/**
 List nodes in the trash.
 
 @param request The configured request object.
 @param errorHandler Request failure block that handles a given error. When updating UI, be sure to do so on the main thread.
 @param successHandler Request success block that handles a given response. When updating UI, be sure to do so on the main thread.
 @return Task object that represents the asynchronous request and can be cancelled.
 
 @see ACDSKListNodesInTrashRequest
 @see ACDSKListNodesInTrashResponse
 */
- (ACDSKTask *)listNodesInTrash:(ACDSKListNodesInTrashRequest *)request
                           fail:(void(^)(NSError *error))errorHandler
                        success:(void(^)(ACDSKListNodesInTrashResponse *response))successHandler;

/**
 Restore a node from the trash.
 
 @param request The configured request object.
 @param errorHandler Request failure block that handles a given error. When updating UI, be sure to do so on the main thread.
 @param successHandler Request success block that handles a given response. When updating UI, be sure to do so on the main thread.
 @return Task object that represents the asynchronous request and can be cancelled.
 
 @see ACDSKRestoreNodeFromTrashRequest
 @see ACDSKRestoreNodeFromTrashResponse
 */
- (ACDSKTask *)restoreNodeFromTrash:(ACDSKRestoreNodeFromTrashRequest *)request
                               fail:(void(^)(NSError *))errorHandler
                            success:(void(^)(ACDSKRestoreNodeFromTrashResponse *response))successHandler;

/**
 Move a node to the trash.
 
 @param request The configured request object.
 @param errorHandler Request failure block that handles a given error. When updating UI, be sure to do so on the main thread.
 @param successHandler Request success block that handles a given response. When updating UI, be sure to do so on the main thread.
 @return Task object that represents the asynchronous request and can be cancelled.
 
 @see ACDSKMoveNodeToTrashRequest
 @see ACDSKMoveNodeToTrashResponse
 */
- (ACDSKTask *)moveNodeToTrash:(ACDSKMoveNodeToTrashRequest *)request
                          fail:(void(^)(NSError *))errorHandler
                       success:(void(^)(ACDSKMoveNodeToTrashResponse *response))successHandler;

/**
 Get changes in a Cloud Drive account. Getting changes periodically will give the delta of the previously known state and the new state, providing an indication of how to update your local state to match the cloud state. Response includes changes since the given checkpoint, or all changes if no checkpoint is specified.
 
 @param request The configured request object.
 @param errorHandler Request failure block that handles a given error. When updating UI, be sure to do so on the main thread.
 @param successHandler Request success block that handles a given response. When updating UI, be sure to do so on the main thread.
 @return Task object that represents the asynchronous request and can be cancelled.
 
 @see ACDSKGetChangesRequest
 @see ACDSKGetChangesResponse
 */
- (ACDSKTask *)getChanges:(ACDSKGetChangesRequest *)request
                     fail:(void(^)(NSError *error))errorHandler
                  success:(void(^)(ACDSKGetChangesResponse *response))successHandler;

/**
 List children of a node.
 
 @param request The configured request object.
 @param errorHandler Request failure block that handles a given error. When updating UI, be sure to do so on the main thread.
 @param successHandler Request success block that handles a given response. When updating UI, be sure to do so on the main thread.
 @return Task object that represents the asynchronous request and can be cancelled.

 @see ACDSKListChildrenRequest
 @see ACDSKListChildrenResponse
 */
- (ACDSKTask *)listChildren:(ACDSKListChildrenRequest *)request
                       fail:(void(^)(NSError *error))errorHandler
                    success:(void(^)(ACDSKListChildrenResponse *response))successHandler;

/**
 Add a node as a child of a parent node. Can be used to add a file (or folder) to a folder. A successful request results in an empty response.
 
 @param request The configured request object.
 @param errorHandler Request failure block that handles a given error. When updating UI, be sure to do so on the main thread.
 @param successHandler Request success block that handles a given response. When updating UI, be sure to do so on the main thread.
 @return Task object that represents the asynchronous request and can be cancelled.

 @see ACDSKAddChildToParentRequest
 @see ACDSKEmptyResponse
 */
- (ACDSKTask *)addChildToParent:(ACDSKAddChildToParentRequest *)request
                           fail:(void(^)(NSError *error))errorHandler
                        success:(void(^)(ACDSKEmptyResponse *response))successHandler;
/**
 Remove a child node from a parent. A successful request results in an empty response.
 
 @param request The configured request object.
 @param errorHandler Request failure block that handles a given error. When updating UI, be sure to do so on the main thread.
 @param successHandler Request success block that handles a given response. When updating UI, be sure to do so on the main thread.
 @return Task object that represents the asynchronous request and can be cancelled.

 @see ACDSKRemoveChildRequest
 @see ACDSKEmptyResponse
 */
- (ACDSKTask *)removeChildFromParent:(ACDSKRemoveChildFromParentRequest *)request
                                fail:(void(^)(NSError *error))errorHandler
                             success:(void(^)(ACDSKEmptyResponse *response))successHandler;

/**
 Download the contents of a file node.
 
 @param request The configured request object.
 @param errorHandler Request failure block that handles a given error. When updating UI, be sure to do so on the main thread.
 @param progressHandler Request progress block that handles given progress between 0 and 1. When updating UI, be sure to do so on the main thread.
 @param successHandler Request success block that handles a given response. When updating UI, be sure to do so on the main thread.
 @return Task object that represents the asynchronous request and can be cancelled.

 @see ACDSKDownloadFileRequest
 @see ACDSKDownloadFileResponse
 */
- (ACDSKTask *)downloadFile:(ACDSKDownloadFileRequest *)request
                       fail:(void(^)(NSError *error))errorHandler
                   progress:(void(^)(float progressed))progressHandler
                    success:(void(^)(ACDSKDownloadFileResponse *response))successHandler;

/**
 Upload the contents of a new file node.
 
 @param request The configured request object.
 @param errorHandler Request failure block that handles a given error. When updating UI, be sure to do so on the main thread.
 @param progressHandler Request progress block that handles given progress between 0 and 1. When updating UI, be sure to do so on the main thread.
 @param successHandler Request success block that handles a given response. When updating UI, be sure to do so on the main thread.
 @return Task object that represents the asynchronous request and can be cancelled.
 
 @see ACDSKUploadFileRequest
 @see ACDSKUploadFileResponse
 */
- (ACDSKTask *)uploadFile:(ACDSKUploadFileRequest *)request
                     fail:(void(^)(NSError *error))errorHandler
                 progress:(void(^)(float progressed))progressHandler
                  success:(void(^)(ACDSKUploadFileResponse *response))successHandler;

@end
