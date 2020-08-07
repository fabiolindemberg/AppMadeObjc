//
//  DetailPresenter.h
//  AppMadeObjc
//
//  Created by Fabio Lindemberg on 06/08/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YoutubeItem.h"

NS_ASSUME_NONNULL_BEGIN

@protocol DetailPresenterDelegate <NSObject>

- (void) dataLoaded;
- (void) loading: (BOOL) isLoading;
- (void) showMessage: (NSString *) message
             andType: (NSString *) type;
@end

@interface DetailPresenter : NSObject

@property (nonatomic, nullable) YoutubeItem *youtubeItem;

- (instancetype) initWithDelegate: (id<DetailPresenterDelegate>) delegate
                    andIdentifier: (NSString *) identifier;

@end

NS_ASSUME_NONNULL_END
