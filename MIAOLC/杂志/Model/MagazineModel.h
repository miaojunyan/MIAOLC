//
//  MagazineModel.h
//  MIAOLC
//
//  Created by qianfeng on 15/10/10.
//  Copyright (c) 2015年 苗军艳. All rights reserved.
//

#import "BaseModel.h"

@interface MagazineModel : BaseModel

@property (nonatomic,copy)NSString *taid;
@property (nonatomic,copy)NSString *topic_name;
@property (nonatomic,copy)NSString *cat_id;
@property (nonatomic,copy)NSString *author_id;
@property (nonatomic,copy)NSString *topic_url;
@property (nonatomic,copy)NSString *access_url;
@property (nonatomic,copy)NSString *cover_img;
@property (nonatomic,copy)NSString *cover_img_new;
@property (nonatomic,copy)NSString *hit_number;
@property (nonatomic,copy)NSString *addtime;
@property (nonatomic,copy)NSString *nav_title;
@property (nonatomic,copy)NSString *author_name;
@property (nonatomic,copy)NSString *cat_name;

@property (nonatomic,copy)NSString *thumb;

@end
