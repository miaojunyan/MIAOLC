//
//  AutherTableViewCell.m
//  MIAOLC
//
//  Created by qianfeng on 15/10/13.
//  Copyright (c) 2015年 苗军艳. All rights reserved.
//

#import "AutherTableViewCell.h"

@implementation AutherTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)layoutSubviews {
    self.backgroundColor = LCBaseMagazineColor;
    self.hearImageView.layer.cornerRadius = 25;
    self.hearImageView.layer.masksToBounds = YES;
}
- (void)updateWith:(AuthorModel *)model {
  
    [self.hearImageView sd_setImageWithURL:[NSURL URLWithString:model.thumb]];
    self.nameLabel.text = model.author_name;
    self.descLabel.text = model.note;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
