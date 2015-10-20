//
//  UIImage+image.h
//  MIAOLC
//
//  Created by qianfeng on 15/10/12.
//  Copyright (c) 2015年 苗军艳. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (image)

+ (UIImage *)imageWithOriginal:(NSString *)imageName;

+ (UIImage *)resizedImage:(NSString *)name;
@end
