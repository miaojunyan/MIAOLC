//
//  RequestViewController.h
//  MIAOLC
//
//  Created by qianfeng on 15/10/13.
//  Copyright (c) 2015年 苗军艳. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RequestViewControllerDelegate <NSObject>

- (void)goBack:(NSString *)url title:(NSString *)title indexPath:(NSIndexPath *)indexPath;

- (void)goBack:(NSString *)url title:(NSString *)title;

@end

@interface RequestViewController : UIViewController

@property (nonatomic,weak)id <RequestViewControllerDelegate> delegate;

@property (nonatomic)NSMutableArray *dataSource;

- (void)createUI;

- (void)fetchData;

//解析数据
- (void)parsingResponsData:(id)responsData;

//请求路径
- (NSString *)cumposeRequsetUrl;

@end
