//
//  WKPurchaseCell.m
//  悟空
//
//  Created by 宋钢强 on 16/8/24.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WKPurchaseCell.h"

@implementation WKPurchaseCell

+ (instancetype)cellWithTableView:(UITableView *)tableView andIndexPath:(NSIndexPath *)indexpath{
    
//        static NSString *identifier = @"baseCell";

    static NSString *identifier = nil;
    if (indexpath.section == 0 ) {
        identifier =  @"baseCell";
        
    }
    if (indexpath.section == 1) {
        identifier = @"baseCell1";
        
    }

    
    if (indexpath.section == 2) {
        identifier = @"BuyCountCell";
        
    }
    if (indexpath.section == 3) {
        identifier = @"PayCell";
        
    }
    if (indexpath.section == 4) {
        identifier = @"PhoneCell";
        
    }
    if (indexpath.section == 5) {
        identifier = @"shouHuoCell";
        
    }
    if (indexpath.section == 6) {
        identifier = @"isNeedcell";
        
    }

    if (indexpath.section == 7) {
        identifier = @"LiuYanCell";
        
    }
    if (indexpath.section == 8) {
        identifier = @"MoneyCell";
        
    }
    if (indexpath.section == 9) {
        identifier = @"yuEcell";
        
    }
    if (indexpath.section == 10 && indexpath.row == 0  ) {
        identifier = @"LastCell";
        
    }
    if (indexpath.section == 10 && indexpath.row == 1  ) {
        identifier = @"LastCell1";
        
    }
    if (indexpath.section == 10 && indexpath.row == 2  ) {
        identifier = @"LastCell2";
        
    }
    if (indexpath.section == 10 && indexpath.row == 3  ) {
        identifier = @"LastCell3";
        
    }
    if (indexpath.section == 10 && indexpath.row == 4  ) {
        identifier = @"LastCell4";
        
    }
//    if (indexpath.section == 11) {
//        identifier = @"BuyCountCell";
//        
//    }

    
    return [tableView dequeueReusableCellWithIdentifier:identifier];
}



@end
