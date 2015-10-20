//
//  Netigene.m
//  MIAOLC
//
//  Created by qianfeng on 15/10/10.
//  Copyright (c) 2015年 苗军艳. All rights reserved.
//

#import "Netigene.h"
#import "AFHTTPRequestOperationManager.h"

@interface Netigene()

@property (nonatomic)AFHTTPRequestOperationManager *manager;
@property (nonatomic,copy)FailedBlockType failedBlock;

@end
@implementation Netigene

+(instancetype)sharedInstance {
    static Netigene *s_manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!s_manager) {
            s_manager = [[Netigene alloc]init];
        }
    });
    return s_manager;
}

- (instancetype)init {
    if (self = [super init]) {
        _manager = [[AFHTTPRequestOperationManager alloc]init];
        NSSet *set = _manager.responseSerializer.acceptableContentTypes;
        NSMutableSet *mset = [NSMutableSet setWithSet:set];
        [mset addObject:@"text/html"];
        self.manager.responseSerializer.acceptableContentTypes = mset;
    }
    return self;
}

- (void)get:(NSString *)url success:(SuccessBlockType)successBlock failed:(FailedBlockType)failedBlock {
    
    NSString *strUrl = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [self.manager GET:strUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (successBlock) {
            successBlock(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failedBlock) {
            failedBlock(error);
        }
    }];
}

- (void)requestMagezineFrom:(NSString *)url success:(SuccessBlockType)successBlock failed:(FailedBlockType)failedBlock {
    
    self.failedBlock = failedBlock;
    [self get:url success:successBlock failed:failedBlock];
}
@end
