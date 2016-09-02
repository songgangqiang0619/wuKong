//
//  WKCoalDetailCell.m
//  悟空
//
//  Created by 宋钢强 on 16/8/24.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WKCoalDetailCell.h"

@implementation WKCoalDetailCell

+ (instancetype)cellWithTableView:(UITableView *)tableView andIndexPath:(NSIndexPath *)indexpath{
    
    static NSString *identifier = nil;
    if (indexpath.section == 0) {
        identifier = @"first";
        
    }
    
    if (indexpath.section == 1 && indexpath.row == 0) {
        identifier = @"second1";
        
    }
    
    if (indexpath.section == 1 && indexpath.row == 1) {
        identifier = @"second2";
        
    }

    
    if (indexpath.section == 1 && indexpath.row == 2) {
        identifier = @"second3";
        
    }
    
    if (indexpath.section == 1 && indexpath.row == 3) {
        identifier = @"second4";
        
    }
    
    if (indexpath.section == 1 && indexpath.row == 4) {
        identifier = @"second5";
        
    }
    
    if (indexpath.section == 1 && indexpath.row == 5) {
        identifier = @"second6";
        
    }
    
    if (indexpath.section == 1 && indexpath.row == 6) {
        identifier = @"second7";
        
    }
    
    if (indexpath.section == 1 && indexpath.row == 7) {
        identifier = @"second8";
        
    }
    
    if (indexpath.section == 2) {
        identifier = @"third";
        
    }
    
    if (indexpath.section == 3) {
        identifier = @"forth";
        
    }
    return [tableView dequeueReusableCellWithIdentifier:identifier];
}





@end
