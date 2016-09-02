//
//  WKCoalDetailCell.h
//  悟空
//
//  Created by 宋钢强 on 16/8/24.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WKCoalDetailCell : UITableViewCell

//煤炭名称
@property (weak, nonatomic) IBOutlet UILabel *coalNameLbl;
//煤炭名称
@property (weak, nonatomic) IBOutlet UILabel *coalNameLblRight;
//煤炭用途
@property (weak, nonatomic) IBOutlet UILabel *yongTuLbl;

//煤炭来源
@property (weak, nonatomic) IBOutlet UILabel *laiYuanLbl;

//煤炭加工
@property (weak, nonatomic) IBOutlet UILabel *jaiGongLbl;

//煤矿
@property (weak, nonatomic) IBOutlet UILabel *meiKuang;

//日供货量
@property (weak, nonatomic) IBOutlet UILabel *gongHuoLiang;

//发货地点
@property (weak, nonatomic) IBOutlet UILabel *faHuoPlace;



//煤炭编号
@property (weak, nonatomic) IBOutlet UILabel *coalNumLbl;

//煤炭价
@property (weak, nonatomic) IBOutlet UILabel *coalPriceLbl;

//售出吨数
@property (weak, nonatomic) IBOutlet UILabel *numLbl;

@property (weak, nonatomic) IBOutlet UILabel *leftLbl;


@property (weak, nonatomic) IBOutlet UILabel *rightLbl;

//多少家客户购买了
@property (weak, nonatomic) IBOutlet UILabel *customNum;


// 传入tableView来创建cell
+ (instancetype)cellWithTableView:(UITableView *)tableView andIndexPath:(NSIndexPath *)indexpath;



@end
