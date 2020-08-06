//
//  YoutubeService.m
//  AppMadeObjc
//
//  Created by Fabio Lindemberg on 03/08/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

#import "YoutubeService.h"
#import "YoutubeItem.h"

@implementation YoutubeService

const NSString *BASE_URL = @"https://www.googleapis.com/youtube/v3/";
const NSString *API_TOKEN = @"AIzaSyD1J5xIVDlZgMCaXrV-Suxg0VKMlTfMhUc";
const int pageSize = 15;

/*
 static let shared = YoutubeService()
 */

+ (void)fetchDetailById: (NSString *)idd
               onSucess: (void (^)(NSData* item)) onSucess
                onError: (void (^)(NSError* error)) onError {
    
    NSString *endpoint = [[NSString alloc] initWithFormat: @"videos?id=%@&part=snippet,statistics&key=%@", idd, API_TOKEN];
    
    NSURL *url = [[NSURL alloc] initWithString: [[NSString alloc] initWithFormat: @"%@%@", BASE_URL, endpoint]];
    
    [[NSURLSession.sharedSession dataTaskWithURL: url
                              completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            onSucess(data);
        } else {
            onError(error);
        }
    }] resume];
}

+ (void)fetchListWithSearchParameter: (SearchParameter *) searchParameter
                            completion: (void (^)(NSData* item)) completion {
    
    NSString *endpoint = @"search?part=id,snippet&";
    NSString *url = [BASE_URL stringByAppendingFormat: @"%@%@&type=video&maxResults=%d&key=%@", endpoint, [searchParameter toString], pageSize, API_TOKEN];
    
    NSLog(@"request for url: %@", url);

    [[NSURLSession.sharedSession dataTaskWithURL: [[NSURL alloc] initWithString: url]
                              completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        completion(data);
    }] resume];
}

@end
