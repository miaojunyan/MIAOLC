//
//  MJYDBManager.h
//  MIAOLC
//
//  Created by qianfeng on 15/10/14.
//  Copyright (c) 2015年 苗军艳. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MagazineModel.h"
@interface MJYDBManager : NSObject

+ (instancetype)sharedInstance;

//添加
- (void)addManagerModelInfo:(MagazineModel *)model;

//删除
- (void)delegateManagerModelInfo:(MagazineModel *)model;

//读取数据库所有的信息
- (NSArray *)readManagerModelInfoList;

//判断该模型是否存在
- (BOOL)isManagerExists:(MagazineModel *)model;

@end
