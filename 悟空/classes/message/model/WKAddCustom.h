//
//  WKAddCustom.h
//  悟空
//
//  Created by 宋钢强 on 16/8/18.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WKAddCustom : NSObject<NSCoding>
/**
 *  公司名称
 */
@property (nonatomic, copy) NSString *companyName;

/**
 *  联系人
 */
@property (nonatomic, copy) NSString *name;

/**
 *  联系电话
 */
@property (nonatomic, copy) NSString *phoneNumber;

/**
 *  所在位置
 */
@property (nonatomic, copy) NSString *loaction;

/**
 *  详细地址
 */
@property (nonatomic, copy) NSString *detailLoc;

/**
 *  公司行业
 */
@property (nonatomic, copy) NSString *hangYe;

/**
 *  日用量
 */
@property (nonatomic, copy) NSString *num;


/**
 *  类方法,快速创建模型
 */
+ (instancetype)contactWithcompanyName:(NSString *)companyName name:(NSString *)name phoneNumber:(NSString *)phoneNum loaction:(NSString *)loaction detailLoc:(NSString *)detailLoc hangYe:(NSString *)hangYe num:(NSString *)num;

@end
