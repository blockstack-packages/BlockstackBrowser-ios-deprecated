//
//  ACDSKGetNodeRequest.h
//  ACDSKit
//
//  Copyright (c) 2015 Cloud Drive. All rights reserved.
//

#import <ACDSKit/ACDSKit.h>

/**
 Request to get a node.
 
 @see ACDSKGetNodeResponse
 */
@interface ACDSKGetNodeRequest : ACDSKRequest

/**
 (required) ID of the node.
 */
@property (nonatomic, copy) NSString *nodeID;

/**
 (optional) What type of assets should be included in the response for the given node. Options include NONE and ALL. Defaults to NONE.
 */
@property (nonatomic, copy) NSString *assetMapping;

/**
 (optional) Whether to include in the response a temporary URL string for directly accessing the content of the node without authentication. Defaults to NO.
 */
@property (nonatomic) BOOL tempLink;

/**
 (optional) Additional fields to include in the response, e.g. ["properties"].
 */
@property (nonatomic, copy) NSString *fields;


@end
