//
//  YoutubeItemCell.m
//  AppMadeObjc
//
//  Created by Fabio Lindemberg on 06/08/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

#import "YoutubeItemCell.h"
#import <SDWebImage/SDWebImage.h>

@implementation YoutubeItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) loadCell: (YoutubeItem*) youtubeItem{
    NSURL *url = [[NSURL alloc] initWithString: youtubeItem.snippet.thumbnails.medium.url];
    [self.imgItemImage sd_setImageWithURL: url];
    self.lblItemTitle.text = youtubeItem.snippet.title;
    self.lblItemDescription.text = youtubeItem.snippet.desc;
}


@end
