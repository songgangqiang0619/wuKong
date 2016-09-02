//
//  WKCoalListCell.m
//  悟空
//
//  Created by 宋钢强 on 16/8/22.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WKCoalListCell.h"
#import "WKCoalList.h"
#import "WKAddCoal.h"
@interface WKCoalListCell ()


@end

@implementation WKCoalListCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    return [tableView dequeueReusableCellWithIdentifier:@"coalList"];
}

-(void)setCoalList:(WKAddCoal *)coalList{
    _coalList = coalList;

    self.coalName.text = coalList.coalName;
    self.numLbl.text = @"0";
    self.statusLbl.text = @"上架中";
    self.liduLbl.text = coalList.coalLiDu;
    self.coalLeiLbl.text = coalList.coalZongLei;
    self.coalPlaceLbl.text = coalList.coalCangDi;
    
    self.reZhiLbl.text = coalList.coalReZhi;
    self.liuLbl.text = coalList.coalQunLiu;
    self.waterLbl.text = coalList.coalQuanSuiFen;
    self.huiFenLbl.text = coalList.coalHuiFaFen;
    self.qingLbl.text = coalList.coalQingHanLiang;
    self.coalPriceLbl.text = coalList.coalXiaoShouJia;


}

@end
