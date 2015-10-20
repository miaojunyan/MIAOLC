//
//  MJYFactory.h
//  MIAOLC
//
//  Created by qianfeng on 15/10/13.
//  Copyright (c) 2015年 苗军艳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MJYFactory : NSObject

+ (UIButton *)createButton:(CGRect)frame title:(NSString *)title setImage:(UIImage *)image backgroundImage:(UIImage *)backgroundImage;

+ (UILabel *)createLabel:(CGRect)frame title:(NSString *)title color:(UIColor *)color font:(UIFont *)font textAlignment:(NSTextAlignment)alignment;

@end
