//
//  WKAddCoalTableViewController.m
//  悟空
//
//  Created by 宋钢强 on 16/8/16.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WKAddCoalTableViewController.h"
#import "WKDiQuTableVC.h"
#import "WKAddCoal.h"
@interface WKAddCoalTableViewController ()

//参考尺寸标准
@property (weak, nonatomic) IBOutlet UILabel *chiCunLbl;
//毫米
@property (weak, nonatomic) IBOutlet UITextField *haomi1;

//至毫米
@property (weak, nonatomic) IBOutlet UITextField *haomi2;
//煤炭名称
@property (weak, nonatomic) IBOutlet UITextField *coalNameText;

//产地
@property (weak, nonatomic) IBOutlet UITextField *cangDi;

//煤矿
@property (weak, nonatomic) IBOutlet UITextField *meiKuang;


//销售价
@property (weak, nonatomic) IBOutlet UITextField *xiaoShouJia;

//预计日供货量
@property (weak, nonatomic) IBOutlet UITextField *gongHuoLiang;

//付款要求

//煤炭指标
//热值
@property (weak, nonatomic) IBOutlet UITextField *zhibiao1;
//含氢量
@property (weak, nonatomic) IBOutlet UITextField *zhibiao2;
//挥发分
@property (weak, nonatomic) IBOutlet UITextField *zhibiao3;
//全硫
@property (weak, nonatomic) IBOutlet UITextField *zhibiao4;
//灰分
@property (weak, nonatomic) IBOutlet UITextField *zhibiao5;

//全水分
@property (weak, nonatomic) IBOutlet UITextField *zhibiao6;

//焦渣特性
@property (weak, nonatomic) IBOutlet UITextField *zhibiao7;

//固定碳
@property (weak, nonatomic) IBOutlet UITextField *zhibiao8;




//煤炭种类
@property (weak, nonatomic) IBOutlet UIButton *zongLei1;
@property (weak, nonatomic) IBOutlet UIButton *zongLei2;
@property (weak, nonatomic) IBOutlet UIButton *zongLei3;


//煤炭用途
@property (weak, nonatomic) IBOutlet UIButton *yongTuBtn1;

@property (weak, nonatomic) IBOutlet UIButton *yongTuBtn2;

@property (weak, nonatomic) IBOutlet UIButton *yongTuBtn3;
//煤炭来源
@property (weak, nonatomic) IBOutlet UIButton *laiYuanBtn1;
@property (weak, nonatomic) IBOutlet UIButton *laiYuanBtn2;


//煤炭加工

@property (weak, nonatomic) IBOutlet UIButton *jiaGongBtn1;
@property (weak, nonatomic) IBOutlet UIButton *jiaGongBtn2;

//选中粒度

@property (weak, nonatomic) IBOutlet UIButton *liDu1;

@property (weak, nonatomic) IBOutlet UIButton *liDu2;

@property (weak, nonatomic) IBOutlet UIButton *liDu3;
@property (weak, nonatomic) IBOutlet UIButton *liDu4;
@property (weak, nonatomic) IBOutlet UIButton *liDu5;
@property (weak, nonatomic) IBOutlet UIButton *liDu6;


@property (weak, nonatomic) IBOutlet UIButton *liDu7;

@property (weak, nonatomic) IBOutlet UIButton *liDu8;


@property (weak, nonatomic) IBOutlet UIButton *liDu9;

//付款要求
@property (weak, nonatomic) IBOutlet UIButton *yaoqiu1;

@property (weak, nonatomic) IBOutlet UIButton *yaoqiu2;
@property (weak, nonatomic) IBOutlet UIButton *yaoqiu3;
@property (weak, nonatomic) IBOutlet UIButton *yaoqiu4;

//种类
@property (nonatomic, copy) NSString *coalZongLei;
//用途
@property (nonatomic, copy) NSString *yongTu;

//来源
@property (nonatomic, copy) NSString *laiYuan;

//加工
@property (nonatomic, copy) NSString *jiaGong;

//粒度
@property (nonatomic, copy) NSString *liDu;


//付款要求
@property (nonatomic, copy) NSString *yaoQiu;


@end

