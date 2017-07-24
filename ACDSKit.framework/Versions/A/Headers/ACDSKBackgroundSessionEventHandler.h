//
//  ACDSKBackgroundSessionEventHandler.h
//  ACDSKit
//
//  Copyright (c) 2015 Cloud Drive. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 The object that can be used to re-register action blocks to handle error, progress and success for background request 
 such as ACDSKDownloadFileRequest after application is terminated.
 
 It is recommended to use as soon as possible either in 
 application:handleEventsForBackgroundURLSession:completionHandler: or -application:didFinishLaunchingWithOptions: 
 if launchOptions does not contain "UIApplicationLaunchOptionsURLSessionKey" key.
 */
@interface ACDSKBackgroundSessionEventHandler : NSObject

/**
 Identifier for the ACDSKTask
 */
@property (nonatomic, readonly, copy) NSString *taskIdentifier;

/**
 Block for handling errors
 */
@property (nonatomic, readonly, copy) void(^errorHandler)(NSError *error);

/**
 Block for handling progress updates
 */
@property (nonatomic, readonly, copy) void(^progressHandler)(float progressed);

/**
 Block for handling a successful response
 */
@property (nonatomic, readonly, copy) void(^successHandler)(id response);

/**
 Initialize ACDSKBackgroundSessionEventHandler object.
 
 @param taskIdentifier taskIdentifier from ACDSKTask object which returns from ACDSKClient methods.
 @param errorHandler Block handler to handle error for specified taskIdentifier
 @param progressHandler Block handler to handle progress update for specified taskIdentifier
 @param successHandler Block handler to handle successful response for specified taskIdentifier
 
 @see ACDSKClient
 @see ACDSKTask
 */
- (instancetype)initWithTaskIdentifier:(NSString *)taskIdentifier
                                  fail:(void(^)(NSError *error))errorHandler
                              progress:(void(^)(float progressed))progressHandler
                               success:(void(^)(id response))successHandler;

/**
 Creates ACDSKBackgroundSessionEventHandler object.
 
 @param taskIdentifier taskIdentifier from ACDSKTask object which returns from ACDSKClient methods.
 @param errorHandler Block handler to handle error for specified taskIdentifier
 @param progressHandler Block handler to handle progress update for specified taskIdentifier
 @param successHandler Block handler to handle successful response for specified taskIdentifier
 
 @see ACDSKClient
 @see ACDSKTask
 */
+ (instancetype)backgroundSessionEventHandlerWithTaskIdentifier:(NSString *)taskIdentifier
                                                           fail:(void(^)(NSError *error))errorHandler
                                                       progress:(void(^)(float progressed))progressHandler
                                                        success:(void(^)(id response))successHandler;

@end
