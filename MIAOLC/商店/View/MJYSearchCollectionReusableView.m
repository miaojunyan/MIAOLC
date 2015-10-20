//
//  MJYSearchCollectionReusableView.m
//  MIAOLC
//
//  Created by qianfeng on 15/10/15.
//  Copyright (c) 2015年 苗军艳. All rights reserved.
//

#import "MJYSearchCollectionReusableView.h"
#import "MJYSearchBar.h"

@interface MJYSearchCollectionReusableView()<UITextFieldDelegate>
@property (nonatomic)MJYSearchBar *searchBar;

@end
@implementation MJYSearchCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self customUI];
    }
    return self;
}
- (void)customUI {
    [self createSearchView];
    [self createButton];
}
- (void)createSearchView {
    self.searchBar = [MJYSearchBar searchBar];
    self.searchBar.delegate = self;
    self.searchBar.placeholder = @"请输入关键词...";
    self.searchBar.font = [UIFont systemFontOfSize:15];
    self.searchBar.frame = CGRectMake(10, 10, LCKScreenWidth - 20, 35);
    [self addSubview:self.searchBar];
}
- (void)createButton {
    UIImage *image = [UIImage imageNamed:@"btn_msg_highlight"];
    UIButton *leftButton = [MJYFactory createButton:CGRectMake(10, 45, (LCKScreenWidth - 20) *0.5, 35) title:@"搜索良品" setImage:nil backgroundImage:image];
    [leftButton addTarget:self action:@selector(leftButtonClicl) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:leftButton];
    
    UIButton *rightButton = [MJYFactory createButton:CGRectMake((LCKScreenWidth - 20) *0.5 + 10, 45, (LCKScreenWidth - 20) *0.5, 35) title:@"搜索用户" setImage:nil backgroundImage:image];
    [rightButton addTarget:self action:@selector(rightButtonClicl) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:rightButton];
}
- (void)leftButtonClicl {
    if (self.searchBar.text.length == 0) {
        return;
    }
    if (self.delegate) {
        [self.delegate searchReusableViewLeftBTClick:self.searchBar.text];
    }

}
- (void)rightButtonClicl {
    if (self.searchBar.text.length == 0) {
        return;
    }
    if (self.delegate) {
        [self.delegate searchReusableViewRightBTClck:self.searchBar.text];
    }
    
}
@end
