//
//  StoreViewController.m
//  MIAOLC
//
//  Created by qianfeng on 15/10/9.
//  Copyright (c) 2015年 苗军艳. All rights reserved.
//

#import "StoreViewController.h"
#import "StoryItemModel.h"
#import "StoreHeadView.h"
#import "StoreTableViewCell.h"
#import "ShopSearchViewController.h"
@interface StoreViewController ()<UITableViewDelegate,UITableViewDataSource>

{
    BOOL flag[5];//使用flag数组来记录每个区的状态，
    //NO 关闭  YES 展开
}
@property (nonatomic)UITableView *tableView;
@property (nonatomic)NSArray *sectionDataSource;
@property (nonatomic)NSMutableDictionary *cellDataSource;

@property (nonatomic)NSArray *headDataSource;

@property (nonatomic)NSInteger lastSelectedIndex;

@end

@implementation StoreViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    UIView *view = [self.tabBarController.view viewWithTag:10000];
    view.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self customUI];
    [self loadData];
}
- (void)loadData {
    if ([self loadDataFromLocal]) {
        [self loadDataFromNet];
    }
}
- (BOOL)loadDataFromLocal {
    return YES;
}
- (void)loadDataFromNet {
    [[Netigene sharedInstance]requestMagezineFrom:LCStoreUrl success:^(id responsData) {
        self.sectionDataSource  = [paseData paseStoryData:responsData];
        [self setUpCellDataSource];
        [self.tableView reloadData];
    } failed:^(NSError *error) {
        
    }];
}
- (void)setUpCellDataSource {
    self.cellDataSource = [NSMutableDictionary dictionary];
    for (int index = 0; index < self.sectionDataSource.count; index ++) {
        StoryItemModel *model = self.sectionDataSource[index];
        [self.cellDataSource setObject: model.children forKey:@(index)];
    }
}
- (void)customUI {
   self.view.backgroundColor = [UIColor blackColor];
    [self setUpNavigationBar];
    [self setUpTableView];
}
- (void)setUpTableView {
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, LCKScreenWidth, LCKScreenHeight - 64 - 49) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = LCBaseColor;
    self.tableView.bounces = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self registCell];
    
    [self.view addSubview:self.tableView];
    
}
- (void)registCell {
    UINib *nib1 = [UINib nibWithNibName:@"StoreHeadView" bundle:nil];
    [self.tableView registerNib:nib1 forHeaderFooterViewReuseIdentifier:@"ViewId"];
    UINib *nib2 = [UINib nibWithNibName:@"StoreTableViewCell" bundle:nil];
    [self.tableView registerNib:nib2 forCellReuseIdentifier:@"StoreCellId"];
    
}
- (void)setUpNavigationBar {
    self.title = @"商店";
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.backgroundColor = [UIColor blackColor];
    UIBarButtonItem *leftBar = [UIBarButtonItem itemWithImageName:@"btn_nav_search" hightImageName:nil target:self action:@selector(searchBarClick)];
    self.navigationItem.leftBarButtonItem = leftBar;
}
- (void)searchBarClick {
    ShopSearchViewController *shopSearchVC = [[ShopSearchViewController alloc]init];
    [self.navigationController pushViewController:shopSearchVC animated:YES];
}
#pragma mark -
#pragma mark UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionDataSource.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (flag[section]== NO) {
        return 0;
    }else {
        NSArray *modelArr = [self.cellDataSource objectForKey:@(section)];
        return modelArr.count;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    StoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StoreCellId" forIndexPath:indexPath];
    NSArray *modelArr = [self.cellDataSource objectForKey:@(indexPath.section)];
    StoryItemModel *model = modelArr[indexPath.row];
    [cell updateWith:model];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    StoreHeadView *headView = [[StoreHeadView alloc]initWithFrame:CGRectMake(0, 0, LCKScreenWidth, 200)];
    [headView updateWithModel:self.sectionDataSource[section]];
    headView.tableView = tableView;
    headView.section = section;
    headView.tag = section + 100;
    headView.block = ^(NSInteger tag){
        NSInteger section = tag - 100;
        [self setSectionFlag:section];
        flag[section] = !flag[section];
        [self.tableView reloadData];
        [self scrollToLastRowInsection:section];
    };
    return headView;
}
- (void)setSectionFlag:(NSInteger)section {
    for (int index = 0; index < self.sectionDataSource.count; index ++) {
        if (index != section) {
            flag[index]= NO;
        }
    }
}
- (void)scrollToLastRowInsection:(NSInteger)section {
    NSInteger number = [self.tableView numberOfRowsInSection:section];
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:number - 1 inSection:section] atScrollPosition:UITableViewScrollPositionNone animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 200;
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
