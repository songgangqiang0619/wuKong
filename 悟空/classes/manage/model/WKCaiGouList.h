//
//  WKCaiGouList.h
//  悟空
//
//  Created by 宋钢强 on 16/8/25.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WKCaiGouList : NSObject
//采购编号
@property (nonatomic, copy) NSString *CaiGouNum;
//下单时间
@property (nonatomic, copy) NSString *xiaDanTime;
//煤名称
@property (nonatomic, copy) NSString *coalName;
//煤种
@property (nonatomic, copy) NSString *coalLei;
//产地
@property (nonatomic, copy) NSString *coalPlace;
//热量
@property (nonatomic, copy) NSString *reLiang;

//客户订单信息
@property (nonatomic, copy) NSString *customListMessage;

//收货厂家
@property (nonatomic, copy) NSString *shouHouCJ;
//收货地址
@property (nonatomic, copy) NSString *shouHouPlace;
//客户联系人名称
@property (nonatomic, copy) NSString *keHulinkName;

//购买数量
@property (nonatomic, copy) NSString *keHubuyCount;

//供应商采购订单信息
@property (nonatomic, copy) NSString *gysCaiGouListMessage;
//支付方式
@property (nonatomic, copy) NSString *payMethod;
//发货厂家
@property (nonatomic, copy) NSString *faHuoCangJia;
//发货地址
@property (nonatomic, copy) NSString *faHuoPlace;
//供应商联系人名称
@property (nonatomic, copy) NSString *gysLinkName;
//找车运费
@property (nonatomic, copy) NSString *zhaoCheMoney;
//购买数量
@property (nonatomic, copy) NSString *gysbuyCount;
//供应价格
@property (nonatomic, copy) NSString *gongYingJiaGe;
//订单总煤价
@property (nonatomic, copy) NSString *dingDanTotalMoney;
//代发货
@property (nonatomic, copy) NSString *daiFaHuo;
//已发货
@property (nonatomic, copy) NSString *yiFaHuo;
//已收货
@property (nonatomic, copy) NSString *yiShouHuo;
//已拒收
@property (nonatomic, copy) NSString *yiJuShou;
//状态
@property (nonatomic, copy) NSString *status;



@end
