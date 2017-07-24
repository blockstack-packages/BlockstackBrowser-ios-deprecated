//
//  ACDSKit.h
//  ACDSKit
//
//  Copyright (c) 2015 Cloud Drive. All rights reserved.
//

// Foundation
#import <Foundation/Foundation.h>

// Client
#import <ACDSKit/ACDSKClient.h>
#import <ACDSKit/ACDSKitConstants.h>
#import <ACDSKit/ACDSKTask.h>

// Request
#import <ACDSKit/ACDSKRequest.h>

// Response
#import <ACDSKit/ACDSKResponse.h>
#import <ACDSKit/ACDSKEmptyResponse.h>
#import <ACDSKit/ACDSKPaginatedResponse.h>

// Account
// Account / Request
#import <ACDSKit/ACDSKAccountEndpointRequest.h>
#import <ACDSKit/ACDSKAccountInfoRequest.h>
#import <ACDSKit/ACDSKAccountQuotaRequest.h>
#import <ACDSKit/ACDSKAccountUsageRequest.h>
// Account / Response
#import <ACDSKit/ACDSKAccountEndpointResponse.h>
#import <ACDSKit/ACDSKAccountInfoResponse.h>
#import <ACDSKit/ACDSKAccountQuotaResponse.h>
#import <ACDSKit/ACDSKAccountUsageResponse.h>
#import <ACDSKit/ACDSKAccountUsageSummary.h>
#import <ACDSKit/ACDSKAccountUsageDetail.h>

// Changes / Request
#import <ACDSKit/ACDSKGetChangesRequest.h>
// Changes / Response
#import <ACDSKit/ACDSKGetChangesResponse.h>
#import <ACDSKit/ACDSKChangeChunk.h>

// Nodes
#import <ACDSKit/ACDSKNode.h>
#import <ACDSKit/ACDSKContentProperties.h>
#import <ACDSKit/ACDSKDocumentProperties.h>
#import <ACDSKit/ACDSKImageProperties.h>
#import <ACDSKit/ACDSKVideoProperties.h>
// Nodes / Request
#import <ACDSKit/ACDSKCreateNodeRequest.h>
#import <ACDSKit/ACDSKUpdateNodeRequest.h>
#import <ACDSKit/ACDSKUploadFileRequest.h>
#import <ACDSKit/ACDSKDownloadFileRequest.h>
#import <ACDSKit/ACDSKGetNodeRequest.h>
#import <ACDSKit/ACDSKListNodesRequest.h>
#import <ACDSKit/ACDSKListChildrenRequest.h>
#import <ACDSKit/ACDSKAddChildToParentRequest.h>
#import <ACDSKit/ACDSKRemoveChildFromParentRequest.h>
#import <ACDSKit/ACDSKGetPropertyRequest.h>
#import <ACDSKit/ACDSKListPropertiesRequest.h>
#import <ACDSKit/ACDSKAddPropertyRequest.h>
#import <ACDSKit/ACDSKDeletePropertyRequest.h>
// Nodes / Response
#import <ACDSKit/ACDSKCreateNodeResponse.h>
#import <ACDSKit/ACDSKUpdateNodeResponse.h>
#import <ACDSKit/ACDSKUploadFileResponse.h>
#import <ACDSKit/ACDSKDownloadFileResponse.h>
#import <ACDSKit/ACDSKGetNodeResponse.h>
#import <ACDSKit/ACDSKListNodesResponse.h>
#import <ACDSKit/ACDSKListChildrenResponse.h>
#import <ACDSKit/ACDSKGetPropertyResponse.h>
#import <ACDSKit/ACDSKListPropertiesResponse.h>
#import <ACDSKit/ACDSKAddPropertyResponse.h>

// Trash
// Trash / Request
#import <ACDSKit/ACDSKListNodesInTrashRequest.h>
#import <ACDSKit/ACDSKMoveNodeToTrashRequest.h>
#import <ACDSKit/ACDSKRestoreNodeFromTrashRequest.h>
// Trash / Response
#import <ACDSKit/ACDSKListNodesInTrashResponse.h>
#import <ACDSKit/ACDSKMoveNodeToTrashResponse.h>
#import <ACDSKit/ACDSKRestoreNodeFromTrashResponse.h>
