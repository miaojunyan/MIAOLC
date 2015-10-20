//
//  MagazineTableViewCell.h
//  MIAOLC
//
//  Created by qianfeng on 15/10/11.
//  Copyright (c) 2015年 苗军艳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MagazineModel.h"


@interface MagazineTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *BigImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *catNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

- (void)updateWith:(MagazineModel *)model;

- (void)updateWithCollection:(MagazineModel *)model;

@end
