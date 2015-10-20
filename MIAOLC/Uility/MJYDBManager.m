//
//  MJYDBManager.m
//  MIAOLC
//
//  Created by qianfeng on 15/10/14.
//  Copyright (c) 2015年 苗军艳. All rights reserved.
//

#import "MJYDBManager.h"
#import "FMDatabase.h"

@interface MJYDBManager()
{
    FMDatabase *_db;//数据库实例
}
@end

@implementation MJYDBManager

+ (instancetype)sharedInstance {
    static MJYDBManager *s_manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s_manager = [[MJYDBManager alloc]init];
    });
    return s_manager;
}

//获取存储的路径
- (NSString *)dbPath {
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/LC.db"];
}

- (id)init {
    if (self = [super init]) {
        _db = [[FMDatabase alloc]initWithPath:[self dbPath]];
        if ([_db open]) {
            [self createTable];
        }
    }
    return self;
}
- (void)createTable {
    NSString *sql = @"create table if not exists modelInfo(taid text primary key,topic_name text,topic_url text,cover_img_new text,addtime text,nav_title text,author_name text,cat_name text)";
    if (![_db executeUpdate:sql]) {
        NSLog(@"创建表格失败");

    }
}
//添加
- (void)addManagerModelInfo:(MagazineModel *)model {
    NSString *sql = @"insert into modelInfo(taid,topic_name,topic_url,cover_img_new ,addtime,nav_title,author_name,cat_name) values(?,?,?,?,?,?,?,?)";
    NSDate *date = [NSDate date];
    //日期格式化类
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSString *strDate = [fmt stringFromDate:date];
    if (![_db executeUpdate:sql,model.taid,model.topic_name,model.topic_url,model.cover_img_new,strDate,model.nav_title,model.author_name,model.cat_name]) {
        NSLog(@"插入失败");
    }
}

//删除
- (void)delegateManagerModelInfo:(MagazineModel *)model {
    NSString *sql = @"delete from modelInfo where taid = ?";
    if (![_db executeUpdate:sql,model.taid]) {
        NSLog(@"删除失败");
    }
}

//读取数据库所有的信息
- (NSArray *)readManagerModelInfoList {
    NSMutableArray *modelArr = [NSMutableArray array];
    NSString *sql = @"select *from modelInfo";
    FMResultSet *resultSet = [_db executeQuery:sql];
    while (resultSet.next) {
        MagazineModel *model = [[MagazineModel alloc]init];
        model.taid = [resultSet stringForColumn:@"taid"];
        model.topic_url = [resultSet stringForColumn:@"topic_url"];
        model.topic_name = [resultSet stringForColumn:@"topic_name"];
        model.cover_img_new = [resultSet stringForColumn:@"cover_img_new"];
        model.addtime = [resultSet stringForColumn:@"addtime"];
        model.nav_title = [resultSet stringForColumn:@"nav_title" ];
        model.author_name = [resultSet stringForColumn:@"author_name"];
        model.cat_name = [resultSet stringForColumn:@"cat_name"];
        [modelArr addObject:model];
    }
    [resultSet close];
    return modelArr;
}
//判断该模型是否存在
- (BOOL)isManagerExists:(MagazineModel *)model {
    BOOL isExist = NO;
    NSString *sql = @"select * from modleInfo where taid = ?";
    FMResultSet *resultSet = [_db executeQuery:sql,model.taid];
    if (resultSet.next) {
        isExist = YES;
    }
    [resultSet close];
    return isExist;
}


@end
