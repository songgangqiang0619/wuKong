//
//  WKPlaceCell.m
//  悟空
//
//  Created by 宋钢强 on 16/8/29.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WKPlaceCell.h"

@implementation WKPlaceCell


+ (instancetype)cellWithTableView:(UITableView *)tableView andIndexPath:(NSIndexPath *)indexpath{
    
    static NSString *identifier = @"place";
    
    return [tableView dequeueReusableCellWithIdentifier:identifier];
}


@end