@implementation WKAddCoalTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 44)];
    
    footerView.backgroundColor = [UIColor greenColor];
    self.tableView.tableFooterView = footerView;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, self.view.bounds.size.width, footerView.bounds.size.height);
    [btn setTitle:@"添加" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(addBtnClick) forControlEvents:UIControlEventTouchUpInside];
    //    [btn sizeToFit];
    [footerView addSubview:btn];
    
    self.haomi1.enabled = NO;
    self.haomi2.enabled = NO;

    
}

- (IBAction)yongTuBtn1:(UIButton*)sender {
    if (sender.tag == 10) {
        self.zongLei1.selected = YES;
        self.zongLei2.selected = NO;
        self.zongLei3.selected = NO;
        self.yongTuBtn2.enabled = YES;
        self.yongTuBtn1.enabled = YES;
        self.yongTuBtn3.enabled = YES;
        self.coalZongLei = self.zongLei1.titleLabel.text;

    }
    
    if (sender.tag == 11) {
        self.zongLei1.selected = NO;
        self.zongLei2.selected = YES;
        self.zongLei3.selected = NO;
        self.yongTuBtn2.enabled = NO;
        self.yongTuBtn1.enabled = YES;
        self.yongTuBtn3.enabled = YES;
        self.coalZongLei = self.zongLei2.titleLabel.text;

    }
    if (sender.tag == 12) {
        self.zongLei1.selected = NO;
        self.zongLei2.selected = NO;
        self.zongLei3.selected = YES;
        self.yongTuBtn2.enabled = NO;
        self.yongTuBtn1.enabled = NO;
        self.yongTuBtn3.enabled = YES;
        self.coalZongLei = self.zongLei3.titleLabel.text;



    }
    if (sender.tag == 20) {
        self.yongTuBtn1.selected = YES;
        self.yongTuBtn2.selected = NO;
        self.yongTuBtn3.selected = NO;
        self.yongTu = self.yongTuBtn1.titleLabel.text;
    }
    if (sender.tag == 21) {
        self.yongTuBtn1.selected = NO;
        self.yongTuBtn2.selected = YES;
        self.yongTuBtn3.selected = NO;
        self.yongTu = self.yongTuBtn2.titleLabel.text;

    }
    if (sender.tag == 22) {
        self.yongTuBtn1.selected = NO;
        self.yongTuBtn2.selected = NO;
        self.yongTuBtn3.selected = YES;
        self.yongTu = self.yongTuBtn3.titleLabel.text;

    }
    
    if (sender.tag == 30) {
        self.laiYuanBtn1.selected = YES;
        self.laiYuanBtn2.selected = NO;
        self.laiYuan = self.laiYuanBtn1.titleLabel.text;
        
    }
    if (sender.tag == 31) {
        self.laiYuanBtn2.selected = YES;
        self.laiYuanBtn1.selected = NO;
        self.laiYuan = self.laiYuanBtn2.titleLabel.text;

    }
    
    if (sender.tag == 40) {
        self.jiaGongBtn1.selected = YES;
        self.jiaGongBtn2.selected = NO;
        self.jiaGong = self.jiaGongBtn1.titleLabel.text;
        
    }
    if (sender.tag == 41) {
        self.jiaGongBtn2.selected = YES;
        self.jiaGongBtn1.selected = NO;
        self.jiaGong = self.jiaGongBtn2.titleLabel.text;

    }
    if (sender.tag == 50) {
        self.liDu1.selected = YES;
        self.liDu2.selected = NO;
        self.liDu3.selected = NO;
        self.liDu4.selected = NO;
        self.liDu5.selected = NO;
        self.liDu6.selected = NO;
        self.liDu7.selected = NO;
        self.liDu8.selected = NO;
        self.liDu9.selected = NO;
        self.chiCunLbl.text = @"0-25";
        self.liDu = @"0-25";
        
    }
    if (sender.tag == 51) {
        self.liDu1.selected = NO;
        self.liDu2.selected = YES;
        self.liDu3.selected = NO;
        self.liDu4.selected = NO;
        self.liDu5.selected = NO;
        self.liDu6.selected = NO;
        self.liDu7.selected = NO;
        self.liDu8.selected = NO;
        self.liDu9.selected = NO;
        self.chiCunLbl.text = @"5-8";
        self.liDu =  @"5-8";


        
    }
    if (sender.tag == 52) {
        self.liDu1.selected = NO;
        self.liDu2.selected = NO;
        self.liDu3.selected = YES;
        self.liDu4.selected = NO;
        self.liDu5.selected = NO;
        self.liDu6.selected = NO;
        self.liDu7.selected = NO;
        self.liDu8.selected = NO;
        self.liDu9.selected = NO;
        self.chiCunLbl.text = @"13-25";
        self.liDu = @"13-25";


    }
    if (sender.tag == 53) {
        self.liDu1.selected = NO;
        self.liDu2.selected = NO;
        self.liDu3.selected = NO;
        self.liDu4.selected = YES;
        self.liDu5.selected = NO;
        self.liDu6.selected = NO;
        self.liDu7.selected = NO;
        self.liDu8.selected = NO;
        self.liDu9.selected = NO;
        self.chiCunLbl.text = @"13-30";
        self.liDu = @"13-30";


    }
    if (sender.tag == 54) {
        self.liDu1.selected = NO;
        self.liDu2.selected = NO;
        self.liDu3.selected = NO;
        self.liDu4.selected = NO;
        self.liDu5.selected = YES;
        self.liDu6.selected = NO;
        self.liDu7.selected = NO;
        self.liDu8.selected = NO;
        self.liDu9.selected = NO;
        self.chiCunLbl.text = @"25-50";
        self.liDu = @"25-50";

    }
    if (sender.tag == 55) {
        self.liDu1.selected = NO;
        self.liDu2.selected = NO;
        self.liDu3.selected = NO;
        self.liDu4.selected = NO;
        self.liDu5.selected = NO;
        self.liDu6.selected = YES;
        self.liDu7.selected = NO;
        self.liDu8.selected = NO;
        self.liDu9.selected = NO;
        self.chiCunLbl.text = @"35-60";
        self.liDu = @"35-60";
    }
    if (sender.tag == 56) {
        self.liDu1.selected = NO;
        self.liDu2.selected = NO;
        self.liDu3.selected = NO;
        self.liDu4.selected = NO;
        self.liDu5.selected = NO;
        self.liDu6.selected = NO;
        self.liDu7.selected = YES;
        self.liDu8.selected = NO;
        self.liDu9.selected = NO;
        self.chiCunLbl.text = @"35-80";
        self.liDu = @"35-80";

    }
    if (sender.tag == 57) {
        self.liDu1.selected = NO;
        self.liDu2.selected = NO;
        self.liDu3.selected = NO;
        self.liDu4.selected = NO;
        self.liDu5.selected = NO;
        self.liDu6.selected = NO;
        self.liDu7.selected = NO;
        self.liDu8.selected = YES;
        self.liDu9.selected = NO;
        self.chiCunLbl.text = @"45-90";
        self.liDu = @"45-90";


    }
    if (sender.tag == 58) {
        self.liDu1.selected = NO;
        self.liDu2.selected = NO;
        self.liDu3.selected = NO;
        self.liDu4.selected = NO;
        self.liDu5.selected = NO;
        self.liDu6.selected = NO;
        self.liDu7.selected = NO;
        self.liDu8.selected = NO;
        self.liDu9.selected = YES;
        self.chiCunLbl.text = @"---";
        self.haomi1.enabled = YES;
        self.haomi2.enabled = YES;
        self.liDu = @"0-25";



    }
    
    if (sender.tag == 60) {
        self.yaoqiu1.selected = YES;
        self.yaoQiu = self.yaoqiu1.titleLabel.text;
    }
    if (sender.tag == 61) {
        self.yaoqiu2.selected = YES;
        self.yaoQiu = self.yaoqiu2.titleLabel.text;

    }
    if (sender.tag == 62) {
        self.yaoqiu3.selected = YES;
        self.yaoQiu = self.yaoqiu3.titleLabel.text;

    }
    if (sender.tag == 63) {
        self.yaoqiu4.selected = YES;
        self.yaoQiu = self.yaoqiu4.titleLabel.text;

    }

    
}

