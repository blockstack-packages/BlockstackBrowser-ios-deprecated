//
//  ACDSKListChildrenRequest.h
//  ACDSKit
//
//  Copyright (c) 2015 Cloud Drive. All rights reserved.
//

#import <ACDSKit/ACDSKit.h>
/**
 Request to list children of a node.
 
 @see ACDSKListChildrenResponse
 */
@interface ACDSKListChildrenRequest : ACDSKRequest

/**
 (required) ID of the parent node.
 */
@property (nonatomic, copy) NSString *parentID;

/**
 (optional) Filters on the nodes to include. Basic filter syntax is property:value. Examples of simple filters include @"kind:FILE" (for files) and @"contentProperties.contentType:image*" (for nodes of any image content type). See the SDK guide for more options and information.
 */
@property (nonatomic, copy) NSString *filters;

/**
 (optional) A token indicating where the contents of the listing should begin. Set to the nextToken from the response to the previous request to list additional nodes.
 
 @see ACDSKPaginatedResponse
 */
@property (nonatomic, copy) NSString *startToken;

/**
 (optional) Sort rules for the nodes. Basic sort rules syntax is a list of sort properties - each of which optionally paired with a sort order - i.e. ["property1 ASC", "property2"]. If a sort order is not specified for a sort property, sort order defaults to DESC. Examples of simple sort orders (with proper escaping) include @"[\"name ASC\"] (for alphabetical) and @"[\"createdDate\"] (for most recent). See the SDK guide for more options and information.
 */
@property (nonatomic, copy) NSString *sort;


/**
 (optional) Limit for the number of nodes to include. Defaults to 200.
 */
@property (nonatomic) NSUInteger limit;

/**
 (optional) What type of assets should be included in the response for the listed nodes. Options include NONE and ALL. Defaults to NONE.
 */
@property (nonatomic, copy) NSString *assetMapping;

/**
 (optional) Whether to include in the response temporary URL strings for directly accessing the content of each node without authentication. Defaults to NO.
 */
@property (nonatomic) BOOL tempLink;

@end
