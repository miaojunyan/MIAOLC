//
//  NSDate+Extension.h
//  MIAOLC
//
//  Created by qianfeng on 15/10/15.
//  Copyright (c) 2015年 苗军艳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)

//判断是否为今年
- (BOOL)isThisYear;

//判断是否为今天
- (BOOL)isToday;

//判断是否为昨天
- (BOOL)isYesterDay;

//比较两个日期之间的差值
- (NSDateComponents *)deltaFromDate:(NSDate *)fromDate;


@end
