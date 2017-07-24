//
//  ACDSKAccountInfoResponse.h
//  ACDSKit
//
//  Copyright (c) 2015 Cloud Drive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ACDSKit/ACDSKit.h>

/**
 Response for request to get account info. Includes version of accepted terms of use and also account status.
 
 @see ACDSKAccountInfoRequest
 */
@interface ACDSKAccountInfoResponse : ACDSKResponse <NSCoding, NSCopying>

/**
 Version of accepted terms of use.
 */
@property (nonatomic, strong) NSString *termsOfUse;

/**
 Status of the account, e.g. @"ACTIVE".
 */
@property (nonatomic, strong) NSString *status;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
