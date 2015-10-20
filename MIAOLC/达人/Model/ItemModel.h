//
//  ItemModel.h
//  MIAOLC
//
//  Created by qianfeng on 15/10/9.
//  Copyright (c) 2015年 苗军艳. All rights reserved.
//

#import "BaseModel.h"

@interface ItemModel : BaseModel

@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy)NSString *className;
@property (nonatomic,copy)NSString *normalImage;
@property (nonatomic,copy)NSString *selectedImage;

- (id)initWithDic:(NSDictionary *)dic;

+ (instancetype)itemModelWith:(NSDictionary *)dic;

+ (NSArray *)itemModelList;


@end
