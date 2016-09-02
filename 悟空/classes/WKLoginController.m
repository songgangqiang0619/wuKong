//
//  WKLoginController.m
//  悟空
//
//  Created by 宋钢强 on 16/8/10.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WKLoginController.h"
#import "WKLoginViewController.h"
@interface WKLoginController ()

@end

@implementation WKLoginController

- (void)viewDidLoad {
    [super viewDidLoad];


    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"login" bundle:nil];
    WKLoginViewController *vc = [sb instantiateInitialViewController];
    
    self.navigationItem.title = @"登录";

    [self addChildViewController:vc];

    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];



}



@end
