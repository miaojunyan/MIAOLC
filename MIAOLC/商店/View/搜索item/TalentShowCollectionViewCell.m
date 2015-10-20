//
//  TalentShowCollectionViewCell.m
//  LC
//
//  Created by qianfeng on 15/10/4.
//  Copyright (c) 2015年 第一小组二分队. All rights reserved.
//

#import "TalentShowCollectionViewCell.h"
#import "UIImageView+WebCache.h"
@implementation TalentShowCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)updateDataWithModel:(TalentShowModel *)model {
    if (model.user_image != nil) {
    [self.picImageView sd_setImageWithURL:[NSURL URLWithString:model.user_image] placeholderImage:[UIImage imageNamed:@"icn_11"]];
        self.nameLabel.text = model.user_name;
        self.myLabel.text   =model.user_desc;
        self.nameLabel.textColor =[UIColor whiteColor];

    }
}
@end
