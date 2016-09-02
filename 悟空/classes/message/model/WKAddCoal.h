//
//  WKAddCoal.h
//  悟空
//
//  Created by 宋钢强 on 16/8/31.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WKAddCoal : NSObject
//煤炭名称
@property (nonatomic, copy) NSString *coalName;

//煤炭种类
@property (nonatomic, copy) NSString *coalZongLei;


//煤炭用途
@property (nonatomic, copy) NSString *coalYongTu;


//煤炭来源
@property (nonatomic, copy) NSString *coalLaiYuan;


//煤炭加工
@property (nonatomic, copy) NSString *coalJiaGong;


//选择粒度
@property (nonatomic, copy) NSString *coalLiDu;


//产地
@property (nonatomic, copy) NSString *coalCangDi;



//煤矿
@property (nonatomic, copy) NSString *coalMeiKuang;


//销售价
@property (nonatomic, copy) NSString *coalXiaoShouJia;



//预计日供货量
@property (nonatomic, copy) NSString *coalGongHuoLiang;


//付款要求

@property (nonatomic, copy) NSString *coalFuKuangYQ;

//热值
@property (nonatomic, copy) NSString *coalReZhi;


//氢含量
@property (nonatomic, copy) NSString *coalQingHanLiang;


//挥发分
@property (nonatomic, copy) NSString *coalHuiFaFen;


//全硫
@property (nonatomic, copy) NSString *coalQunLiu;


//灰分
@property (nonatomic, copy) NSString *coalHuiFen;


//全水分
@property (nonatomic, copy) NSString *coalQuanSuiFen;


//焦渣特性

@property (nonatomic, copy) NSString *coalJiaoZaTeXing;

//固定碳

@property (nonatomic, copy) NSString *coalGuDingTan;

/**
 *  类方法,快速创建模型
 */
+ (instancetype)contactWithcoalName:(NSString *)coalName coalZongLei:(NSString *)coalZongLei coalYongTu:(NSString *)coalYongTu coalLaiYuan:(NSString *)coalLaiYuan coalJiaGong:(NSString *)coalJiaGong coalLiDu:(NSString *)coalLiDu coalCangDi:(NSString *)coalCangDi coalMeiKuang:(NSString *)coalMeiKuang coalXiaoShouJia:(NSString *)coalXiaoShouJia coalGongHuoLiang:(NSString *)coalGongHuoLiang coalFuKuangYQ:(NSString *)coalFuKuangYQ coalReZhi:(NSString *)coalReZhi coalQingHanLiang:(NSString *)coalQingHanLiang coalHuiFaFen:(NSString *)coalHuiFaFen coalQunLiu:(NSString *)coalQunLiu coalHuiFen:(NSString *)coalHuiFen coalQuanSuiFen:(NSString *)coalQuanSuiFen coalJiaoZaTeXing:(NSString *)coalJiaoZaTeXing coalGuDingTan:(NSString *)coalGuDingTan;


@end
