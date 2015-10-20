//
//  MyWaterLayout.h
//  堆糖
//
//  Created by qianfeng on 15/9/22.
//  Copyright (c) 2015年 贵永冬. All rights reserved.
//

#import <UIKit/UIKit.h>



#define MyWaterLayoutKindSectionHeader @"MyWaterLayoutKindSectionHeader"
#define MyWaterLayoutKindSectionFooter @"MyWaterLayoutKindSectionFooter"


@class MyWaterLayout;
@protocol  MyWaterLayoutDelegate<NSObject>

/**
 *  代理方法计算每一个item的高度
 */
- (CGFloat)waterfallLayout:(MyWaterLayout*)layout heightAtIndexPath:(NSIndexPath*)indexPath;
/**
 *  代理方法计算每一个item的宽度
 */
- (CGFloat)widthAtSection:(NSInteger)section;
/**
 *  代理方法计算有几个区
 */
- (NSInteger)sectionNumber;
/**
 *  代理方法计算每个区有几个
 */
- (NSInteger)numberAtSection:(NSInteger)section;
/**
 *  代理方法计算指定每个区有多少列
 */
- (NSInteger)columNumberAtSection:(NSInteger)section;
/**
 *  代理方法计算指定每个区item之间的间隙
 */
- (CGFloat)interSpaceingAtSection:(NSInteger)section;
/**
 *  代理方法计算指定每个区指定每一个段的内边距
 */
- (UIEdgeInsets)sectionInsetAtSection:(NSInteger)section;



@optional
/**
 *  每个区的区头的大小
 *
 */
- (CGSize)headderSizeForSection:(NSInteger)section;

/**
 *  每个区的区尾的大小
 *
 */
- (CGSize)footerSizeForSection:(NSInteger)section;

@end


@interface MyWaterLayout : UICollectionViewLayout

@property(nonatomic)id<MyWaterLayoutDelegate> delegate;



@end
