//
//  WKAddCoalTableViewController.h
//  悟空
//
//  Created by 宋钢强 on 16/8/16.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import <UIKit/UIKit.h>

// MARK: - 1.指定协议
@class WKAddCoalTableViewController, WKAddCoal;
@protocol WKAddCoalTableViewControllerDelegate <NSObject>

@optional
/**
 *  添加联系人方法
 *
 *  @param addVc 添加控制器
 *  @param addCt 要添加的联系人
 */
- (void)addController:(WKAddCoalTableViewController *)addVc wantToAddCoal:(WKAddCoal *)addCt;

@end


@interface WKAddCoalTableViewController : UITableViewController
// MAKR: - 2.代理属性
@property (nonatomic, weak) id<WKAddCoalTableViewControllerDelegate> delegate;


@end
