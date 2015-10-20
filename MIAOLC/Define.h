//
//  Define.h
//  MIAOLC
//
//  Created by qianfeng on 15/10/9.
//  Copyright (c) 2015年 苗军艳. All rights reserved.
//

#ifndef MIAOLC_Define_h
#define MIAOLC_Define_h

// 宏定义
#define LCKScreenSize     [UIScreen mainScreen].bounds.size
#define LCKScreenWidth     LCKScreenSize.width
#define LCKScreenHeight    LCKScreenSize.height
#define LCTabBarHeight     49
#define LCBaseColor [UIColor colorWithRed:25/255.0 green:25/255.0 blue:27/255.0 alpha:1.0]
#define LCBaseMagazineColor [UIColor colorWithRed:203/255.0 green:207/255.0 blue:215/255.0 alpha:1];

// 适配比例
#define LCSalce (1/375)* LCKScreenWidth


//商店主界面
#define LCStoreUrl    @"http://iliangcang.com:8200/good/categories?app_key=iphone&build=2015092501"

//杂志主界面
#define LCMagazineUrl @"http://app.iliangcang.com/topic/listinfo?app_key=iphone&build=148&osVersion=84&v=2.2.5"

#define LCMagazineCategoryUrl @"http://app.iliangcang.com/topic/listcat?app_key=iphone&build=148&osVersion=84&v=2.2.5"


#define LCMagazineAuthorUrl @"http://app.iliangcang.com/topic/listauthor?app_key=iphone&build=148&osVersion=84&v=2.2.5"

// 分类界面的返回连接
#define LCMagazineCategoryGoBackUrl  @"http://app.iliangcang.com/topic/listinfo?app_key=iphone&build=148&cat_id=%@&osVersion=84&v=2.2.5"

// 作者页面的返回连接
#define LCMagazineAuthorGoBackUrl @"http://app.iliangcang.com/topic/listinfo?app_key=iphone&author_id=%@&build=148&osVersion=84&v=2.2.5"


//----------------------谢贺东--------------------
//达人主界面
#define LCTalentShow  @"http://app.iliangcang.com/expert?app_key=iphone&build=148&count=12&osVersion=84&page=1&v=2.2.5"
//达人界面里的推荐 需要主界面的user_id
#define LCTalentShowRefer_url @"http://app.iliangcang.com/user/recommendation?app_key=Android&build=2015092501&count=18&owner_id=%@&page=1&v=1.0"
//达人界面的关注 需要主界面的user_id
#define LCTalentShowFocus_Url @"http://app.iliangcang.com/user/following?app_key=Android&build=2015092501&count=18&owner_id=%@&page=1&v=1.0"
//达人界面的喜欢 需要主界面的user_id
#define LCTalentLike_Url @"http://app.iliangcang.com/user/like?app_key=Android&build=2015092501&count=18&owner_id=%@&page=1&v=1.0"
//达人界面的粉丝 需要主界面的user_id
#define LCTalentFans_Url @"http://app.iliangcang.com/user/followed?app_key=Android&build=2015092501&count=18&owner_id=%@&page=1&v=1.0"
//达人界面的 分类
/*
 界面类型
 */
#define kReferType      @"goods_sum"
#define kPopularType    @"followers"
#define kNewReferType   @"action_time"
#define kNewJoinType    @"reg_time"
//最多推荐
#define kCatagory_Url @"http://app.iliangcang.com/expert?orderby=%@&app_key=Android&build=2015092501&count=18&page=1&v=1.0"
//----------------------谢贺东--------------------


//-----------------------苗军艳----------------------
//分享主界面
#define LCShareUrl    @"http://app.iliangcang.com/goods/class?app_key=iphone&build=148&count=12&osVersion=84&page=%d&v=2.2.5"
//分享主界面价钱
#define LCSharePriceUrl @"http://app.iliangcang.com/goods/class?app_key=iphone&build=148&count=20&max=%@&min=%@&orderby=price&osVersion=84&page=%d&type=15&v=2.2.5"
#define LCSharePriceHeighUrl @"http://app.iliangcang.com/goods/class?app_key=iphone&build=148&count=20&min=3000&orderby=price&osVersion=84&page=%d&type=15&v=2.2.5"
#define ShareUrl @"http://app.iliangcang.com/goods/class?app_key=iphone&build=148&count=12&osVersion=84&page=%d&type=%@&v=2.2.5"

//分享的详细界面
//上
#define LCShareUpDetailUrl @"http://app.iliangcang.com/goods?app_key=Android&build=2015092501&goods_id=%@&v=1.0"
//下的评价
#define LCShareDownDetailUrl @"http://app.iliangcang.com/goods/commentsnew?app_key=Android&build=2015092501&count=3&goods_id=%@&page=1&v=1.0"


//-----------------------苗军艳----------------------


//-----------------------贵永冻----------------------
//商店
#define LCStoreHeadUrl @"http://iliangcang.com:8200/good/entrance?app_key=Android&build=2015092501"
#define LCStoreHeadDetailUrl @"http://app.iliangcang.com/goods/class?coverId=%@&app_key=Android&build=2015092501&count=20&page=%ld&self_host=1&v=1.0"
#define LCStoreDetailUrl @"http://app.iliangcang.com/goods/class?type=100&cat_code=%@&app_key=iphone&build=2015092501&count=20&page=%ld&self_host=1&v=1.0"
#define LCStoreOrderByPrice @"http://app.iliangcang.com/goods/class?type=100&cat_code=%@&orderby=price&min=%ld&max=%ld&app_key=iphone&build=2015092501&count=20&page=%ld&self_host=1&v=1.0"
#define LCStoreOrderByMaxPrice @"http://app.iliangcang.com/goods/class?type=100&cat_code=%@&orderby=price&min=%ld&app_key=iphone&build=2015092501&count=20&page=%ld&self_host=1&v=1.0"
#define LCStoreItemDetailUrl @"http://app.iliangcang.com/goods?app_key=Android&build=2015092501&goods_id=%@&v=1.0"
#define LCSearchGoodsUrl @"http://app.iliangcang.com/search?app_key=Android&build=2015092501&count=18&keywords=%@&page=%ld&v=1.0"
#define LCSearchUserUrl @"http://app.iliangcang.com/search/user?app_key=Android&build=2015092501&count=18&keywords=%@&page=%ld&v=1.0"
#define LCShopUrl @"http://iliangcang.com:8200/brand/list/2?start=%ld&offset=20&app_key=Android&build=2015092501"
#define LCStoreGoodUrl @"http://iliangcang.com:8200/brand/%ld?app_key=Android&build=2015092501"


//-----------------------贵永冻----------------------
#endif
