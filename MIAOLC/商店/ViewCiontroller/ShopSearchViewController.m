//
//  ShopSearchViewController.m
//  MIAOLC
//
//  Created by qianfeng on 15/10/15.
//  Copyright (c) 2015年 苗军艳. All rights reserved.
//

#import "ShopSearchViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "MJYSearchCollectionReusableView.h"
#import "MyWaterLayout.h"
#import "WSProgressHUD.h"
#import "SearchResultViewCell.h"
#import "TalentShowCollectionViewCell.h"
@interface ShopSearchViewController ()<MJYSearchCollectionReusableViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,MyWaterLayoutDelegate>

{
    BOOL _isRightButtonClick;
}


@property (nonatomic)MJYSearchCollectionReusableView *searchResableBar;

@property (nonatomic)UICollectionView *collectionView;
@property (nonatomic)NSArray *dataSource;
@property (nonatomic)NSInteger page;
@property (nonatomic)NSString *url;

@end

@implementation ShopSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = LCBaseColor;
    self.page = 1;
    [self customNavidationBar];
    [self addSearchUI];
    [self setUpCollectionView];
}
- (void)customNavidationBar {
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_back" hightImageName:nil target:self action:@selector(back)];
    
    self.title = @"搜索";
}
- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)addSearchUI {
    self.searchResableBar = [[MJYSearchCollectionReusableView alloc] initWithFrame:CGRectMake(0, 0, LCKScreenWidth, 80)];
    self.searchResableBar.delegate = self;
     [self.view addSubview:self.searchResableBar];
}
- (void)loadData {
    if (self.url == nil) {
        return;
    }
    [[Netigene sharedInstance]requestMagezineFrom:self.url success:^(id responsData) {
        if (!_isRightButtonClick) {
            self.dataSource = [paseData paseSearchGoodData:responsData];
        }else {
            self.dataSource = [paseData paseTalentData:responsData];
        }
        if (self.dataSource.count == 0) {
            [self showMessage:@"没有搜索到结果"];
        }
        [self hiddenMessege];
        [self.collectionView reloadData];
    } failed:^(NSError *error) {
        
    }];
}
- (void)showMessage:(NSString *)str {
    [WSProgressHUD showShimmeringString:str maskType:WSProgressHUDMaskTypeBlack maskWithout:WSProgressHUDMaskWithoutNavigation];
}
- (void)hiddenMessege {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [WSProgressHUD dismiss];
    });
}
- (void)setUpCollectionView {
    MyWaterLayout *layout = [[MyWaterLayout alloc] init];
    layout.delegate = self;
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 80, LCKScreenWidth, LCKScreenHeight - 64-80) collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self registViewForCollection];
    [self.view addSubview:self.collectionView];
}
- (void)registViewForCollection {
    [self.collectionView registerNib:[UINib nibWithNibName:@"SearchResultViewCell" bundle:nil] forCellWithReuseIdentifier:@"SearchResultViewCellId"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"TalentShowCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"myCellId"];
}
#pragma  mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (!_isRightButtonClick) {
        SearchResultViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SearchResultViewCellId" forIndexPath:indexPath];
        [cell updateWithModel:self.dataSource[indexPath.item]];
        return cell;
    }else {
        TalentShowCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"myCellId" forIndexPath:indexPath];
        [cell updateDataWithModel:self.dataSource[indexPath.item]];
        return cell;
    }
}
#pragma  mark - MyWaterLayoutDelegate
//代理方法计算每一个item的高度
- (CGFloat)waterfallLayout:(MyWaterLayout*)layout heightAtIndexPath:(NSIndexPath*)indexPath {
    if (!_isRightButtonClick) {
        return (LCKScreenWidth-30)/2;
    }
    return 150;
}
- (CGFloat)widthAtSection:(NSInteger)section {
    if (!_isRightButtonClick) {
        return (LCKScreenWidth-30)/2;
    }
    return (LCKScreenWidth-30)/3;
}
//有几个区
- (NSInteger)sectionNumber {
    return 1;
}
//每个区有几个
- (NSInteger)numberAtSection:(NSInteger)section {
    return self.dataSource.count;
}
//指定有多少列
- (NSInteger)columNumberAtSection:(NSInteger)section {
    if (!_isRightButtonClick) {
        return 2;
    }
    return 3;
}
//指定item之间的间隙
- (CGFloat)interSpaceingAtSection:(NSInteger)section {
    return 10;
}
//指定每一个段的内边距
- (UIEdgeInsets)sectionInsetAtSection:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
//每个区的区头的大小
- (CGSize)headderSizeForSection:(NSInteger)section {
    return  CGSizeZero;
}

#pragma  mark - GYDSearchReusableViewDelegate
- (void)searchReusableViewLeftBTClick:(NSString *)message {
    [self showMessage:@"加载中..."];
    _isRightButtonClick = NO;
    NSString *str = [message stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    self.url = [NSString stringWithFormat:LCSearchGoodsUrl,str,self.page];
    [self.view endEditing:YES];
    [self loadData];
}
- (void)searchReusableViewRightBTClck:(NSString *)message {
    [self showMessage:@"加载中..."];
    _isRightButtonClick = YES;
    NSString *str = [message stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    self.url = [NSString stringWithFormat:LCSearchUserUrl,str,self.page];
    [self.view endEditing:YES];
    [self loadData];
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
