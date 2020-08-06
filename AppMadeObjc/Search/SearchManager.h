//
//  SearchManager.h
//  AppMadeObjc
//
//  Created by Fabio Lindemberg on 06/08/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

#import "YoutubeItem.h"
#import "SearchParameter.h"
#import "ServiceError.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchManager : NSObject

+ (void)fetchListWithSearchParameter: (SearchParameter *) searchParameter
                            onSucess: (void (^)(NSArray<YoutubeItem*>* youtubeItens)) onSucess
                             onError: (void (^)(ServiceError * _Nullable))onError;

@end

NS_ASSUME_NONNULL_END
