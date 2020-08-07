//
//  DetailManager.h
//  AppMadeObjc
//
//  Created by Fabio Lindemberg on 06/08/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YoutubeItem.h"
#import "ServiceError.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailManager : NSObject

+ (void)fetchDetailByIdentifier: (NSString *) identifier
                       onSucess: (void (^)(YoutubeItem *youtubeItem)) onSucess
                        onError: (void (^)(ServiceError * _Nullable))onError;

@end

NS_ASSUME_NONNULL_END
