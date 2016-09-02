//
//  WKCaiGouCell.h
//  悟空
//
//  Created by 宋钢强 on 16/8/25.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WKCaiGouCell : UITableViewCell


//采购编号
@property (nonatomic, copy) NSString *CaiGouNum;
@property (weak, nonatomic) IBOutlet UILabel *caiGouNumLbl;


//下单时间
@property (nonatomic, copy) NSString *xiaDanTime;
@property (weak, nonatomic) IBOutlet UILabel *xiaDanTimeLbl;


//煤名称
@property (nonatomic, copy) NSString *coalName;
@property (weak, nonatomic) IBOutlet UILabel *coalNameLbl;


//煤种
@property (nonatomic, copy) NSString *coalLei;
@property (weak, nonatomic) IBOutlet UILabel *coalLeiLbl;


//产地
@property (nonatomic, copy) NSString *coalPlace;
@property (weak, nonatomic) IBOutlet UILabel *coalPlaceLbl;


//热量
@property (nonatomic, copy) NSString *reLiang;
@property (weak, nonatomic) IBOutlet UILabel *reLiangLbl;


//客户订单信息
@property (nonatomic, copy) NSString *customListMessage;


//收货厂家
@property (nonatomic, copy) NSString *shouHouCJ;
@property (weak, nonatomic) IBOutlet UILabel *shouHouCJLbl;


//收货地址
@property (nonatomic, copy) NSString *shouHouPlace;
@property (weak, nonatomic) IBOutlet UILabel *shouHouPlaceLbl;


//客户联系人名称
@property (nonatomic, copy) NSString *keHulinkName;
@property (weak, nonatomic) IBOutlet UILabel *keHulinkNameLbl;


//购买数量
@property (nonatomic, copy) NSString *keHubuyCount;

@property (weak, nonatomic) IBOutlet UILabel *keHubuyCountLbl;

//供应商采购订单信息
@property (nonatomic, copy) NSString *gysCaiGouListMessage;


//支付方式
@property (nonatomic, copy) NSString *payMethod;
@property (weak, nonatomic) IBOutlet UILabel *payMethodLbl;


//发货厂家
@property (nonatomic, copy) NSString *faHuoCangJia;
@property (weak, nonatomic) IBOutlet UILabel *faHuoCangJiaLbl;


//发货地址
@property (nonatomic, copy) NSString *faHuoPlace;
@property (weak, nonatomic) IBOutlet UILabel *faHuoPlaceLbl;


//供应商联系人名称
@property (nonatomic, copy) NSString *gysLinkName;
@property (weak, nonatomic) IBOutlet UILabel *gysLinkNameLbl;


//找车运费
@property (nonatomic, copy) NSString *zhaoCheMoney;
@property (weak, nonatomic) IBOutlet UILabel *zhaoCheMoneyLbl;


//购买数量
@property (nonatomic, copy) NSString *gysbuyCount;
@property (weak, nonatomic) IBOutlet UILabel *gysbuyCountLbl;


//供应价格
@property (nonatomic, copy) NSString *gongYingJiaGe;
@property (weak, nonatomic) IBOutlet UILabel *gongYingJiaGeLbl;


//订单总煤价
@property (nonatomic, copy) NSString *dingDanTotalMoney;
@property (weak, nonatomic) IBOutlet UILabel *dingDanTotalMoneyLbl;


//代发货
@property (nonatomic, copy) NSString *daiFaHuo;
@property (weak, nonatomic) IBOutlet UILabel *daiFaHuoLbl;


//已发货
@property (nonatomic, copy) NSString *yiFaHuo;
@property (weak, nonatomic) IBOutlet UILabel *yiFaHuoLbl;


//已收货
@property (nonatomic, copy) NSString *yiShouHuo;
@property (weak, nonatomic) IBOutlet UILabel *yiShouHuoLbl;


//已拒收
@property (nonatomic, copy) NSString *yiJuShou;
@property (weak, nonatomic) IBOutlet UILabel *yiJuShouLbl;


//状态
@property (nonatomic, copy) NSString *status;
@property (weak, nonatomic) IBOutlet UILabel *statusLbl;


// 传入tableView来创建cell
+ (instancetype)cellWithTableView:(UITableView *)tableView;





@end
