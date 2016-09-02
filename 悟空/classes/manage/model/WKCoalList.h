//
//  WKCoalList.h
//  悟空
//
//  Created by 宋钢强 on 16/8/24.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WKCoalList : NSObject
//煤炭名称
@property (nonatomic, copy) NSString *coalName;

//售出吨数
@property (nonatomic, assign) NSString *num;

//状态
@property (nonatomic, copy) NSString *status;

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

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)coalListWithDict:(NSDictionary *)dict;


@end
