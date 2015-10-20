//
//  NSDate+Extension.m
//  MIAOLC
//
//  Created by qianfeng on 15/10/15.
//  Copyright (c) 2015年 苗军艳. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)


//判断是否为今年
- (BOOL)isThisYear {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSInteger nowYear = [calendar component:NSCalendarUnitYear fromDate:[NSDate date]];
    NSInteger selfYear = [calendar component:NSCalendarUnitYear fromDate:self];
    return nowYear == selfYear;
}

//判断是否为今天
- (BOOL)isToday {
    //2015-07-28 18:30:00 -> 2015-07-28
    //日期格式化
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat = @"yyyy-MM-dd";
    //日期转换为字符串
    NSString *nowString = [fmt stringFromDate:[NSDate date]];
    NSString *selfString = [fmt stringFromDate:self];
    return [nowString isEqualToString:selfString];
}

//判断是否为昨天
- (BOOL)isYesterDay {
    //2015-07-28 18:30:00 -> 2015-07-28
    //日期格式化
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat = @"yyyy-MM-dd";
    //转换日期
    NSDate *nowDate = [fmt dateFromString:[fmt stringFromDate:[NSDate date]]];
    NSDate *selfDate = [fmt dateFromString:[fmt stringFromDate:self]];
    //日历 （比较时间）
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *cmps = [calendar components:NSCalendarUnitYear | NSCalendarUnitWeekOfMonth | NSCalendarUnitDay fromDate:selfDate toDate:nowDate options:0 ];
    return cmps.year == 0 &&cmps.month == 0 &&cmps.day == 1;
    
}

//比较两个日期之间的差值
- (NSDateComponents *)deltaFromDate:(NSDate *)fromDate {
    //日历
    NSCalendar *calender = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay |NSCalendarUnitHour | NSCalendarUnitMinute |NSCalendarUnitSecond;
    //返回日期的差值
    return [calender components:unit fromDate:fromDate toDate:self options:0];
}

@end
