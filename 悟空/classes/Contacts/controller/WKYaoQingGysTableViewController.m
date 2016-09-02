//
//  WKYaoQingGysTableViewController.m
//  悟空
//
//  Created by 宋钢强 on 16/8/16.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WKYaoQingGysTableViewController.h"
#import "WKJiLuTableVC.h"



@interface WKYaoQingGysTableViewController ()

@end

@implementation WKYaoQingGysTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.navigationItem.title = @"邀请供应商";
    self.tableView.tableFooterView = [[UIView alloc]init];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"我的邀请记录" style:UIBarButtonItemStylePlain target:self action:@selector(addSupplier)];
    
    
}



- (void)addSupplier{
    
    WKJiLuTableVC *JiLuVC = [[WKJiLuTableVC alloc]init];
    [self.navigationController pushViewController:JiLuVC animated:YES];

    
    
//    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"WKGoToAddSupplierTableView" bundle:nil];
//    WKGoToAddViewController *vc = [sb instantiateInitialViewController];
//    
//    [self.navigationController pushViewController:vc animated:YES];
    
    
    
}






@end
