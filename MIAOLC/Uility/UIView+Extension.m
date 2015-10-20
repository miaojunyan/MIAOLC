//
//  UIView+Extension.m
//  MIAOLC
//
//  Created by qianfeng on 15/10/12.
//  Copyright (c) 2015年 苗军艳. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

#pragma mark - width(set get 方法)
- (void)setWidth:(CGFloat)width {
    
    CGRect rect = self.frame;
    rect.size.width = width;
    self.frame = rect;
}

- (CGFloat)width {
    return self.frame.size.width;
}

#pragma mark -height
- (void)setHeight:(CGFloat)height {
    CGRect rect = self.frame;
    rect.size.height = height;
    self.frame = rect;
}
- (CGFloat)height {
    return self.frame.size.height;
}
#pragma mark - TopX
- (void)setTopX:(CGFloat)topX {
    CGRect rect = self.frame;
    rect.origin.x = topX;
    self.frame = rect;
}
- (CGFloat)topX {
    return self.frame.origin.x;
}
#pragma mark - TopY
- (void)setTopY:(CGFloat)topY  {
    CGRect rect = self.frame;
    rect.origin.y = topY;
    self.frame = rect;
    
}

- (CGFloat)topY {
    return self.frame.origin.y;
}

#pragma mark - bottom
- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}
- (CGFloat)maxX {
    return self.frame.origin.x + self.frame.size.width;
}
- (CGSize)size {
    return self.frame.size;
}
- (void)setSize:(CGSize)size {
    CGRect rect = self.frame;
    self.frame = rect;
}
@end
