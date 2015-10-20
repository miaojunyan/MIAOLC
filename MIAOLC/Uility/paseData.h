//
//  paseData.h
//  MIAOLC
//
//  Created by qianfeng on 15/10/10.
//  Copyright (c) 2015年 苗军艳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface paseData : NSObject


+ (NSMutableArray *)paseMagezineDataKey:(id)data;
+ (NSDictionary *)paseMagezineDataSource:(id)data;
+ (NSMutableArray *)paseMagezineAutherDataSource:(id)data;
+ (NSMutableArray *)paseMagezineCategaryDataSource:(id)data;

+ (NSMutableArray *)paseStoryData:(id)data;

+ (NSArray *)paseSearchGoodData:(id)data;

+ (NSMutableArray *)paseTalentData:(id)data;

@end
