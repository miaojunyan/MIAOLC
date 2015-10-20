//
//  StoreHeadView.m
//  MIAOLC
//
//  Created by qianfeng on 15/10/15.
//  Copyright (c) 2015年 苗军艳. All rights reserved.
//

#import "StoreHeadView.h"

@interface StoreHeadView()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@end

@implementation StoreHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        self = [[[NSBundle mainBundle]loadNibNamed:@"StoreHeadView" owner:nil options:nil]lastObject];
        [self addTapGestureRecognizer];
    }
    return self;
}
- (void)addTapGestureRecognizer {
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hangleTapGesture)];
    [self addGestureRecognizer:tapGesture];
}
- (void)hangleTapGesture {
    if (self.block) {
        self.block(self.tag);
    }
}
- (void)updateWithModel:(StoryItemModel *)model {
    NSString *iconUrlStr = [model.cover objectForKey:@"url"];
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:iconUrlStr]];
    
}
- (void)setFrame:(CGRect)frame {
    CGRect sectionRect = [self.tableView rectForSection:self.section];
    CGRect newframe = CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(sectionRect), CGRectGetWidth(frame), CGRectGetHeight(frame));
    [super setFrame:newframe];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
