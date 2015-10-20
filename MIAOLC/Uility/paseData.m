//
//  paseData.m
//  MIAOLC
//
//  Created by qianfeng on 15/10/10.
//  Copyright (c) 2015年 苗军艳. All rights reserved.
//

#import "paseData.h"
#import "MagazineModel.h"
#import "AuthorModel.h"
#import "StoryItemModel.h"
#import "MJYShareModel.h"
#import "TalentShowModel.h"
@implementation paseData

+ (NSMutableArray *)paseMagezineDataKey:(id)data;{
    
    NSDictionary *dic = data[@"data"];
    NSMutableArray *dataKey = dic[@"keys"];
    return dataKey;
    
}
+ (NSDictionary *)paseMagezineDataSource:(id)data {
    
    NSDictionary *dic = data[@"data"];
    NSMutableArray *dataKey = dic[@"keys"];
    NSDictionary *infosDic = [dic objectForKey:@"infos"];
    
    NSMutableDictionary *dataSource = [NSMutableDictionary dictionary];
        for (NSString *dataStr in dataKey) {
            NSMutableArray *modelArr = [NSMutableArray array];
            NSArray *arr = infosDic[dataStr];
     
            for (NSDictionary *detailDic in arr) {
                MagazineModel *model = [[MagazineModel alloc]init];
                [model setValuesForKeysWithDictionary:detailDic];
                [modelArr addObject:model];
            }
            
            [dataSource setValue:modelArr forKey:dataStr];
 
    }
    
    return dataSource;
}

+ (NSMutableArray *)paseMagezineAutherDataSource:(id)data {
    NSArray *dataArr = data[@"data"];
    NSMutableArray *dataSouce = [NSMutableArray array];
    for (NSDictionary *dic in dataArr) {
        AuthorModel *model = [[AuthorModel alloc]init];
        [model setValuesForKeysWithDictionary:dic];
        [dataSouce addObject:model];
    }
    return dataSouce;
}
+ (NSMutableArray *)paseMagezineCategaryDataSource:(id)data {
    NSArray *dataArr = data[@"data"];
    NSMutableArray *dataSource = [NSMutableArray array];
    for (NSDictionary *dic in dataArr) {
        MagazineModel *model = [[MagazineModel alloc]init];
        [model setValuesForKeysWithDictionary:dic];
        [dataSource addObject:model];
    }
    return dataSource;
}
+ (NSMutableArray *)paseStoryData:(id)data {
    NSDictionary *rootDic = data[@"data"];
    NSArray *itemArr = rootDic[@"items"];
    NSMutableArray *dataSource = [NSMutableArray array];
    for (NSDictionary *dic in itemArr) {
        NSMutableArray *dataSource2 = [NSMutableArray array];
        StoryItemModel *model = [[StoryItemModel alloc]initWithDictionary:dic error:nil];
        for (NSDictionary *dic2 in model.children) {
            StoryItemModel *model2= [[StoryItemModel alloc]initWithDictionary:dic2 error:nil];
            [dataSource2 addObject:model2];
        }
        model.children = dataSource2;
        [dataSource addObject:model];
    }
   return dataSource;
}
+ (NSArray *)paseSearchGoodData:(id)data {
    NSArray *arr = [(NSDictionary *)data objectForKey:@"data"];
    if (arr == nil) {
        return nil;
    }
    NSMutableArray *tmpArr = [NSMutableArray array];
    for (NSDictionary *dic in arr) {
        MJYShareModel *model = [[MJYShareModel alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [tmpArr addObject:model];
    }
    return tmpArr;
}
+ (NSMutableArray *)paseTalentData:(id)data {
    NSMutableArray *array =[NSMutableArray array];
    NSArray * dataArray = data[@"data"];
    for (NSDictionary *dic in dataArray) {
        TalentShowModel *model =[[TalentShowModel alloc]init];
        [model setValuesForKeysWithDictionary:dic];
        [array addObject:model];
    }
    return array;
}
@end
