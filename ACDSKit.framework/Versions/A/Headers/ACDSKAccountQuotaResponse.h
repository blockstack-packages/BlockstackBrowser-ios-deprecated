//
//  ACDSKAccountQuotaResponse.h
//
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <ACDSKit/ACDSKit.h>

/**
 Response for request to get account quota. Includes quota (total space), space available, and the time that the information was last calculated. Available space should not be used as an indicator of whether upload is possible - instead, check for a 403 status code when requesting to upload a file.
 
 @see ACDSKAccountQuotaRequest
 */
@interface ACDSKAccountQuotaResponse : ACDSKResponse <NSCoding, NSCopying>

/**
 Account storage available space in bytes. Available space should not be used to check on upload ability - check instead for a 403 status code on file upload.
 */
@property (nonatomic, assign) int64_t available;

/**
 String representing time that quota information was last calculated.
 */
@property (nonatomic, strong) NSString *lastCalculated;

/**
 Account storage total space in bytes.
 */
@property (nonatomic, assign) int64_t quota;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
