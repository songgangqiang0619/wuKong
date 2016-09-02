//
//  WKCustomCell.h
//  悟空
//
//  Created by 宋钢强 on 16/8/18.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WKAddCustom;
@interface WKCustomCell : UITableViewCell
/**
 *  快速创建cell的方法
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) WKAddCustom *modelContact;

@end
