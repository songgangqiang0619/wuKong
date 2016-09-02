//
//  WKCaiGouCell.m
//  悟空
//
//  Created by 宋钢强 on 16/8/25.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WKCaiGouCell.h"

@implementation WKCaiGouCell
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    return [tableView dequeueReusableCellWithIdentifier:@"caiGouCell"];
}

@end
