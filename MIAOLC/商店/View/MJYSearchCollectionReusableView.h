//
//  MJYSearchCollectionReusableView.h
//  MIAOLC
//
//  Created by qianfeng on 15/10/15.
//  Copyright (c) 2015年 苗军艳. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MJYSearchCollectionReusableViewDelegate <NSObject>

- (void)searchReusableViewLeftBTClick:(NSString *)message;
- (void)searchReusableViewRightBTClck:(NSString *)message;

@end

@interface MJYSearchCollectionReusableView : UICollectionReusableView

@property (nonatomic,weak)id<MJYSearchCollectionReusableViewDelegate>delegate;

@end
