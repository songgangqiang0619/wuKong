//
//  WKDetailCustomController.h
//  悟空
//
//  Created by 宋钢强 on 16/8/18.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WKAddCustom,WKDetailCustomController;

@protocol WKDetailCustomControllerDelegate <NSObject>

@optional

- (void)didFinishEditedContact:(WKDetailCustomController *)editVc;


@end


@interface WKDetailCustomController : UITableViewController
/**
 *  要被编辑的联系人
 */
@property (nonatomic, strong) WKAddCustom *editCt;

// 属性
@property (nonatomic, weak) id<WKDetailCustomControllerDelegate> delegate;
@end
