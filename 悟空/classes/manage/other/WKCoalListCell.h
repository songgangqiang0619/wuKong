//
//  WKCoalListCell.h
//  悟空
//
//  Created by 宋钢强 on 16/8/22.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WKAddCoal;

@interface WKCoalListCell : UITableViewCell

//煤炭名称
//@property (nonatomic, copy) NSString *coalName;
@property (weak, nonatomic) IBOutlet UILabel *coalName;

//售出吨数
//@property (nonatomic, assign) NSNumber *num;
@property (weak, nonatomic) IBOutlet UILabel *numLbl;

//状态
//@property (nonatomic, copy) NSString *status;
@property (weak, nonatomic) IBOutlet UILabel *statusLbl;


//粒度
//@property (nonatomic, assign) NSNumber *lidu;
@property (weak, nonatomic) IBOutlet UILabel *liduLbl;

//煤种
//@property (nonatomic, copy) NSString *coalLei;
@property (weak, nonatomic) IBOutlet UILabel *coalLeiLbl;

//产地
//@property (nonatomic, copy) NSString *coalPlace;
@property (weak, nonatomic) IBOutlet UILabel *coalPlaceLbl;

//热值
//@property (nonatomic, assign) NSNumber* reZhi;
@property (weak, nonatomic) IBOutlet UILabel *reZhiLbl;

//硫
//@property (nonatomic, assign) NSNumber *liu;
@property (weak, nonatomic) IBOutlet UILabel *liuLbl;

//水分
//@property (nonatomic, assign) NSNumber *water;
@property (weak, nonatomic) IBOutlet UILabel *waterLbl;

//灰分
//@property (nonatomic, assign) NSNumber *huiFen;
@property (weak, nonatomic) IBOutlet UILabel *huiFenLbl;

//氢
//@property (nonatomic, assign) NSNumber *qing;
@property (weak, nonatomic) IBOutlet UILabel *qingLbl;

//煤炭价
//@property (nonatomic, assign) NSNumber *coalPrice;
@property (weak, nonatomic) IBOutlet UILabel *coalPriceLbl;




@property (nonatomic, strong) WKAddCoal *coalList;
// 传入tableView来创建cell
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
