//
//  CustomViewController.m
//  MIAOLC
//
//  Created by qianfeng on 15/10/9.
//  Copyright (c) 2015年 苗军艳. All rights reserved.
//

#import "CustomViewController.h"
#import "ItemModel.h"
#import "UIViewController+TabBatItem.h"
#import "NavigationViewController.h"

@interface CustomViewController ()

@property (nonatomic) NSArray *item;
@property (nonatomic) UIButton *lastButton;

@end

@implementation CustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//懒加载
- (NSArray *)item {
    if (!_item) {
        _item = [ItemModel itemModelList];
    }
    return _item;
}
- (void)createContentViewController {
    
    for (ItemModel *model in self.item) {
       // UIViewController *VC = [NSClassFromString(model.className)viewControllerWithNormalImage:model.normalImage selectImageName:model.selectedImage];
        UIViewController *VC = [[NSClassFromString(model.className)alloc]init];
        VC.title = model.title;
        NavigationViewController *nvc = [[NavigationViewController alloc]initWithRootViewController:VC];

        [self addChildViewController:nvc];
        
    }
}
- (void)customTabBar {
    [self.tabBar setHidden:YES];
    UIImageView *backgroundView = [[UIImageView alloc]initWithFrame:CGRectMake(0,LCKScreenHeight - LCTabBarHeight , LCKScreenWidth, LCTabBarHeight)];
    backgroundView.tag = 10000;
    backgroundView.backgroundColor = LCBaseColor;
    backgroundView.userInteractionEnabled = YES;
    [self.view addSubview:backgroundView];
    
    CGFloat buttonWidth = LCKScreenWidth/4;
    CGFloat buttonHeight = LCTabBarHeight;
    for (int index = 0; index < self.item.count; index ++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        ItemModel *model = self.item[index];
        NSString *nonrmalImageName = model.normalImage;
        NSString *selectImageName = model.selectedImage;
        [button setImage:[UIImage imageNamed:nonrmalImageName] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:selectImageName] forState:UIControlStateSelected];
        button.frame = CGRectMake(index * buttonWidth, 0, buttonWidth, buttonHeight);
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 100 + index;
        if (index == 0) {
            button.selected = YES;
            self.lastButton = button;
        }
        [backgroundView addSubview:button];
    }
    
}
- (void)buttonClick:(UIButton *)button {
    self.lastButton.selected = NO;
    button.selected = YES;
    NSInteger index = button.tag - 100;
    self.selectedIndex = index;
    self.lastButton = button;
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
