//
//  StoryItemModel.h
//  MIAOLC
//
//  Created by qianfeng on 15/10/15.
//  Copyright (c) 2015年 苗军艳. All rights reserved.
//

#import "JSONModel.h"

@interface StoryItemModel : JSONModel

@property (nonatomic,copy)NSString *code;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,strong)NSDictionary<Optional> *cover;
@property (nonatomic,strong)NSArray<Optional> *children;
@property (nonatomic,strong)NSNumber *parent_id;
@property (nonatomic,copy)NSString *english_name;
@property (nonatomic,strong)NSNumber *id;

@end
