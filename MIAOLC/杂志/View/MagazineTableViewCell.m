//
//  MagazineTableViewCell.m
//  MIAOLC
//
//  Created by qianfeng on 15/10/11.
//  Copyright (c) 2015年 苗军艳. All rights reserved.
//

#import "MagazineTableViewCell.h"

@interface MagazineTableViewCell()


@end

@implementation MagazineTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)updateWith:(MagazineModel *)model {
    [self.BigImageView sd_setImageWithURL:[NSURL URLWithString:model.cover_img_new]placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    self.titleLabel.text = model.topic_name;
    self.catNameLabel.text =[NSString stringWithFormat:@"#%@",model.cat_name];
    [self setNeedsLayout];
    
}
- (void)updateWithCollection:(MagazineModel *)model {
    
    [self.BigImageView sd_setImageWithURL:[NSURL URLWithString:model.cover_img_new]placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    self.titleLabel.text = model.topic_name;
    self.catNameLabel.text =[NSString stringWithFormat:@"#%@",model.cat_name];
    self.timeLabel.text = [NSString stringWithFormat:@"收藏：%@",[self getCollectionTime:model.addtime]];
    //[self setNeedsLayout];

   
}
- (NSString *)getCollectionTime:(NSString *)time {
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    //创建时间
    NSDate *createDate = [fmt dateFromString:time];
    
    if (createDate.isThisYear) {
        if (createDate.isToday) {
            NSDateComponents *cmps = [[NSDate date]deltaFromDate:createDate];
            if (cmps.hour >= 1) { //时间差》1小时
                return [NSString stringWithFormat:@"%zd小时前",cmps.hour];
            }
            else if (cmps.minute >= 1){ // 1个小时 > 时间差 > 1分钟
                return [NSString stringWithFormat:@"%zd分钟前",cmps.minute];
            
            }else {// 1分钟 > 时间差
                return @"刚刚";
            }
    }
        else if (createDate.isYesterDay){
            fmt.dateFormat = @"昨天 HH:mm:ss";
            return [fmt stringFromDate:createDate];
        }
        else {
            fmt.dateFormat = @"MM-dd HH:mm:ss";
            return [fmt stringFromDate:createDate];
        }
    
}
    else { //非今年
        return time;
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
