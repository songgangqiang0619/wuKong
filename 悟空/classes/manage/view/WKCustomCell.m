//
//  WKCustomCell.m
//  悟空
//
//  Created by 宋钢强 on 16/8/18.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WKCustomCell.h"
#import "WKAddCustom.h"

@interface WKCustomCell ()

@property (nonatomic, strong) UIButton *btn;

@end

@implementation WKCustomCell

/**
 *  快速创建cell的方法
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    static NSString *ID = @"contact";
    WKCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"通讯录－电话"]];
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//
//    [btn setImage:[UIImage imageNamed:@"通讯录－电话"] forState:UIControlStateNormal];
//    btn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 68, 10, 80, 48);
//    

    
    ////    [btn addTarget:self action:@selector(callPhone) forControlEvents:UIControlEventTouchUpInside];
//    
//    [cell addSubview:btn];
    
    
    return cell;
    
}


-(void)callPhone{


}

#pragma mark - 重写set方法分发数据

-(void)setModelContact:(WKAddCustom *)modelContact{
    
        _modelContact = modelContact;
    
        // 姓名
        self.textLabel.text = modelContact.companyName;

}

@end
