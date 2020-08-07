//
//  SearchPresenter.m
//  AppMadeObjc
//
//  Created by Fabio Lindemberg on 03/08/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

#import "SearchPresenter.h"
#import "SearchManager.h"
#import "ServiceError.h"
#import "SearchParameter.h"
#import "SearchRouter.h"

@implementation SearchPresenter

id<SearchPresenterDelegate> _detail;
NSMutableArray<YoutubeItem*> *_list;
SearchParameter *searchParameter;

- (instancetype)initWithDelegate:(id<SearchPresenterDelegate>)delegate {
    
    self = [super init];
    
    if (self) {
        _detail = delegate;
        
        searchParameter = [SearchParameter new];
        
        _list = [NSMutableArray<YoutubeItem*> new];
    }
    
    return self;
}
    
- (void) fetchListWithSearchParameter: (NSString *) searchText {

    searchParameter.q = searchText;
    
    [SearchManager fetchListWithSearchParameter: searchParameter
                                        onSucess:^(NSArray<YoutubeItem*> * _Nonnull youtubeItens) {
        [_list addObjectsFromArray: youtubeItens];
        
        [_detail dataLoaded];

        [_detail  showMessage: @"It works@"
                            andType: @"success"];
        }
         onError:^(ServiceError * _Nonnull serviceError) {
            [_detail  showMessage: serviceError.message
                            andType: @"error"];
        }
    ];
}

- (NSInteger)getNumberOfItems {
    return _list.count;
}

- (YoutubeItem*)getItemAtIndex:(NSInteger)index {
    return _list[index];
}

- (void) pushDetailAtIndex:(NSInteger)index {
    
    [SearchRouter pushDetailWithIdentifier: [_list objectAtIndex: index].identifier.videoId];
}


@end
