//
//  ACDSKListNodesInTrashRequest.h
//  ACDSKit
//
//  Copyright (c) 2015 Cloud Drive. All rights reserved.
//

#import <ACDSKit/ACDSKit.h>

/**
 Request to list nodes in the trash.
 
 @see ACDSKListNodesInTrashResponse
 */
@interface ACDSKListNodesInTrashRequest : ACDSKRequest

/**
 (optional) Limit for the number of nodes to include. Defaults to 200.
 */
@property (nonatomic) NSUInteger limit;

/**
 (optional) A token indicating where the contents of the listing should begin. Set to the nextToken from the response to the previous request to list additional nodes.
 
 @see ACDSKPaginatedResponse
 */
@property (nonatomic, copy) NSString *startToken;

@end
