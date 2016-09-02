//
//  WKHeaderView.m
//  悟空
//
//  Created by 宋钢强 on 16/8/10.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WKHeaderView.h"
#import "Masonry.h"
@interface WKHeaderView()

@property (nonatomic,weak)UIImageView *imgView;

@property (nonatomic,weak)UILabel *firstLbl;

@property (nonatomic, weak) UILabel *midLbl;

@property (nonatomic, weak) UILabel *lastLbl;

@end

@implementation WKHeaderView

- (instancetype)init
{
    self = [super init];
    if (self) {
        UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"查看指标灰"]];
        imgView.layer.cornerRadius = 50;
        imgView.layer.masksToBounds = YES;
        
        [self addSubview:imgView];
        self.imgView = imgView;
        
        UILabel *firstLbl = [[UILabel alloc] init];
        firstLbl.text = @"个人  认证中";
        [self addSubview:firstLbl];
        self.firstLbl = firstLbl;
        
        UILabel *midLbl = [[UILabel alloc] init];
        midLbl.text = @"个人  认证中";
        [self addSubview:midLbl];
        self.midLbl = midLbl;

        UILabel *lastLbl = [[UILabel alloc] init];
        lastLbl.text = @"个人  认证中";
        [self addSubview:lastLbl];
        self.lastLbl = lastLbl;

        
    }
    return self;
}


-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(20);
        make.top.mas_equalTo(self).offset(10);
        make.width.height.mas_equalTo(100);
        
    }];
    
    [self.firstLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.imgView.mas_right).offset(20);
        make.top.mas_equalTo(self.imgView);
        
    }];
    
    [self.midLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.firstLbl);
        make.bottom.mas_equalTo(self.lastLbl.mas_top).offset(-5);
    }];
    
    [self.lastLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.firstLbl);
        make.bottom.mas_equalTo(self.imgView);
        
    }];
    
}






@end
