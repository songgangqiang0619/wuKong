//
//  WKDetailCoalCell.m
//  悟空
//
//  Created by 宋钢强 on 16/8/25.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WKDetailCoalCell.h"

@implementation WKDetailCoalCell

+ (instancetype)cellWithTableView:(UITableView *)tableView andIndexPath:(NSIndexPath *)indexpath{
    
    static NSString *identifier = nil;
    if (indexpath.section == 0) {
        identifier = @"header";
        
    }
//    
    if (indexpath.section == 1 || indexpath.section == 2 || indexpath.section == 3) {
        identifier = @"base";
        
    
    }
    
    
    
    return [tableView dequeueReusableCellWithIdentifier:identifier];
}


@end
