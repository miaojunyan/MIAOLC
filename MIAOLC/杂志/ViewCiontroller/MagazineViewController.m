//
//  MagazineViewController.m
//  MIAOLC
//
//  Created by qianfeng on 15/10/9.
//  Copyright (c) 2015年 苗军艳. All rights reserved.
//

#import "MagazineViewController.h"
#import "MagazineTableViewCell.h"
#import "MagazineModel.h"
#import "MagazineDetailViewController.h"
#import "MagazineCategoryViewController.h"
#import "MagazineCollectionViewController.h"
#define LCRowHeight LCKScreenWidth/9 *5
@interface MagazineViewController ()<UITableViewDataSource,UITableViewDelegate,MagazineCategoryViewControllerDelegate>

@property (nonatomic)UITableView *tableView;
@property (nonatomic)NSMutableArray *dataKey;
@property (nonatomic)NSDictionary *dataSource;
@property (nonatomic)NSString *url;
@property (nonatomic)UIButton *leftItem;
@property (nonatomic)UIButton *button;
@property (nonatomic)UIImageView *imageView;

@property (nonatomic)NSString *buttonButtonTitle;
@property (nonatomic)NSIndexPath *indexPath;

@end

@implementation MagazineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    [self fetchData];
    [self createNavTitle];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    UIView *view = [self.tabBarController.view viewWithTag:10000];
    view.hidden = NO;
}
- (void)createUI {
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBar.translucent = NO;
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, LCKScreenWidth, LCKScreenHeight - LCTabBarHeight) style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = [UIColor colorWithRed:25/255.0 green:25/255.0 blue:27/255.0 alpha:1.0];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    UINib *nib = [UINib nibWithNibName:@"MagazineTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"MagazineCellId"];
    [self.tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"headCellId"];

    [self.view addSubview:self.tableView];
}
#pragma mark -
#pragma mark dataSource 
- (void)fetchData {
    if (![self fetchDataFromLocal]) {
        [self fetchDataFromSetver];
    }
    
}
- (BOOL)fetchDataFromLocal {
    
    return NO;
}
- (void)fetchDataFromSetver {
    NSString *url = [self composeRequestUrl];
   [[Netigene sharedInstance]requestMagezineFrom:url success:^(id responsData) {
       
       self.dataKey = [paseData paseMagezineDataKey:responsData];
       self.dataSource = [paseData paseMagezineDataSource:responsData];
       [self.tableView reloadData];
   } failed:^(NSError *error) {
    
   }];

}
- (NSString *)composeRequestUrl {
    NSString *url = self.url == nil?LCMagazineUrl : self.url;
    return url;
}
#pragma mark -
#pragma mark 定制Nav
- (void)createNavTitle {
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, LCKScreenWidth-20, 44)];
    view.backgroundColor = LCBaseColor;
    self.leftItem = [UIButton buttonWithType:UIButtonTypeCustom];
    self.leftItem.frame = CGRectMake(0, 14, 80, 30);
    [self.leftItem setTintColor:[UIColor whiteColor]];
    [view addSubview:self.leftItem];
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.button setTitle:@"杂志" forState:UIControlStateNormal];
    self.button.frame = CGRectMake(0, 0, LCKScreenWidth - 20, 44);
    self.button.titleLabel.font = [UIFont systemFontOfSize:18];
    [self.button setTintColor:[UIColor whiteColor]];
    [self.button addTarget:self action:@selector(titleButtonClick) forControlEvents:UIControlEventTouchUpInside];
    self.imageView = [[UIImageView alloc]init];
    self.imageView.bounds = CGRectMake(0, 0, 6, 5);
    self.imageView.center = CGPointMake([MJYHelper widthWithBody:self.button.currentTitle]/2+LCKScreenWidth/2, 22);
    self.imageView.image = [UIImage imageWithOriginal:@"spec_triangle.gif"];
    [view addSubview:self.imageView];
    [view addSubview:self.button];
    self.navigationItem.titleView = view;
}
- (void)titleButtonClick {
    MagazineCategoryViewController *magazineCVC = [[MagazineCategoryViewController alloc]init];
    magazineCVC.delegate = self;
    magazineCVC.indexPath = self.indexPath;
    magazineCVC.lowButtonTitle = self.button.titleLabel.text;
    [self presentViewController:magazineCVC animated:YES completion:nil];
}
#pragma mark - 
#pragma mark MagazineCategoryViewControllerDelegate

