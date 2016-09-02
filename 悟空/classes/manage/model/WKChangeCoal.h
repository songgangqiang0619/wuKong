//
//  WKChangeCoal.h
//  悟空
//
//  Created by 宋钢强 on 16/8/25.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WKChangeCoal : NSObject
//煤炭名称
@property (nonatomic, copy) NSString *coalName;

//供应商
@property (nonatomic, copy) NSString *gongYS;

//粒度
@property (nonatomic, assign) NSString *lidu;
//煤种
@property (nonatomic, copy) NSString *coalLei;
//产地
@property (nonatomic, copy) NSString *coalPlace;

//热值
@property (nonatomic, assign) NSString* reZhi;

//硫
@property (nonatomic, assign) NSString *liu;

//水分
@property (nonatomic, assign) NSString *water;

//灰分
@property (nonatomic, assign) NSString *huiFen;

//氢
@property (nonatomic, assign) NSString *qing;

//煤炭价
@property (nonatomic, assign) NSString *coalPrice;

@end
