//
//  UIView+Extension.h
//  MIAOLC
//
//  Created by qianfeng on 15/10/12.
//  Copyright (c) 2015年 苗军艳. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

@property (nonatomic,assign) CGFloat topX;

@property (nonatomic,assign) CGFloat topY;

@property (nonatomic,assign) CGFloat width;

@property (nonatomic,assign) CGFloat height;

@property (nonatomic,assign,readonly) CGFloat bottom;

@property (nonatomic,assign,readonly) CGFloat maxX;

@property (nonatomic,assign) CGSize size;

@end
