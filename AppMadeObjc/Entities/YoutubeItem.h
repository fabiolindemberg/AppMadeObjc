//
//  YoutubeItem.h
//  AppMadeObjc
//
//  Created by Fabio Lindemberg on 05/08/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Statistic: NSObject

@property (nonatomic) NSString *viewCount;
@property (nonatomic) NSString *likeCount;

- (instancetype) initWithParse: (NSDictionary *) data;
@end

@interface ImageInfo: NSObject

@property (nonatomic) NSString *url;
@property (nonatomic) int width;
@property (nonatomic) int height;

- (instancetype) initWithParse: (NSDictionary *) data;
@end

@interface Thumbnails: NSObject

@property (nonatomic) ImageInfo *medium;
@property (nonatomic) ImageInfo *high;

- (instancetype) initWithParse: (NSDictionary *) data;
@end

@interface Snippet: NSObject

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *desc;
@property (nonatomic) Thumbnails *thumbnails;

- (instancetype) initWithParse: (NSDictionary *) data;
@end

@interface YoutubeIdentifier: NSObject

@property (nonatomic) NSString *kind;
@property (nonatomic) NSString *videoId;

- (instancetype) initWithParse: (NSDictionary *) data;
@end

@interface YoutubeItem : NSObject

@property (nonatomic) YoutubeIdentifier *identifier;
@property (nonatomic) Statistic *statistics;
@property (nonatomic) Snippet *snippet;

- (instancetype) initWithParse: (NSDictionary *) data;
+ (NSArray<YoutubeItem*>*) initFromArray: (id) youtybeItems;
@end

NS_ASSUME_NONNULL_END
