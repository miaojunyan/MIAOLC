//
//  MJYFactory.m
//  MIAOLC
//
//  Created by qianfeng on 15/10/13.
//  Copyright (c) 2015年 苗军艳. All rights reserved.
//

#import "MJYFactory.h"

@implementation MJYFactory

+ (UIButton *)createButton:(CGRect)frame title:(NSString *)title setImage:(UIImage *)image backgroundImage:(UIImage *)backgroundImage {

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
     button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
   
    [button setImage:image forState:UIControlStateNormal];
    [button setBackgroundImage:backgroundImage forState:UIControlStateNormal];
    return button;
}

+ (UILabel *)createLabel:(CGRect)frame title:(NSString *)title color:(UIColor *)color font:(UIFont *)font textAlignment:(NSTextAlignment)alignment {
    
    UILabel *label = [[UILabel alloc]initWithFrame:frame
                      ];
    label.text = title;
    UIFont *labelFont = (font == nil ? [UIFont systemFontOfSize:17] : font);
    label.font = labelFont;
    label.textAlignment = alignment;
    return label;
    
}

@end
