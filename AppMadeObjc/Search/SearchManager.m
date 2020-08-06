//
//  SearchManager.m
//  AppMadeObjc
//
//  Created by Fabio Lindemberg on 06/08/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

#import "SearchManager.h"
#import "YoutubeService.h"

@implementation SearchManager

+ (void)fetchListWithSearchParameter: (SearchParameter *) searchParameter
                            onSucess: (void (^)(NSArray<YoutubeItem*>* youtubeItens)) onSucess
                             onError: (void (^)(ServiceError * _Nullable))onError {
    [YoutubeService fetchListWithSearchParameter: searchParameter completion: ^(NSData * _Nonnull data) {
        
        NSString * jsonString = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
        
        NSLog(@"stringdata: %@", jsonString);
        
        NSData * jsonData = [jsonString dataUsingEncoding: NSUTF8StringEncoding];
        NSError * serviceError=nil;
        NSDictionary * parsedData = [NSJSONSerialization JSONObjectWithData: jsonData
                                                                    options: kNilOptions
                                                                      error: &serviceError];
        
        if (parsedData[@"error"] == nil) {
            NSArray<YoutubeItem*> *values = [YoutubeItem initFromArray: [parsedData objectForKey: @"items"]];
            onSucess(values);
        } else {
            ServiceError *serviceError = [[ServiceError alloc] initWithParse: parsedData[@"error"]];
            onError(serviceError);
        }
    }];
}

@end
