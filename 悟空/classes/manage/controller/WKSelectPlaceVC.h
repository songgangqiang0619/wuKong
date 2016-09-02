//
//  WKSelectPlaceVC.h
//  悟空
//
//  Created by 宋钢强 on 16/8/22.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import <UIKit/UIKit.h>

// MARK: - 1.指定协议
@class WKSelectPlaceVC,WKAddCustom;
@protocol WKSelectPlaceVCDelegate <NSObject>

@optional
- (void)addController:(WKSelectPlaceVC *)addVc wantToAddPlace:(WKAddCustom *)place;

@end


@interface WKSelectPlaceVC : UIViewController

// MAKR: - 2.代理属性
@property (nonatomic, weak) id<WKSelectPlaceVCDelegate> delegate;


@end
