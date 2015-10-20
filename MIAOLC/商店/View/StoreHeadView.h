//
//  StoreHeadView.h
//  MIAOLC
//
//  Created by qianfeng on 15/10/15.
//  Copyright (c) 2015年 苗军艳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StoryItemModel.h"

typedef void(^ClickBlockType)(NSInteger tag);

@interface StoreHeadView : UIView

@property NSUInteger section;
@property (nonatomic,weak)UITableView *tableView;

@property (nonatomic,copy)ClickBlockType block;

- (void)updateWithModel:(StoryItemModel *)model;

@end
