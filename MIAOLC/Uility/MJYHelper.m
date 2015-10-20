//
//  MJYHelper.m
//  MIAOLC
//
//  Created by qianfeng on 15/10/12.
//  Copyright (c) 2015年 苗军艳. All rights reserved.
//

#import "MJYHelper.h"

@implementation MJYHelper

+ (CGFloat)widthWithBody:(NSString *)body {
    //计算字符串占用的大小
    CGRect rect = [body boundingRectWithSize:CGSizeMake(MAXFLOAT, 20) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
    return rect.size.width;
}

@end