//选择产地

- (IBAction)cangDiBtnClick:(id)sender {
    WKDiQuTableVC *diQuVC = [[WKDiQuTableVC alloc]init];
    [self.navigationController pushViewController:diQuVC animated:YES];
    
    
}

-(void)addBtnClick{
    //    煤炭名称
    NSString *coalName = self.coalNameText.text;
    //    产地
    NSString *cangDi = self.cangDi.text;
    
    
    //    销售价
    NSString *xiaoShouJia = self.xiaoShouJia.text;
    
    //    预计日供货量
    NSString *gongHuoLiang = self.gongHuoLiang.text;
    
//    
//    if (coalName.length == 0 ) {
//        
//        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请输入煤炭名称" message:nil preferredStyle:  UIAlertControllerStyleAlert];
//        
//        [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil        ]];
//        
//        //弹出提示框；
//        [self presentViewController:alert animated:true completion:nil];
//        
//    }
//    
//    
//    if (self.zongLei1.isSelected == NO && self.zongLei2.isSelected == NO && self.zongLei2.isSelected == NO){
//        [self alertTitle:@"请输入煤炭种类" andActionTitle:@"确认"];
//        
//    }
//    
//    if (self.yongTuBtn1.isSelected == NO && self.yongTuBtn2.isSelected == NO && self.yongTuBtn3.isSelected == NO){
//        
//        [self alertTitle:@"请输入煤炭用途" andActionTitle:@"确认"];
//        
//        
//    }
//    
//    
//    if (self.laiYuanBtn1.isSelected == NO && self.laiYuanBtn2.isSelected == NO && self.jiaGongBtn1.isSelected == NO && self.jiaGongBtn2.isSelected == NO){
//        [self alertTitle:@"请输入煤炭来源或加工" andActionTitle:@"确认"];
//        
//    }
//    if (self.jiaGongBtn1.isSelected == NO && self.jiaGongBtn2.isSelected == NO){
//        [self alertTitle:@"请输入煤炭来源或加工" andActionTitle:@"确认"];
//        
//    }
//    
//    
//    if (self.liDu1.isSelected == NO && self.liDu2.isSelected == NO && self.liDu3.isSelected == NO && self.liDu4.isSelected == NO && self.liDu5.isSelected == NO && self.liDu6.isSelected == NO && self.liDu7.isSelected == NO  && self.liDu8.isSelected == NO){
//        [self alertTitle:@"请选择煤炭粒度" andActionTitle:@"确认"];
//        
//    }
////    产地
//    if (cangDi.length == 0 ) {
//        [self alertTitle:@"请选择产地" andActionTitle:@"确认"];
//    }
////    销售价
//    if (xiaoShouJia.length == 0 ) {
//        [self alertTitle:@"请输入销售价" andActionTitle:@"确认"];
//    }
////预计日供货量
//    if (gongHuoLiang.length == 0 ) {
//        [self alertTitle:@"请输入预计日供货量" andActionTitle:@"确认"];
//    }
//
////    付款要求
//    if (self.yaoqiu1.isSelected == NO && self.yaoqiu2.isSelected == NO && self.yaoqiu3.isSelected == NO && self.yaoqiu4.isSelected == NO){
//        [self alertTitle:@"请选择付款要求" andActionTitle:@"确认"];
//        
//    }
////
//    
////    煤炭指标
//        if (self.zhibiao1.text.length == 0 && self.zhibiao2.text.length == 0 && self.zhibiao3.text.length == 0 && self.zhibiao4.text.length == 0 && self.zhibiao5.text.length == 0 ){
//            [self alertTitle:@"请完善煤炭指标" andActionTitle:@"确认"];
//    
//        }
//    //煤炭名称
//    @property (nonatomic, copy) NSString *coalName;
    NSString *coalName1 = self.coalNameText.text;
//    //煤炭种类
//    @property (nonatomic, copy) NSString *coalZongLei;
    NSString *coalZongLei = self.coalZongLei;
//
//    //煤炭用途
//    @property (nonatomic, copy) NSString *coalYongTu;
        NSString *coalYongTu = self.yongTu;

//
//    //煤炭来源
//    @property (nonatomic, copy) NSString *coalLaiYuan;
    NSString *coalLaiYuan = self.laiYuan;

//
//    //煤炭加工
//    @property (nonatomic, copy) NSString *coalJiaGong;
    NSString *coalJiaGong = self.jiaGong;

//
//    //选择粒度
//    @property (nonatomic, copy) NSString *coalLiDu;
    NSString *coalLiDu = self.liDu;

//
//    //产地
//    @property (nonatomic, copy) NSString *coalCangDi;
    NSString *coalCangDi = self.cangDi.text;

//
//    
//    //煤矿
//    @property (nonatomic, copy) NSString *coalMeiKuang;
    NSString *coalMeiKuang = self.meiKuang.text;

//
//    //销售价
//    @property (nonatomic, copy) NSString *coalXiaoShouJia;
    NSString *coalXiaoShouJia = self.xiaoShouJia.text;

//
//    
//    //预计日供货量
//    @property (nonatomic, copy) NSString *coalGongHuoLiang;
    NSString *coalGongHuoLiang = self.gongHuoLiang.text;

//
//    //付款要求
//
//    @property (nonatomic, copy) NSString *coalFuKuangYQ;
    NSString *coalFuKuangYQ = self.yaoQiu;

//    //热值
//    @property (nonatomic, copy) NSString *coalReZhi;
    NSString *coalReZhi = self.zhibiao1.text;

//
//    //氢含量
//    @property (nonatomic, copy) NSString *coalQingHanLiang;
    NSString *coalQingHanLiang = self.zhibiao2.text;

//
//    //挥发分
//    @property (nonatomic, copy) NSString *coalHuiFaFen;
    NSString *coalHuiFaFen = self.zhibiao3.text;

//
//    //全硫
//    @property (nonatomic, copy) NSString *coalQunLiu;
    NSString *coalQunLiu = self.zhibiao4.text;

//
//    //灰分
//    @property (nonatomic, copy) NSString *coalHuiFen;
    NSString *coalHuiFen = self.zhibiao5.text;

//
//    //全水分
//    @property (nonatomic, copy) NSString *coalQuanSuiFen;
    NSString *coalQuanSuiFen = self.zhibiao6.text;

//
//    //焦渣特性
//    
//    @property (nonatomic, copy) NSString *coalJiaoZaTeXing;
    NSString *coalJiaoZaTeXing = self.zhibiao7.text;

//    //固定碳
//    
//    @property (nonatomic, copy) NSString *coalGuDingTan;
    NSString *coalGuDingTan = self.zhibiao8.text;
 

    WKAddCoal *addCoal = [WKAddCoal contactWithcoalName:coalName1 coalZongLei:coalZongLei coalYongTu:coalYongTu coalLaiYuan:coalLaiYuan coalJiaGong:coalJiaGong coalLiDu:coalLiDu coalCangDi:coalCangDi coalMeiKuang:coalMeiKuang coalXiaoShouJia:coalXiaoShouJia coalGongHuoLiang:coalGongHuoLiang coalFuKuangYQ:coalFuKuangYQ coalReZhi:coalReZhi coalQingHanLiang:coalQingHanLiang coalHuiFaFen:coalHuiFaFen coalQunLiu:coalQunLiu coalHuiFen:coalHuiFen coalQuanSuiFen:coalQuanSuiFen coalJiaoZaTeXing:coalJiaoZaTeXing coalGuDingTan:coalGuDingTan];
    
    // 3.将模型数据传给列表控制器
    // MARK: - 3.让自己的代理对象执行协议方法 代理   好处: 解耦
    if ([self.delegate respondsToSelector:@selector(addController:wantToAddCoal:)]) {
        //
        [self.delegate addController:self wantToAddCoal:addCoal];
    }
    
    // 4.自己pop出去
    [self.navigationController popViewControllerAnimated:YES];
    
    
    

    
    
    
}

-(void)alertTitle:(NSString *)str andActionTitle:(NSString *)str2{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:str message:nil preferredStyle:  UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:str2 style:UIAlertActionStyleDefault handler:nil        ]];
    
    //弹出提示框；
    [self presentViewController:alert animated:true completion:nil];
    
    
    
}

@end
