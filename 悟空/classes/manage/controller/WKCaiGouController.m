//
//  WKCaiGouController.m
//  悟空
//
//  Created by 宋钢强 on 16/8/22.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WKCaiGouController.h"
#import "WKPurchaseTableViewController.h"
#import "WKCoalListCell.h"
#import "WKCaiGouCell.h"

@interface WKCaiGouController ()
@property (nonatomic, strong) UIView *popView;

@property (nonatomic,strong) NSArray *plistArray;

@end

@implementation WKCaiGouController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightItemClick)];
    self.navigationItem.rightBarButtonItem = addBtn;
}

-(void)rightItemClick{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(250, 0, 120, 45)];
    self.popView = view;
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 120, 45)];
    imgView.image = [UIImage imageNamed:@"煤炭列表－添加底"];
    view.backgroundColor = [UIColor whiteColor];
    
    //    我要采购
    //    UIButton *purchaseBtn =
    UIButton *purchaseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //    popBtn.backgroundColor = [UIColor redColor];
    purchaseBtn.frame = CGRectMake(0, 0, 120, 40);
    [purchaseBtn setTitle:@"我要采购" forState:UIControlStateNormal];
    [purchaseBtn addTarget:self action:@selector(purchaseBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    [view addSubview:imgView];
    [view addSubview:purchaseBtn];
    
    
    
    
    [self.view addSubview:view];
    
}

//我要采购
-(void)purchaseBtnClick{
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"WKPurchaseTableViewController" bundle:nil];
    WKPurchaseTableViewController *PurchaseVc = [sb instantiateInitialViewController];
    
    [self.navigationController pushViewController:PurchaseVc animated:YES];
    
    
    [self.popView removeFromSuperview];
    
}


#pragma mark - 数据源

-(NSArray *)plistArray{
    
    if (_plistArray == nil) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"caiGouList1" ofType:@"plist"];
        _plistArray = [NSArray arrayWithContentsOfFile:path];
    }
    
    return _plistArray;
}



#pragma mark - UITableView代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.plistArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
//    return 1;
//    return self.plistArray.count;
//
    NSArray *rowArray = self.plistArray[section];
    
    return rowArray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WKCaiGouCell *cell = [WKCaiGouCell cellWithTableView:tableView];
    
    NSArray *rowArray = self.plistArray[indexPath.section];
    NSDictionary *dic = rowArray[indexPath.row];
    //采购编号
    cell.caiGouNumLbl.text = dic[@"CaiGouNum"];

//    //下单时间
    cell.xiaDanTimeLbl.text = dic[@"xiaDanTime"];
//    //煤名称
    cell.coalNameLbl.text = dic[@"coalName"];

//    //煤种
    cell.coalLeiLbl.text = dic[@"coalLei"];

//    //产地
//    @property (nonatomic, copy) NSString *coalPlace;
    cell.coalPlaceLbl.text = dic[@"coalPlace"];

//    //热量
    cell.reLiangLbl.text = dic[@"reLiang"];

//
//    //客户订单信息
//    @property (nonatomic, copy) NSString *customListMessage;
//    cell.customListMessage.text = dic[@"customListMessage"];

//
//    //收货厂家
    cell.shouHouCJLbl.text = dic[@"shouHouCJ"];

//    //收货地址
    cell.shouHouPlaceLbl.text = dic[@"shouHouPlace"];

//    //客户联系人名称
            cell.keHulinkNameLbl.text = dic[@"keHulinkName"];

//    //购买数量
    cell.keHubuyCountLbl.text = dic[@"keHubuyCount"];

//
//    //供应商采购订单信息
//    @property (nonatomic, copy) NSString *gysCaiGouListMessage;
//    cell.gysCaiGouListMessagel.text = dic[@"gysCaiGouListMessage"];

//    //支付方式
    cell.payMethodLbl.text = dic[@"payMethod"];

//    //发货厂家
    cell.faHuoCangJiaLbl.text = dic[@"faHuoCangJia"];

//    //发货地址
    cell.faHuoPlaceLbl.text = dic[@"faHuoPlace"];

//    //供应商联系人名称
    cell.gysLinkNameLbl.text = dic[@"gysLinkName"];

//    //找车运费
    cell.zhaoCheMoneyLbl.text = dic[@"zhaoCheMoney"];

//    //购买数量
    cell.gysbuyCountLbl.text = dic[@"gysbuyCount"];

//    //供应价格
    cell.gongYingJiaGeLbl.text = dic[@"gongYingJiaGe"];

//    //订单总煤价
    cell.dingDanTotalMoneyLbl.text = dic[@"dingDanTotalMoney"];

//    //代发货
    cell.daiFaHuoLbl.text = dic[@"daiFaHuo"];

//    //已发货
    cell.yiFaHuoLbl.text = dic[@"yiFaHuo"];

//    //已收货
    cell.yiShouHuoLbl.text = dic[@"yiShouHuo"];

//    //已拒收
    cell.yiJuShouLbl.text = dic[@"yiJuShou"];

//    //状态
    cell.statusLbl.text = dic[@"status"];

//


    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 478;
}




@end
