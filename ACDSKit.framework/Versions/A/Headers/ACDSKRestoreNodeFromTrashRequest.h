//
//  ACDSKRestoreNodeFromTrashRequest.h
//  ACDSKit
//
//  Copyright (c) 2015 Cloud Drive. All rights reserved.
//

#import <ACDSKit/ACDSKit.h>

/**
 Request to restore a node from the trash.
 
 @see ACDSKRestoreNodeFromTrashResponse
 */
@interface ACDSKRestoreNodeFromTrashRequest : ACDSKRequest

/**
 (required) ID of the node.
 */
@property (nonatomic, copy) NSString *nodeID;

@end
