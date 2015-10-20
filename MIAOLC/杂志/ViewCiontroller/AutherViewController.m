//
//  AutherViewController.m
//  MIAOLC
//
//  Created by qianfeng on 15/10/13.
//  Copyright (c) 2015年 苗军艳. All rights reserved.
//

#import "AutherViewController.h"
#import "AutherTableViewCell.h"
#import "AuthorModel.h"
@interface AutherViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic)UITableView *tableView;

@end

@implementation AutherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    [self fetchData];
}
- (void)createUI {
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, LCKScreenWidth,LCKScreenHeight - 70 - 64) style:UITableViewStylePlain];
    self.tableView.backgroundColor = LCBaseMagazineColor;
    UINib *nib = [UINib nibWithNibName:@"AutherTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"AutherCellId"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}
//解析数据
- (void)parsingResponsData:(id)responsData {
    self.dataSource = [paseData paseMagezineAutherDataSource:responsData];
    
    [self.tableView reloadData];
}

//请求路径
- (NSString *)cumposeRequsetUrl {
    return LCMagazineAuthorUrl;
}
#pragma mark -
#pragma mark UITableViewDelegate 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AutherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AutherCellId" forIndexPath:indexPath];
    AuthorModel *model = self.dataSource[indexPath.row];
    [cell updateWith:model];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AuthorModel *model = self.dataSource[indexPath.row];
    if ([self.delegate respondsToSelector:@selector(goBack:title:)]) {
        [self.delegate goBack:[NSString stringWithFormat:LCMagazineAuthorGoBackUrl,model.author_id] title:model.author_name];
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
