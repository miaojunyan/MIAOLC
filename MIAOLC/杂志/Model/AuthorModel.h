//
//  AuthorModel.h
//  MIAOLC
//
//  Created by qianfeng on 15/10/13.
//  Copyright (c) 2015年 苗军艳. All rights reserved.
//

#import "BaseModel.h"

@interface AuthorModel : BaseModel

@property (nonatomic,copy)NSString *author_id;
@property (nonatomic,copy)NSString *author_name;
@property (nonatomic,copy)NSString *thumb;
@property (nonatomic,copy)NSString *note;


@end
