//
//  MagazineCategoryViewController.h
//  MIAOLC
//
//  Created by qianfeng on 15/10/13.
//  Copyright (c) 2015年 苗军艳. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MagazineCategoryViewControllerDelegate <NSObject>

- (void)goBackMagezineCategoryView:(NSString *)url title:(NSString *)title indexPath:(NSIndexPath *)indexPath;

- (void)goBackMagezineCategoryView:(NSString *)url title:(NSString *)title;


@end

@interface MagazineCategoryViewController : UIViewController

@property (nonatomic)NSString *lowButtonTitle;
@property (nonatomic)NSIndexPath *indexPath;
@property (nonatomic,weak)id <MagazineCategoryViewControllerDelegate>delegate;

@end
