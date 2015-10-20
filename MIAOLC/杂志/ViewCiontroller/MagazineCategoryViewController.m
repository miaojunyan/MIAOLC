//
//  MagazineCategoryViewController.m
//  MIAOLC
//
//  Created by qianfeng on 15/10/13.
//  Copyright (c) 2015年 苗军艳. All rights reserved.
//

#import "MagazineCategoryViewController.h"
#import "CategoryViewController.h"
#import "AutherViewController.h"
@interface MagazineCategoryViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UIBarPositioningDelegate,RequestViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIImageView *catageImageView;
@property (weak, nonatomic) IBOutlet UIImageView *zuthorImageView;
@property (weak, nonatomic) IBOutlet UIButton *catageButton;
@property (weak, nonatomic) IBOutlet UIButton *authorButton;
@property (weak, nonatomic) IBOutlet UIScrollView *buttonScrollerView;
@property (weak, nonatomic) IBOutlet UIButton *lowButton;
@property (weak, nonatomic) IBOutlet UIView *backView;


@property (nonatomic)UICollectionView *collectionView;


@end

@implementation MagazineCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creataHeardView];
    [self createCollectionView];
    [self categorybuttinClick];
}
- (void)creataHeardView {
    self.lowButton.backgroundColor = LCBaseColor;
    [self.lowButton setTitle:self.lowButtonTitle forState:UIControlStateNormal];
}
- (BOOL)prefersStatusBarHidden {
    return YES;
}
- (void)createCollectionView {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.itemSize = CGSizeMake(LCKScreenWidth, LCKScreenHeight - 70- 64);
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 70, LCKScreenWidth, LCKScreenHeight - 70-64) collectionViewLayout:flowLayout];
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.bounces = NO;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"MMMMMCellId"];
    [self.view addSubview:self.collectionView];
}
#pragma mark -
#pragma mark UICollectionViewDataSource 代理方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 2;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView     cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MMMMMCellId" forIndexPath:indexPath];
    if (indexPath.row == 0) {
        CategoryViewController *categoryVC = [[CategoryViewController alloc]init];
        categoryVC.delegate = self;
        categoryVC.indexPath = self.indexPath;
        [cell addSubview:categoryVC.view];
        [self addChildViewController:categoryVC];
        [categoryVC willMoveToParentViewController:self];
        return cell;
    }
    else {
        AutherViewController *autherVC = [[AutherViewController alloc]init];
        [cell addSubview:autherVC.view];
        [self addChildViewController:autherVC];
        autherVC.delegate = self;
        [autherVC willMoveToParentViewController:self];
        return cell;
    }
   
    return nil;
}
#pragma mark -
#pragma mark 视图切换效果
- (IBAction)buttonClick:(id)sender {
    UIButton *button = (UIButton *)sender;
    if (button.tag == 20) {
        [self.buttonScrollerView setContentOffset:CGPointMake(0, 0)animated:YES];
        [self categorybuttinClick];
    }
    if (button.tag == 30) {
        [self.buttonScrollerView setContentOffset:CGPointMake(-self.buttonScrollerView.width + 30, 0)animated:YES];
        [self authorbuttonClick];
        
    }
    if (button.tag == 40) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
//点击分类
- (void)categorybuttinClick {
    [self.collectionView setContentOffset:CGPointMake(0, 0)];
    [self.bgView bringSubviewToFront:self.catageImageView];
    [self.bgView insertSubview:self.zuthorImageView belowSubview:self.backView];
    self.catageButton.selected = YES;
    self.authorButton.selected = NO;
}
//点击作者时
- (void)authorbuttonClick {
    [self.collectionView setContentOffset:CGPointMake(LCKScreenWidth, 0)];
    [self.bgView bringSubviewToFront:self.zuthorImageView];
    [self.bgView insertSubview:self.catageImageView belowSubview:self.backView];
    self.catageButton.selected = NO;
    self.authorButton.selected = YES;
}
#pragma mark- 
#pragma mark UIScrollViewDelegate 
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.collectionView) {
        CGPoint collectionViewOffset = self.collectionView.contentOffset;
        CGFloat bottonSmallViewOffset = self.buttonScrollerView.width - 30;
        CGFloat scale = collectionViewOffset.x /LCKScreenWidth;
        [self.buttonScrollerView setContentOffset:CGPointMake(-scale * bottonSmallViewOffset, 0)animated:YES];
        
    }
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == self.collectionView) {
        if (scrollView.contentOffset.x/LCKScreenWidth == 0) {
              [self categorybuttinClick];
        }
        else {
            [self authorbuttonClick];
        }
    }
}
#pragma mark-
#pragma RequestViewControllerDelegate 
- (void)goBack:(NSString *)url title:(NSString *)title indexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(goBackMagezineCategoryView:title:indexPath:)]) {
        [self.delegate goBackMagezineCategoryView:url title:title indexPath:indexPath];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
- (void)goBack:(NSString *)url title:(NSString *)title {
    if ([self.delegate respondsToSelector:@selector(goBackMagezineCategoryView:title:)]) {
        [self.delegate goBackMagezineCategoryView:url title:title   ];
        [self dismissViewControllerAnimated:YES completion:nil];
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
