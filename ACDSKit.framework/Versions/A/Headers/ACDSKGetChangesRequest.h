//
//  ACDSKGetChangesRequest.h
//  ACDSKit
//
//  Copyright (c) 2015 Cloud Drive. All rights reserved.
//

#import <ACDSKit/ACDSKit.h>

/**
 Request to get changes in a Cloud Drive account. Getting changes periodically will give the delta of the previously known state and the new state, providing an indication of how to update your local state to match the cloud state. Response includes changes since the given checkpoint, or all changes if no checkpoint is specified.
 
 @see ACDSKGetChangesResponse
 */
@interface ACDSKGetChangesRequest : ACDSKRequest

/**
 (optional) Whether to include purged nodes in the response. Defaults to NO.
 */
@property (nonatomic) BOOL includePurged;

/**
 (optional) The number of nodes to be returned in each chunk of the response.
 
 @see ACDSKChangeChunk
 */
@property (nonatomic) NSUInteger chunkSize;

/**
 (optional) The maximum number of total nodes to be returned. This is not intended to be used for strict pagination as the number of nodes returned may exceed this number.
 */
@property (nonatomic) NSUInteger maxNodes;

/**
 (optional) A token representing a frontier of changed nodes.
 
 @see ACDSKChangeChunk
 */
@property (nonatomic, copy) NSString *checkpoint;

@end
