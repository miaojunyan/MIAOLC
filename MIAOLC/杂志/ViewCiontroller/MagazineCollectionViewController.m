//
//  MagazineCollectionViewController.m
//  MIAOLC
//
//  Created by qianfeng on 15/10/14.
//  Copyright (c) 2015年 苗军艳. All rights reserved.
//

#import "MagazineCollectionViewController.h"
#import "MagazineTableViewCell.h"
#import "MagazineModel.h"
#import "MagazineDetailViewController.h"
#define LCRowHeight  LCKScreenWidth/9 *5
@interface MagazineCollectionViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_dataArray;
    UIButton *_deleteButton;
    NSIndexPath *_editingIndexPath;
}

@property (nonatomic)UITableView *tableView;
@property (nonatomic)NSMutableArray *dataSource;

@end

@implementation MagazineCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createNavTitle];
    //[self fetchData];
    [self createUI];
}
- (void)createNavTitle {
    self.title = @"杂志·我的收藏";
    UIButton *button = [MJYFactory createButton:CGRectMake(0, 0, 40, 40) title:nil setImage:[UIImage imageNamed:@"loginBack.png"] backgroundImage:nil];
    [button addTarget:self action:@selector(goBackClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = item;
}
- (void)goBackClick {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (void)fetchData {
    self.dataSource = [NSMutableArray array];
    self.dataSource =(NSMutableArray *)[[MJYDBManager sharedInstance]readManagerModelInfoList];
    NSLog(@"%@",self.dataSource);
    [self.tableView reloadData];
    
}
- (void)createUI {
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBar.translucent = NO;
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,LCKScreenWidth, LCKScreenHeight - 64)];
     self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    UINib *nib = [UINib nibWithNibName:@"MagazineTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"collectionCellId"];
    [self.view addSubview:self.tableView];
}
#pragma mark -
#pragma mark UITableViewDateSource 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[MJYDBManager sharedInstance]readManagerModelInfoList].count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   MagazineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"collectionCellId" forIndexPath:indexPath];
    MagazineModel *model = [[[MJYDBManager sharedInstance]readManagerModelInfoList]objectAtIndex:indexPath.row];
    [cell updateWithCollection:model];
    [self tableViewCellOriginalLocation:cell];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return LCKScreenWidth/9 * 5;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MagazineModel *model = self.dataSource[indexPath.row];
    MagazineDetailViewController *detailVC = [[MagazineDetailViewController alloc]init];
    detailVC.model = model;
    
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_dataArray removeObjectAtIndex:indexPath.row];
        MagazineModel *model = [[[MJYDBManager sharedInstance]readManagerModelInfoList]objectAtIndex:indexPath.row];
        [[MJYDBManager sharedInstance]delegateManagerModelInfo:model];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
    }
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
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    [self interfaceAnimation];
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
