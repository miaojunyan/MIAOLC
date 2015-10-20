//
//  UIViewController+TabBatItem.m
//  MIAOLC
//
//  Created by qianfeng on 15/10/9.
//  Copyright (c) 2015年 苗军艳. All rights reserved.
//

#import "UIViewController+TabBatItem.h"

@implementation UIViewController (TabBatItem)

+ (instancetype)viewControllerWithNormalImage:(NSString *)normalImageName selectImageName:(NSString *)selectImageName {
    //在类的方法中通过[self class]得到调用该法的类型
    UIViewController *viewController = [[[self class]alloc]init];
    UITabBarItem *tabBarItem = [[UITabBarItem alloc]initWithTitle:nil image:[UIImage imageNamed:normalImageName] selectedImage:[UIImage imageNamed:selectImageName]];
    //tabBarItem setTitleTextAttributes:@{NSfor} forState:<#(UIControlState)#>
    viewController.tabBarItem = tabBarItem;
    return viewController;
}

@end