- (void)goBackMagezineCategoryView:(NSString *)url title:(NSString *)title indexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        MagazineCollectionViewController *collectionVC = [[MagazineCollectionViewController alloc]init];
        [self.navigationController pushViewController:collectionVC animated:YES];
    }
    if (indexPath.row == 1) {
        [self.button setTitle:@"杂志" forState:UIControlStateNormal];
        self.buttonButtonTitle = title;
    }
    else {
        [self.button setTitle:[NSString stringWithFormat:@"杂志·%@",title] forState:UIControlStateNormal];
        self.buttonButtonTitle = title;
    }
    self.imageView.center = CGPointMake([MJYHelper widthWithBody:self.button.currentTitle]/2+LCKScreenWidth/2, 22);
    self.url = url;
    self.indexPath = indexPath;
    [self fetchData];
}
- (void)goBackMagezineCategoryView:(NSString *)url title:(NSString *)title {
    self.url = url;
    [self.button setTitle:[NSString stringWithFormat:@"杂志·%@",title] forState:UIControlStateNormal];
    self.imageView.center = CGPointMake([MJYHelper widthWithBody:self.button.currentTitle]/2+LCKScreenWidth/2, 22);
    [self fetchData];
}
#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.dataKey.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *dataArr = [self.dataSource objectForKey:self.dataKey[section]];
    return dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MagazineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MagazineCellId" forIndexPath:indexPath];
    NSArray *dataArr = [self.dataSource objectForKey:self.dataKey[indexPath.section]];
    MagazineModel *model = dataArr[indexPath.row];
    [cell updateWith:model];
    [self tableViewCellOriginalLocation:cell];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return LCRowHeight;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *arr = [self.dataSource objectForKey:self.dataKey[indexPath.section]];
    MagazineModel *model = arr[indexPath.row];
    MagazineDetailViewController *detailVC = [[MagazineDetailViewController alloc]init];
    detailVC.model = model;
   
    [self.navigationController pushViewController:detailVC animated:YES];
    
}
#pragma mark -
#pragma mark UITableViewDelegate 

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 40;
    }
    return 20;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UITableViewHeaderFooterView *view = [tableView dequeueReusableCellWithIdentifier:@"headCellId"];
    if (view == nil) {
        view = [[UITableViewHeaderFooterView alloc]initWithReuseIdentifier:@"headCellId"];
    }
    view.contentView.backgroundColor = LCBaseColor;
    NSMutableString *str = [self.dataKey objectAtIndex:section];
    NSString *subTitle = [str substringFromIndex:5];
    UILabel *label = [[UILabel alloc]init];
    if (section == 0) {
        label.frame = CGRectMake(0, 0, LCKScreenWidth, 40);
    }else {
        label.frame = CGRectMake(0, -10, LCKScreenWidth,25);
    }
    
    label.text = subTitle;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    [view.contentView addSubview:label];
    return view;
    
}
#pragma mark - 
#pragma UIScrollViewDelegate 

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.tableView) {
        [self leftHeadAnimation];
    }
    [self interfaceAnimation];
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [UIView animateWithDuration:0.5 animations:^{
        UIView *view = [self.tabBarController.view viewWithTag:10000];
        view.alpha = 0.01;
    }];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [UIView animateWithDuration:0.5 animations:^{
        UIView *view = [self.tabBarController.view viewWithTag:10000];
        view.alpha = 1.0;
    }];
}

#pragma mark -
#pragma mark 界面显示动画

//cell 动画
- (void)interfaceAnimation {
    MagazineTableViewCell *cell = [[self.tableView visibleCells]firstObject];
    if (self.tableView.contentOffset.y >= cell.topY) {
        CGFloat height = cell.bottom - self.tableView.contentOffset.y;
        CGFloat scale = 1 - (height/cell.height);
        cell.BigImageView.alpha = 1 - scale *0.5;
        cell.BigImageView.frame = CGRectMake(25*scale ,LCRowHeight - height , LCKScreenWidth - 50 * scale, LCRowHeight);
        cell.layer.masksToBounds = YES;
    }
    if (self.tableView.contentOffset.y >= cell.topY + 70 &&self.tableView.contentOffset.y <= cell.bottom - 65) {
        CGFloat height = self.tableView.contentOffset.y - cell.topY + 10;
        cell.titleLabel.frame = CGRectMake(0, height, LCKScreenWidth, 25);
        cell.catNameLabel.frame = CGRectMake(0, height + 30, LCKScreenWidth, 20);
        
    }
    if (self.tableView.contentOffset.y < cell.topY) {
        [self tableViewCellOriginalLocation:cell];
    }
    if ([self.tableView visibleCells].count >= 2) {
        MagazineTableViewCell *cell1 = [[self.tableView visibleCells] objectAtIndex:1];
        if (self.tableView.contentOffset.y < cell1.topY) {
            [self tableViewCellOriginalLocation:cell1];
        }
    }
    
}
//初始化cell的位置
- (void)tableViewCellOriginalLocation:(MagazineTableViewCell *)cell {
    cell.BigImageView.frame = CGRectMake(0, 0, LCKScreenWidth, LCRowHeight);
    cell.titleLabel.frame = CGRectMake(0, 80, LCKScreenWidth, 25);
    cell.catNameLabel.frame = CGRectMake(0, 110, LCKScreenWidth, 20);
    cell.BigImageView.alpha = 1;
}
// leftItem 的日期动画
- (void)leftHeadAnimation {
    if (self.tableView.contentOffset.y < 40) {
        [self.leftItem setTitle:nil forState:UIControlStateNormal];
    }
    else if(self.tableView.contentOffset.y >= 40){
        [self.leftItem setTitle:[self getNeedString:self.dataKey[0]] forState:UIControlStateNormal];
    }
    for (int index = 1; index < self.dataKey.count; index++) {
        int count = 0;
        for (int i = 0; i < index; i++) {
            NSArray *arr = [self.dataSource objectForKey:self.dataKey[i]];
            count += arr.count;
        }
        CGFloat headTopY = index*40+count*LCRowHeight;
        CGFloat headTopHeight = headTopY + 40;
        if (self.tableView.contentOffset.y >= headTopHeight) {
            [self.leftItem setTitle:[self getNeedString:self.dataKey[index]] forState:UIControlStateNormal];
        }
    }
}
//获取需要的字符串
- (NSString *)getNeedString:(NSString *)string {
    NSString *subTitle = [string substringFromIndex:5];
    return subTitle;
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
