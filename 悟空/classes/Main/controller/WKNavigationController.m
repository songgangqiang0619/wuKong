//
//  WKNavigationController.m
//  悟空
//
//  Created by 宋钢强 on 16/8/9.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WKNavigationController.h"

@interface WKNavigationController ()

@end

@implementation WKNavigationController

/**
 *  这个方法,是系统在第一次初始化这个类的时候调用,并且只调用一次.
 */
+ (void)initialize {
    
    NSLog(@"加载导航控制器");
    // MARK: - 设置导航栏的背景
    // 外观代理对象 proxy 代理
    // 获取导航条的外观代理对象
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    // 1.设置背景图片
    [navBar setBackgroundImage:[UIImage imageNamed:@"查看指标灰"] forBarMetrics:UIBarMetricsDefault];
    
    // 2.设置导航栏的标题
    [navBar setTitleTextAttributes:@{
                                     NSForegroundColorAttributeName : [UIColor whiteColor]
                                     }];
    
    // 3.设置两侧按钮的颜色
    [navBar setTintColor:[UIColor whiteColor]];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
