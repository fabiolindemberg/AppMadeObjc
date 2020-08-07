//
//  DetailManager.m
//  AppMadeObjc
//
//  Created by Fabio Lindemberg on 06/08/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

#import "DetailManager.h"
#import "YoutubeService.h"

@implementation DetailManager

+ (void)fetchDetailByIdentifier: (NSString *) identifier
                     onSucess: (void (^)(YoutubeItem *youtubeItem)) onSucess
                        onError: (void (^)(ServiceError * _Nullable))onError {
    [YoutubeService fetchDetailByIdentifier: identifier completion:^(NSData * _Nonnull data) {
        
        NSString * jsonString = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
        
        NSLog(@"stringdata: %@", jsonString);
        
        NSData * jsonData = [jsonString dataUsingEncoding: NSUTF8StringEncoding];
        NSError * serviceError=nil;
        NSDictionary * parsedData = [NSJSONSerialization JSONObjectWithData: jsonData
                                                                    options: kNilOptions
                                                                      error: &serviceError];
        
        if (parsedData[@"error"] == nil) {
            YoutubeItem *youtubeItem = [[YoutubeItem alloc] initWithParse: [parsedData objectForKey: @"item"]];
            onSucess(youtubeItem);
        } else {
            ServiceError *serviceError = [[ServiceError alloc] initWithParse: parsedData[@"error"]];
            onError(serviceError);
        }
    }];
}

@end
