//
//  SearchResultViewCell.h
//  LC
//
//  Created by qianfeng on 15/10/6.
//  Copyright (c) 2015年 第一小组二分队. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJYShareModel.h"

@interface SearchResultViewCell : UICollectionViewCell

- (void)updateWithModel:(MJYShareModel *)model;

@end
