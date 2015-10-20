//
//  MJYShareModel.h
//  LC
//
//  Created by qianfeng on 15/10/4.
//  Copyright (c) 2015年 第一小组二分队. All rights reserved.
//

#import "BaseModel.h"

@interface MJYShareModel : BaseModel

@property (nonatomic,copy)NSString *goods_id;
@property (nonatomic,copy)NSString *goods_image;
@property (nonatomic,copy)NSString *goods_name;
@property (nonatomic,copy)NSString *price;
@property (nonatomic,copy)NSString *owner_id;
@property (nonatomic,copy)NSString *comment_count;
@property (nonatomic,copy)NSString *like_count;
@property (nonatomic,copy)NSString *liked;
@property (nonatomic,copy)NSString *sale_by;
@property (nonatomic,copy)NSString *goods_url;
@property (nonatomic,copy)NSString *is_gift;
@property (nonatomic,copy)NSString *discount_price;
@property (nonatomic,copy)NSString *coupon_flag;
@property (nonatomic,copy)NSString *promotion_imgurl;


@property (nonatomic,copy)NSString *goods_desc;
@property (nonatomic,copy)NSString *owner_name;
@property (nonatomic,copy)NSString *is_daren;
@property (nonatomic,copy)NSString *owner_desc;
@property (nonatomic,copy)NSString *owner_image;
@property (nonatomic,copy)NSString *rec_reason;
@property (nonatomic)NSArray *images_item;




@end
