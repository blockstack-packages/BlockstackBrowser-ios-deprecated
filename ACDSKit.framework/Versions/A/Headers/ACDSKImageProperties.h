//
//  ACDSKImageProperties.h
//
//  Copyright (c) 2015 Amazon.com. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 Image-specific metadata of a node.
 
 @see ACDSKContentProperties
 @see ACDSKNode
 */
@interface ACDSKImageProperties : NSObject <NSCoding, NSCopying>

/**
 Width of the image, e.g. 3000.
 */
@property (nonatomic, assign) NSInteger width;

/**
 Height of the image, e.g. 2000.
 */
@property (nonatomic, assign) NSInteger height;

/**
 Exposure used to capture the image, e.g. 1/320.
 */
@property (nonatomic, strong) NSString *exposureTime;

/**
 Aperture used to capture the image, e.g. 4.
 */
@property (nonatomic, strong) NSString *apertureValue;

/**
 Focal length used to capture the image, e.g. 200.
 */
@property (nonatomic, strong) NSString *focalLength;

/**
 ISO used to capture image, e.g. 200.
 */
@property (nonatomic, strong) NSString *isoSpeedRatings;

/**
 White balance used to capture the image, e.g. Auto.
 */
@property (nonatomic, strong) NSString *whiteBalance;

/**
 Location of the image in latitude and longitude.
 */
@property (nonatomic, strong) NSString *location;

/**
 Software used to create the image.
 */
@property (nonatomic, strong) NSString *software;

/**
 Date of the image. Formatted as ISO8601 date, e.g. 2015-04-03T02:01:00.123Z
 */
@property (nonatomic, strong) NSString *dateTime;

/**
 Original date of the image. Formatted as ISO8601 date, e.g. 2015-04-03T02:01:00.123Z
 */
@property (nonatomic, strong) NSString *dateTimeOriginal;

/**
 Date the image was digitized. Formatted as ISO8601 date, e.g. 2015-04-03T02:01:00.123Z
 */
@property (nonatomic, strong) NSString *dateTimeDigitized;

/**
 Resolution of the image in the x-axis, e.g. 72.
 */
@property (nonatomic, strong) NSString *xResolution;

/**
 Resolution of the image in the y-axis, e.g. 72.
 */
@property (nonatomic, strong) NSString *yResolution;

/**
 Resolution unit of the image, e.g. Pixels/Inch.
 */
@property (nonatomic, strong) NSString *resolutionUnit;

/**
 Metering mode used to capture the image, e.g. Partial.
 */
@property (nonatomic, strong) NSString *meteringMode;

/**
 GPS timestamp of the image, e.g. 20:16:40.123456789.
 */
@property (nonatomic, strong) NSString *gpsTimeStamp;

/**
 Make of the device used to create the image, e.g. Nikon.
 */
@property (nonatomic, strong) NSString *make;

/**
 Model of the device used to create the image, e.g. Nikon D3.
 */
@property (nonatomic, strong) NSString *model;

/**
 Sharpness of the image.
 */
@property (nonatomic, strong) NSString *sharpness;

/**
 Exposure mode used to capture the image, e.g. Auto Exposure.
 */
@property (nonatomic, strong) NSString *exposureMode;

/**
 Orientation of the image, e.g. 1.
 */
@property (nonatomic, strong) NSString *orientation;

/**
 Capture mode used to capture the image.
 */
@property (nonatomic, strong) NSString *captureMode;

/**
 Exposure program used to capture the image, e.g. Program Normal.
 */
@property (nonatomic, strong) NSString *exposureProgram;

/**
 Sensing method used to capture the image, e.g. One-chip color area.
 */
@property (nonatomic, strong) NSString *sensingMethod;

/**
 Flash status used to capture image, e.g. Off.
 */
@property (nonatomic, strong) NSString *flash;

/**
 Color space of the image, e.g. sRGB.
 */
@property (nonatomic, strong) NSString *colorSpace;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
