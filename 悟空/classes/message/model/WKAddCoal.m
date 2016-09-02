//
//  WKAddCoal.m
//  悟空
//
//  Created by 宋钢强 on 16/8/31.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WKAddCoal.h"

@implementation WKAddCoal

+ (instancetype)contactWithcoalName:(NSString *)coalName coalZongLei:(NSString *)coalZongLei coalYongTu:(NSString *)coalYongTu coalLaiYuan:(NSString *)coalLaiYuan coalJiaGong:(NSString *)coalJiaGong coalLiDu:(NSString *)coalLiDu coalCangDi:(NSString *)coalCangDi coalMeiKuang:(NSString *)coalMeiKuang coalXiaoShouJia:(NSString *)coalXiaoShouJia coalGongHuoLiang:(NSString *)coalGongHuoLiang coalFuKuangYQ:(NSString *)coalFuKuangYQ coalReZhi:(NSString *)coalReZhi coalQingHanLiang:(NSString *)coalQingHanLiang coalHuiFaFen:(NSString *)coalHuiFaFen coalQunLiu:(NSString *)coalQunLiu coalHuiFen:(NSString *)coalHuiFen coalQuanSuiFen:(NSString *)coalQuanSuiFen coalJiaoZaTeXing:(NSString *)coalJiaoZaTeXing coalGuDingTan:(NSString *)coalGuDingTan{


    WKAddCoal *addCoal = [[self alloc]init];
    addCoal.coalName = coalName;

//    //煤炭种类
//    @property (nonatomic, copy) NSString *coalZongLei;
//    
    addCoal.coalZongLei = coalZongLei;
//    //煤炭用途
//    @property (nonatomic, copy) NSString *coalYongTu;
//    
    addCoal.coalYongTu = coalYongTu;

//    //煤炭来源
//    @property (nonatomic, copy) NSString *coalLaiYuan;
    addCoal.coalLaiYuan = coalLaiYuan;

//
//    //煤炭加工
//    @property (nonatomic, copy) NSString *coalJiaGong;
    addCoal.coalJiaGong = coalJiaGong;

//
//    //选择粒度
//    @property (nonatomic, copy) NSString *coalLiDu;
    addCoal.coalLiDu = coalLiDu;

//
//    //产地
//    @property (nonatomic, copy) NSString *coalCangDi;
    addCoal.coalCangDi = coalCangDi;

//
//    
//    //煤矿
//    @property (nonatomic, copy) NSString *coalMeiKuang;
    addCoal.coalMeiKuang = coalMeiKuang;

//
//    //销售价
//    @property (nonatomic, copy) NSString *coalXiaoShouJia;
    addCoal.coalXiaoShouJia = coalXiaoShouJia;

//
//    
//    //预计日供货量
//    @property (nonatomic, copy) NSString *coalGongHuoLiang;
//    
    addCoal.coalGongHuoLiang = coalGongHuoLiang;

//    //付款要求
//    
//    @property (nonatomic, copy) NSString *coalFuKuangYQ;
    addCoal.coalFuKuangYQ = coalFuKuangYQ;

//    //热值
//    @property (nonatomic, copy) NSString *coalReZhi;
    addCoal.coalReZhi = coalReZhi;

//
//    //氢含量
//    @property (nonatomic, copy) NSString *coalQingHanLiang;
    addCoal.coalQingHanLiang = coalQingHanLiang;

//
//    //挥发分
//    @property (nonatomic, copy) NSString *coalHuiFaFen;
    addCoal.coalHuiFaFen = coalHuiFaFen;

//
//    //全硫
//    @property (nonatomic, copy) NSString *coalQunLiu;
    addCoal.coalQunLiu = coalQunLiu;

//
//    //灰分
//    @property (nonatomic, copy) NSString *coalHuiFen;
    addCoal.coalHuiFen = coalHuiFen;
 
//
//    //全水分
//    @property (nonatomic, copy) NSString *coalQuanSuiFen;
    addCoal.coalQuanSuiFen = coalQuanSuiFen;

//
//    //焦渣特性
//    
//    @property (nonatomic, copy) NSString *coalJiaoZaTeXing;
    addCoal.coalJiaoZaTeXing = coalJiaoZaTeXing;

//    //固定碳
//    
//    @property (nonatomic, copy) NSString *coalGuDingTan;
    addCoal.coalGuDingTan = coalGuDingTan;

//
//    
    
    return addCoal;

}


@end
