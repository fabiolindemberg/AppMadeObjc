//
//  SearchPresenter.h
//  AppMadeObjc
//
//  Created by Fabio Lindemberg on 03/08/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YoutubeItem.h"

NS_ASSUME_NONNULL_BEGIN

@protocol SearchPresenterDelegate <NSObject>

- (void) dataLoaded;
- (void) loading: (BOOL) isLoading;
- (void) showMessage: (NSString *) message
             andType: (NSString *) type;
@end

@interface SearchPresenter : NSObject

- (instancetype) initWithDelegate: (id<SearchPresenterDelegate>) delegate;
- (void) fetchListWithSearchParameter: (NSString *) searchText;
- (NSInteger) getNumberOfItems;
- (YoutubeItem*) getItemAtIndex: (NSInteger) index;

- (void) pushDetailAtIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
