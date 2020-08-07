//
//  DetailPresenter.m
//  AppMadeObjc
//
//  Created by Fabio Lindemberg on 06/08/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

#import "DetailPresenter.h"
#import "DetailManager.h"
#import "ServiceError.h"

@implementation DetailPresenter

id<DetailPresenterDelegate> _detailDelegate;
NSString *_identifier;

- (instancetype)initWithDelegate:(id<DetailPresenterDelegate>)delegate
                   andIdentifier: (NSString *) identifier {
    self = [super init];
    
    if (self) {
        _detailDelegate = delegate;
        _identifier = identifier;
    }
    
    return self;
}

- (void) loadDetail {
    
    [DetailManager fetchDetailByIdentifier: _identifier
                                  onSucess:^(YoutubeItem * _Nonnull youtubeItem) {
        
        self.youtubeItem = youtubeItem;
        [_detailDelegate dataLoaded];
    } onError:^(ServiceError * _Nullable serviceError) {
        [_detailDelegate showMessage: serviceError.message andType: @"Error"];
    }];
}
@end
