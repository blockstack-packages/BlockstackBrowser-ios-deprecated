//
//  ACDSKMoveNodeToTrashRequest.h
//  ACDSKit
//
//  Copyright (c) 2015 Cloud Drive. All rights reserved.
//

#import <ACDSKit/ACDSKit.h>

/**
 Request to move a node to the trash.
 
 @see ACDSKMoveNodeToTrashResponse
 */
@interface ACDSKMoveNodeToTrashRequest : ACDSKRequest

/**
 (required) ID of the node.
 */
@property (nonatomic, copy) NSString *nodeID;

@end
