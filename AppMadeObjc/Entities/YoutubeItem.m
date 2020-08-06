//
//  YoutubeItem.m
//  AppMadeObjc
//
//  Created by Fabio Lindemberg on 05/08/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

#import "YoutubeItem.h"

@implementation Statistic

- (instancetype) initWithParse: (NSDictionary *) data {
    self = [super init];
    
    if (self) {
        self.likeCount = data[@"likeCount"];
        self.viewCount = data[@"viewCount"];
    }
    
    return self;
}

@end

@implementation ImageInfo

- (instancetype) initWithParse: (NSDictionary *) data {
    self = [super init];
    
    if (self) {
        self.url = data[@"url"];
        self.width = [data[@"width"] intValue];
        self.height =[data[@"height"] intValue];
    }
    
    return self;
}
@end

@implementation Thumbnails

- (instancetype) initWithParse: (NSDictionary *) data {
    self = [super init];
    
    if (self) {
        self.high = [[ImageInfo alloc] initWithParse: data[@"high"]];
        self.medium = [[ImageInfo alloc] initWithParse: data[@"medium"]];
    }
    
    return self;
}
@end

@implementation Snippet

- (instancetype) initWithParse: (NSDictionary *) data {
    self = [super init];
    
    if (self) {
        self.title = data[@"title"];
        self.desc = data[@"description"];
        self.thumbnails = [[Thumbnails alloc] initWithParse: data[@"thumbnails"]];
    }
    
    return self;
}
@end

@implementation YoutubeIdentifier

- (instancetype) initWithParse: (NSDictionary *) data {
    self = [super init];
    
    if (self) {
        self.videoId = data[@"id"];
        self.kind = data[@"kind"];
    }
    
    return self;
}
@end

@implementation YoutubeItem

- (instancetype) initWithParse: (NSDictionary *) data {
    self = [super init];
    
    if (self) {
        self.identifier = [[YoutubeIdentifier alloc] initWithParse: data[@"id"]];
        self.statistics = [[Statistic alloc] initWithParse: data[@"statistics"]];
        self.snippet = [[Snippet alloc] initWithParse: data[@"snippet"]];
    }
    
    return self;
}

+ (NSArray<YoutubeItem *> *)initFromArray:(id)youtybeItems {

    NSMutableArray<YoutubeItem*> *array = [NSMutableArray<YoutubeItem*> array];

    if([youtybeItems isKindOfClass:[NSArray class]])
    {
        for(NSDictionary *itemDic in youtybeItems)
        {
            YoutubeItem *item = [[YoutubeItem alloc] initWithParse: itemDic];
            [array addObject:item];
        }
    }
    
    return [NSArray arrayWithArray:array];
}
@end
