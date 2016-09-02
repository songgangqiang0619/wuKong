//
//  WKPurchaseCell.h
//  悟空
//
//  Created by 宋钢强 on 16/8/24.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WKPurchaseCell : UITableViewCell

//base
@property (weak, nonatomic) IBOutlet UILabel *nameLbl;

//采购车数
@property (weak, nonatomic) IBOutlet UILabel *caigouLbl;
//支付 zhifu
@property (weak, nonatomic) IBOutlet UILabel *zhifuLbl;

//预留电话、收货方式 yuliuDianHua
@property (weak, nonatomic) IBOutlet UILabel *yuliuDianHuaLbl;

//是否需要煤检票  isNeed

//把这个换到余额里

//我的留言  mineLiuYan

@property (weak, nonatomic) IBOutlet UILabel *mineLiuYanLbl;

//找车运费  zhaoCheYunFei
@property (weak, nonatomic) IBOutlet UILabel *zhaoCheYunFeiLbl;


//使用余额  yuE
@property (weak, nonatomic) IBOutlet UILabel *yuELbl;

//最后一组  last   lastR
@property (weak, nonatomic) IBOutlet UILabel *lastLbl;

@property (weak, nonatomic) IBOutlet UILabel *lastRLbl;

//收货厂家中的公司名称
@property (weak, nonatomic) IBOutlet UILabel *shouHuoComName;

//收货厂家中的公司地址
@property (weak, nonatomic) IBOutlet UILabel *shouHuoComPlace;




// 传入tableView来创建cell
+ (instancetype)cellWithTableView:(UITableView *)tableView andIndexPath:(NSIndexPath *)indexpath;



@end
