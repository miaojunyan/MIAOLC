//
//  SearchResultViewCell.m
//  LC
//
//  Created by qianfeng on 15/10/6.
//  Copyright (c) 2015年 第一小组二分队. All rights reserved.
//

#import "SearchResultViewCell.h"

@interface SearchResultViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@end

@implementation SearchResultViewCell

- (void)awakeFromNib {
    
}
- (void)updateWithModel:(MJYShareModel *)model {
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:model.goods_image]];
}
@end
