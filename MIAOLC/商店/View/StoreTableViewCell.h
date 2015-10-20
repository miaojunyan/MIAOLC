//
//  StoreTableViewCell.h
//  MIAOLC
//
//  Created by qianfeng on 15/10/15.
//  Copyright (c) 2015年 苗军艳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StoryItemModel.h"
@interface StoreTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

- (void)updateWith:(StoryItemModel *)model;

@end
