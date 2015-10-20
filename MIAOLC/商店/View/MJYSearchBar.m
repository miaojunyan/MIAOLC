//
//  MJYSearchBar.m
//  MIAOLC
//
//  Created by qianfeng on 15/10/15.
//  Copyright (c) 2015年 苗军艳. All rights reserved.
//

#import "MJYSearchBar.h"

@implementation MJYSearchBar

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // 设置背景
        self.background = [UIImage resizedImage:@"searchbar_textfield_background"];
        // 设置内容 -- 垂直居中
        self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        // 设置左边显示一个放大镜
        UIImageView *leftView = [[UIImageView alloc]init];
        leftView.image = [UIImage imageWithOriginal:@"searchbar_textfield_search_icon"];
        leftView.width = leftView.image.size.width;
        leftView.height = leftView.image.size.height;
        // 设置leftView的内容居中
        leftView.contentMode = UIViewContentModeCenter;
        self.leftView = leftView;
        // 设置左边的view永远显示
        self.leftViewMode = UITextFieldViewModeAlways;
          // 设置右边永远显示清除按钮
        self.clearButtonMode = UITextFieldViewModeAlways;
    }
    return self;
}
+ (instancetype)searchBar {
    return [[self alloc]init];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
