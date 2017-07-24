//
//  ACDSKAccountUsageSummary.h
//
//  Copyright (c) 2015 Amazon.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ACDSKAccountUsageDetail;

/**
 Summary of usage for a certain kind of data stored in Cloud Drive (e.g. documents, photos, videos, or other). Provides access to detailed usage information for total and billable storage.
 
 @see ACDSKAccountUsageDetail
 @see ACDSKAccountUsageResponse
 */
@interface ACDSKAccountUsageSummary : NSObject <NSCoding, NSCopying>

/**
 Detailed usage information for total storage.
 */
@property (nonatomic, strong) ACDSKAccountUsageDetail *total;

/**
 Detailed usage information for billable storage.
 */
@property (nonatomic, strong) ACDSKAccountUsageDetail *billable;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
