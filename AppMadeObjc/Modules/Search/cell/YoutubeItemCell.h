//
//  YoutubeItemCell.h
//  AppMadeObjc
//
//  Created by Fabio Lindemberg on 06/08/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YoutubeItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface YoutubeItemCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imgItemImage;
@property (weak, nonatomic) IBOutlet UILabel *lblItemTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblItemDescription;

- (void) loadCell: (YoutubeItem*) youtubeItem;
@end

NS_ASSUME_NONNULL_END
