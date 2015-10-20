//
//  StoreTableViewCell.m
//  MIAOLC
//
//  Created by qianfeng on 15/10/15.
//  Copyright (c) 2015年 苗军艳. All rights reserved.
//

#import "StoreTableViewCell.h"

@implementation StoreTableViewCell

- (void)awakeFromNib {
   
}
- (void)updateWith:(StoryItemModel *)model {
    self.nameLabel.text = model.name;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
