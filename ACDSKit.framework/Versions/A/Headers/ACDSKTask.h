//
//  ATask.h
//  ACDSKit
//
//  Copyright (c) 2015 Cloud Drive. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Represents an asynchronous request that can be cancelled.
 
 @see ACDSKClient
 */
@interface ACDSKTask : NSObject

/**
 ID of the task.
 */
@property (nonatomic, readonly, copy) NSString *taskIdentifier;

/**
 Cancel the task. Results in error with code AMZNCDSKURLErrorOperationCancelled.
 */
- (void)cancel;

@end
