//
//  MagazineDetailViewController.m
//  MIAOLC
//
//  Created by qianfeng on 15/10/12.
//  Copyright (c) 2015年 苗军艳. All rights reserved.
//

#import "MagazineDetailViewController.h"
#import <WebKit/WebKit.h>

@interface MagazineDetailViewController ()<WKNavigationDelegate>

@property (nonatomic)WKWebView *webView;
@property (nonatomic)UIProgressView *progressView;

@end

@implementation MagazineDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createNavigationRightItem];
    [self createNavigationLeftItem];
    [self createWebView];
    [self createProgressView];
    
}
- (void)createNavigationRightItem {
    //收藏
    UIButton *button = [MJYFactory createButton:CGRectMake(0, 0, 40, 40) title:nil setImage:[UIImage imageNamed:@"uncollected_spec@2x.png"] backgroundImage:nil];
    button.tag = 25;
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:button];
    [button addTarget:self action:@selector(buttonisClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = item;
   
}
- (void)createNavigationLeftItem {
    //返回
    UIImage *image = [UIImage imageNamed:@"loginBack.png"];
   
   
    UIButton *button = [MJYFactory createButton:CGRectMake(0, 0, 40, 40) title:nil setImage:image backgroundImage:nil];
    button.tag = 17;
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:button];
    [button addTarget:self action:@selector(buttonisClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = item;
}
- (void)createWebView {
    self.webView = [[WKWebView alloc]initWithFrame:self.view.bounds];
    self.webView.backgroundColor = LCBaseColor;
    self.title = self.model.topic_name;
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:self.model.topic_url]];
    [self.webView loadRequest:request];
    [self.view addSubview:self.webView];
    
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    
}
- (void)createProgressView {
    self.progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(0, 0, LCKScreenWidth, 10)];
    self.progressView.progress = 0;
    [self.view addSubview:self.progressView];
}
- (void)buttonisClick:(UIButton *)button {
    if (button.tag == 17) {
        [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
        [self.navigationController popViewControllerAnimated:YES];
    }
    if (button.tag == 25) {
        [[MJYDBManager sharedInstance]addManagerModelInfo:self.model];
        NSLog(@"%@",NSHomeDirectory());
        button.enabled = NO;
    }
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    self.progressView.progress = self.webView.estimatedProgress;
    if (self.progressView.progress == 1.0) {
        self.progressView.hidden = YES;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
