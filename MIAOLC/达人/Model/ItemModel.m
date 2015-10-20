//
//  ItemModel.m
//  MIAOLC
//
//  Created by qianfeng on 15/10/9.
//  Copyright (c) 2015年 苗军艳. All rights reserved.
//

#import "ItemModel.h"

@implementation ItemModel

- (id)initWithDic:(NSDictionary *)dic {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype)itemModelWith:(NSDictionary *)dic {
    return [[self alloc]initWithDic:dic];
    
}

+ (NSArray *)itemModelList {

    NSString *path = [[NSBundle mainBundle]pathForResource:@"LCItems" ofType:@"plist"];
    NSArray *items = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *newsList = [NSMutableArray array];
    for (NSDictionary *dic in items) {
        ItemModel *modle = [[ItemModel alloc]initWithDic:dic];
        [newsList addObject:modle];
    }
    return newsList;
}

@end
