//
//  WKChangCoalCell.m
//  悟空
//
//  Created by 宋钢强 on 16/8/25.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WKChangCoalCell.h"

@implementation WKChangCoalCell


/**
 *  快速创建cell的方法
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    static NSString *ID = @"changeCoal";
    WKChangCoalCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    return cell;
    
}

@end
