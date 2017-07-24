//
//  ACDSKAccountUsageDetail.h
//
//  Copyright (c) 2015 Amazon.com. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Details of usage for total or billable storage for a certain kind of data stored in Cloud Drive (e.g. documents, photos, videos, or other). Includes the number of files stored and the number of bytes occupied by those files.
 
 @see ACDSKAccountUsageSummary
 @see ACDSKAccountUsageResponse
 */
@interface ACDSKAccountUsageDetail : NSObject <NSCoding, NSCopying>

/**
 Number of bytes stored.
 */
@property (nonatomic, assign) int64_t bytes;

/**
 Number of files stored.
 */
@property (nonatomic, assign) int64_t count;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
