//
//  AutherTableViewCell.h
//  MIAOLC
//
//  Created by qianfeng on 15/10/13.
//  Copyright (c) 2015年 苗军艳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AuthorModel.h"
@interface AutherTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *hearImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

- (void)updateWith:(AuthorModel *)model;

@end
