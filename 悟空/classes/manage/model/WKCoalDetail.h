//
//  WKCoalDetail.h
//  悟空
//
//  Created by 宋钢强 on 16/8/24.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WKCoalDetail : NSObject

//煤炭名称
@property (nonatomic, copy) NSString *coalName;

//煤炭编号
@property (nonatomic, copy) NSString *coalNum;

//煤炭价
@property (nonatomic, copy) NSString *coalPrice;

//售出吨数
@property (nonatomic, copy) NSString *num;

//leftLbl rightLbl
@property (nonatomic, copy) NSString *left;

@property (nonatomic, copy) NSString *right;



@end
