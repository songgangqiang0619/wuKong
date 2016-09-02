//
//  WKDetailCoalCell.h
//  悟空
//
//  Created by 宋钢强 on 16/8/25.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WKDetailCoalCell : UITableViewCell

//煤炭名称
@property (weak, nonatomic) IBOutlet UILabel *coalNameLbl;


//煤炭编号
@property (weak, nonatomic) IBOutlet UILabel *coalNumLbl;

//煤炭价
@property (weak, nonatomic) IBOutlet UILabel *coalPriceLbl;

//售出吨数
@property (weak, nonatomic) IBOutlet UILabel *numLbl;

@property (weak, nonatomic) IBOutlet UILabel *leftLbl;


@property (weak, nonatomic) IBOutlet UILabel *rightLbl;




// 传入tableView来创建cell
+ (instancetype)cellWithTableView:(UITableView *)tableView andIndexPath:(NSIndexPath *)indexpath;



@end
