//
//  Netigene.h
//  MIAOLC
//
//  Created by qianfeng on 15/10/10.
//  Copyright (c) 2015年 苗军艳. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SuccessBlockType)(id responsData);
typedef void(^FailedBlockType) (NSError *error);;

@interface Netigene : NSObject

+(instancetype)sharedInstance;

// 杂志
- (void)requestMagezineFrom:(NSString *)url success:(SuccessBlockType)successBlock failed:(FailedBlockType)failedBlock;

@end
