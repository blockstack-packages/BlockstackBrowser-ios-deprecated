//
//  ACDSKGetChangesResponse.h
//  ACDSKit
//
//  Copyright (c) 2015 Cloud Drive. All rights reserved.
//

#import <ACDSKit/ACDSKit.h>

/**
 Response for request to get changes in a Cloud Drive account.
 
 @see ACDSKGetChangesRequest
 */
@interface ACDSKGetChangesResponse : ACDSKResponse

/**
 Array of chunks of nodes that had changes.
 
 @see ACDSKChangeChunk
 */
@property (strong, nonatomic) NSArray *chunks;

/**
 Whether this response is the end of the changes to report for the request. If NO, then the client should make additional requests to get changes.
 */
@property (assign, nonatomic) BOOL end;

+ (instancetype)modelObjectWithArray:(NSArray *)array;
- (instancetype)initWithArray:(NSArray *)array;
- (NSArray *)arrayRepresentation;

@end
