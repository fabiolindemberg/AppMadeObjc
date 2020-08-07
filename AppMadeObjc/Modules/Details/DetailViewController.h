//
//  DetailViewController.h
//  AppMadeObjc
//
//  Created by Fabio Lindemberg on 06/08/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailPresenter.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController <DetailPresenterDelegate>

@property (nonatomic) DetailPresenter *presenter;

@property (weak, nonatomic) IBOutlet UIImageView *imgVideo;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblDescription;
@end

NS_ASSUME_NONNULL_END
