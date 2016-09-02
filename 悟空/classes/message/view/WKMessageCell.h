//
//  WKMessageCell.h
//  悟空
//
//  Created by 宋钢强 on 16/8/15.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WKMessage;
@interface WKMessageCell : UITableViewCell

@property (nonatomic, strong) WKMessage *message;
// 传入tableView来创建cell
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
