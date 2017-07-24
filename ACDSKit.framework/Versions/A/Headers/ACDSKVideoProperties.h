//
//  ACDSKVideoProperties.h
//
//  Copyright (c) 2015 Amazon.com. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 Video-specific metadata of a node.
 
 @see ACDSKContentProperties
 @see ACDSKNode
 */
@interface ACDSKVideoProperties : NSObject <NSCoding, NSCopying>

/**
 Audio bitrate of the video, e.g. 63219.
 */
@property (nonatomic, assign) double audioBitrate;

/**
 Creation date of the video. Formatted as ISO8601 date, e.g. 2015-04-03T02:01:00.123Z
 */
@property (nonatomic, strong) NSString *creationDate;

/**
 Rotation of the video in degrees, e.g. 90.
 */
@property (nonatomic, assign) NSInteger rotate;

/**
 Audio codec of the video, e.g. aac.
 */
@property (nonatomic, strong) NSString *audioCodec;

/**
 Audio sample rate of the vide, e.g. 44100.
 */
@property (nonatomic, assign) double audioSampleRate;

/**
 Width of the video, e.g. 1920.
 */
@property (nonatomic, assign) NSInteger width;

/**
 The height of the video, e.g. 1080.
 */
@property (nonatomic, assign) NSInteger height;

/**
 Encoder of the video, e.g. 7.1.
 */
@property (nonatomic, strong) NSString *encoder;

/**
 Title of the video.
 */
@property (nonatomic, strong) NSString *title;

/**
 Video bitrate of the video, e.g. 13388331.
 */
@property (nonatomic, assign) double videoBitrate;

/**
 Location of the video in latitude and longitude.
 */
@property (nonatomic, strong) NSString *location;

/**
 Overall bitrate of the video, e.g. 13434190.
 */
@property (nonatomic, assign) double bitrate;

/**
 Audio channel layout of the video, e.g. mono.
 */
@property (nonatomic, strong) NSString *audioChannelLayout;

/**
 Video codec of the video, e.g. h264.
 */
@property (nonatomic, strong) NSString *videoCodec;

/**
 Make of the device used to create the video, e.g. Apple.
 */
@property (nonatomic, strong) NSString *make;

/**
 Model of the device used to create the video, e.g. iPhone 6.
 */
@property (nonatomic, strong) NSString *model;

/**
 Video frame rate of the video, e.g. 29.97003.
 */
@property (nonatomic, assign) double videoFrameRate;

/**
 Duration of the video, e.g. 10.263220.
 */
@property (nonatomic, assign) double duration;

/**
 Number of audio channels in the video, e.g. 1.
 */
@property (nonatomic, assign) NSInteger audioChannels;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
