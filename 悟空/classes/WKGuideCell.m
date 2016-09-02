//
//  WKGuideCell.m
//  悟空
//
//  Created by 宋钢强 on 16/8/9.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WKGuideCell.h"
#import "WKTabBarController.h"
#import "UIView+HMExt.h"
#import "WKLoginViewController.h"
#import "WKLoginController.h"

@implementation WKGuideCell


#pragma mark - 给cell增加按钮

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // 1.立即体验按钮
        UIButton *experienceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        // 2.设置一下图片
        [experienceBtn setImage:[UIImage imageNamed:@"tiyan_03"] forState:UIControlStateNormal];
        
        // 3.调整大小
        [experienceBtn sizeToFit];
        
        experienceBtn.x = (self.width - experienceBtn.width) * 0.5;
        experienceBtn.y = self.height * 0.8;
        
        // 4.默认隐藏
        experienceBtn.hidden = YES;
        
        // 5.添加按钮
        [self.contentView addSubview:experienceBtn];
        
        // 6.赋值
        _exButton = experienceBtn;
        
        // 7.监听按钮点击事件
        [_exButton addTarget:self action:@selector(exButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

#pragma mark - 点击立即体验按钮调用
- (void)exButtonClick {
    
    // 进入主程序
//    [UIApplication sharedApplication].keyWindow.rootViewController = [[WKTabBarController alloc] init];
    [UIApplication sharedApplication].keyWindow.rootViewController = [[WKLoginController alloc] init];

}
@end
