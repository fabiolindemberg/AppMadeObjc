//
//  YoutubeService.h
//  AppMadeObjc
//
//  Created by Fabio Lindemberg on 03/08/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServiceError.h"
#import "SearchParameter.h"


NS_ASSUME_NONNULL_BEGIN

@interface YoutubeService : NSObject

+ (void) fetchDetailById: (NSString *) idd
              completion: (void (^)(NSData* item)) completion;

+ (void)fetchListWithSearchParameter: (SearchParameter *) searchParameter
                          completion: (void (^)(NSData* item)) completion;
@end

NS_ASSUME_NONNULL_END
