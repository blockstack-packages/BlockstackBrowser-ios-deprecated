//
//  ACDSKAccountUsageResponse.h
//
//  Copyright (c) 2015 Amazon.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ACDSKit/ACDSKit.h>

@class ACDSKAccountUsageSummary;

/**
 Response for request to get account usage information. Includes a summary for each type of data stored in Cloud Drive.
 
 @see ACDSKAccountUsageRequest
 @see ACDSKAccountUsageSummary
 */
@interface ACDSKAccountUsageResponse : ACDSKResponse <NSCoding, NSCopying>

/**
 String representing time that usage information was last calculated.
 */
@property (nonatomic, strong) NSString *lastCalculated;

/**
 Summary of usage for document files.
 */
@property (nonatomic, strong) ACDSKAccountUsageSummary *doc;

/**
 Summary of usage for photo files.
 */
@property (nonatomic, strong) ACDSKAccountUsageSummary *photo;

/**
 Summary of usage for video files.
 */
@property (nonatomic, strong) ACDSKAccountUsageSummary *video;

/**
 Summary of usage for other types of files.
 */
@property (nonatomic, strong) ACDSKAccountUsageSummary *other;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
