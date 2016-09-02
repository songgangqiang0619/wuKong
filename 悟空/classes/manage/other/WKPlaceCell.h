//
//  WKPlaceCell.h
//  悟空
//
//  Created by 宋钢强 on 16/8/29.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WKPlaceCell : UITableViewCell
//公司名称
@property (weak, nonatomic) IBOutlet UILabel *comName;
//公司地址
@property (weak, nonatomic) IBOutlet UILabel *comPlace;


// 传入tableView来创建cell
+ (instancetype)cellWithTableView:(UITableView *)tableView andIndexPath:(NSIndexPath *)indexpath;


@end
