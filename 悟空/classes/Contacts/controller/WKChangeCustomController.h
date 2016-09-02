//
//  WKChangeCustomController.h
//  悟空
//
//  Created by 宋钢强 on 16/8/19.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WKAddCustom,WKChangeCustomController;

@protocol WKChangeCustomControllerDelegate <NSObject>

@optional

- (void)didFinishEditedContact:(WKChangeCustomController *)editVc;


@end

@interface WKChangeCustomController : UITableViewController

/**
 *  要被编辑的联系人
 */
@property (nonatomic, strong) WKAddCustom *editCt;

// 属性
@property (nonatomic, weak) id<WKChangeCustomControllerDelegate> delegate;


@end
