//
//  RequestViewController.m
//  MIAOLC
//
//  Created by qianfeng on 15/10/13.
//  Copyright (c) 2015年 苗军艳. All rights reserved.
//

#import "RequestViewController.h"

@interface RequestViewController ()

@end

@implementation RequestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [NSMutableArray array];
    self.view.backgroundColor = LCBaseMagazineColor;
}
- (void)createUI {

}
- (void)fetchData {
    if (![self fetchDataFromLocal]) {
        [self fetchDataFromServer];
    }
    
}
- (BOOL)fetchDataFromLocal {
    return NO;
}
- (void)fetchDataFromServer {
    NSString *url = [self cumposeRequsetUrl];
    [[Netigene sharedInstance]requestMagezineFrom:url success:^(id responsData) {
        [self parsingResponsData:responsData];
    } failed:^(NSError *error) {
        
    }];
}
- (void)parsingResponsData:(id)responsData {
    
}
- (NSString *)cumposeRequsetUrl {
    return LCMagazineUrl;
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
