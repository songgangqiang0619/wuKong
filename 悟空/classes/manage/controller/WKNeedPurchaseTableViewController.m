//
//  WKNeedPurchaseTableViewController.m
//  悟空
//
//  Created by 宋钢强 on 16/8/15.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WKNeedPurchaseTableViewController.h"
#import "WKChangeCoalListViewController.h"


@interface WKNeedPurchaseTableViewController ()

@end

@implementation WKNeedPurchaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我要采购";
    
    
}

- (IBAction)shaiXuanBtnClick:(id)sender {
    
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"WKChangCoalList" bundle:nil];
    WKChangeCoalListViewController *changCoal = [sb instantiateInitialViewController];
    
    [self.navigationController pushViewController:changCoal animated:YES];

    
    
}


@end
