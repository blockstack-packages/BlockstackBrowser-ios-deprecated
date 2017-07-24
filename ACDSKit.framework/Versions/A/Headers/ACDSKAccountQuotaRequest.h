//
//  ACDSKAccountQuotaRequest.h
//  ACDSKit
//
//  Copyright (c) 2015 Cloud Drive. All rights reserved.
//

#import <ACDSKit/ACDSKit.h>

/**
 Request to get account quota information, including quota (total space), space available, and the time that the information was last calculated. Available space should not be used as an indicator of whether upload is possible - instead, check for a 403 status code when requesting to upload a file.
 
 @see ACDSKAccountQuotaResponse
 */
@interface ACDSKAccountQuotaRequest : ACDSKRequest

@end
