//
//  CategoryCollectionViewCell.m
//  MIAOLC
//
//  Created by qianfeng on 15/10/13.
//  Copyright (c) 2015年 苗军艳. All rights reserved.
//

#import "CategoryCollectionViewCell.h"

@implementation CategoryCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)updateWithModel:(MagazineModel *)model {
    [self.thumbImageView sd_setImageWithURL:[NSURL URLWithString:model.thumb]];
    self.nameLabel.text = model.cat_name;
    [self setNeedsLayout];
    
}

- (void)updateWithModel:(MagazineModel *)model Index:(NSInteger)index {
    if (index == 0) {
        self.smallImageView.image = [UIImage imageNamed:@"uncollected_spec@2x.png"];
    }
    if (index == 1) {
        self.smallImageView.image = [UIImage imageNamed:@"spec_all_icon@2x.png"]
        ;
    }
    self.thumbImageView.image = [UIImage imageNamed:model.thumb];
    self.nameLabel.text = model.cat_name;
    [self setNeedsLayout];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.isSelected) {
        self.layer.borderWidth = 5;
        self.layer.borderColor = [UIColor whiteColor].CGColor;
    }
}

@end
