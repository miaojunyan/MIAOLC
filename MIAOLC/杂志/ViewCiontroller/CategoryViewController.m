//
//  CategoryViewController.m
//  MIAOLC
//
//  Created by qianfeng on 15/10/13.
//  Copyright (c) 2015年 苗军艳. All rights reserved.
//

#import "CategoryViewController.h"
#import "MagazineModel.h"
#import "CategoryCollectionViewCell.h"
#import "MagazineViewController.h"
@interface CategoryViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic)UICollectionView *collectionView;

@end

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addDataSource];
    [self fetchData];
    [self createUI];
}
- (void)addDataSource {
    MagazineModel *modle = [[MagazineModel alloc]init];
    modle.cat_name = @"我的收藏";
    modle.thumb = @"spec_favour_bg.png";
    [self.dataSource addObject:modle];
    MagazineModel *modle1 = [[MagazineModel alloc]init];
    modle1.cat_name = @"所有杂志";
    modle1.thumb = @"spec_all_bg.png";
    [self.dataSource addObject:modle1];
    
}
- (void)createUI {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake((LCKScreenWidth - 45)/2, (LCKScreenWidth - 45)/2 *85/133);
    flowLayout.sectionInset = UIEdgeInsetsMake(25, 15, 5, 15);
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, LCKScreenWidth, LCKScreenHeight - 70 - 64) collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = LCBaseMagazineColor;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    UINib *nib = [UINib nibWithNibName:@"CategoryCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:@"CategoryCellId"];
    [self.view addSubview:self.collectionView];
}
- (void)parsingResponsData:(id)responsData {
    
    [self.dataSource addObjectsFromArray:[paseData paseMagezineCategaryDataSource:responsData]];
    [self.collectionView reloadData];
}
- (NSString *)cumposeRequsetUrl {
    return LCMagazineCategoryUrl;
}

#pragma mark -
#pragma mark UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CategoryCollectionViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"CategoryCellId" forIndexPath:indexPath];
    MagazineModel *modle = self.dataSource[indexPath.row];
    if (indexPath == self.indexPath) {
        cell.selected = YES;
    }else {
        cell.selected = NO;
    }
    if (indexPath.row < 2) {
        [cell updateWithModel:modle Index:indexPath.row];
    }else {
        [cell updateWithModel:modle];
    }
    return cell; 
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    MagazineModel *model = self.dataSource[indexPath.row];
    if (indexPath.row == 1) {
        if ([self.delegate respondsToSelector:@selector(goBack:title:indexPath:)]) {
            [self.delegate goBack:LCMagazineUrl title:nil indexPath:indexPath];
        }
    }
    else {
        if ([self.delegate respondsToSelector:@selector(goBack:title:indexPath:)]) {
            [self.delegate goBack:[NSString stringWithFormat:LCMagazineCategoryGoBackUrl,model.cat_id] title:model.cat_name indexPath:indexPath];
        }
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
