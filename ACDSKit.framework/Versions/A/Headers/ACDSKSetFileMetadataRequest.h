//
//  ACDSKSetFileMetadataRequest.h
//  ACDSKit
//
//  Copyright (c) 2015 Cloud Drive. All rights reserved.
//

#import <ACDSKit/ACDSKit.h>

@interface ACDSKSetFileMetadataRequest : ACDSKRequest

//id : Globally unique node-id.
@property (nonatomic, copy) NSString *nodeID;

//name : (required) file name. Max to 256 Characters.
@property (nonatomic, copy) NSString *name;

//labels : (optional) Extra information which is indexed. For example the value can be "PHOTO"
@property (nonatomic, copy) NSArray *labels;

//restricted : (optional) true/false. default to false. this property should not be exposed in the public SDK.
@property (nonatomic) BOOL restricted;

//properties : (optional) List of properties to be added for the file.
@property (nonatomic, copy) NSDictionary *properties;

//parents : (optional) List of parent Ids.
@property (nonatomic, copy) NSArray *parents;

@property (nonatomic, copy) NSString *ETag;

@end
