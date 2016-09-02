//
//  WKManageController.m
//  悟空
//
//  Created by 宋钢强 on 16/8/9.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WKManageController.h"
#import "WKCoalListTableViewController.h"
#import "WKPurchaseTableViewController.h"
#import "WKSellTableViewController.h"
#import "WKCaiGouController.h"
#import "WKCoalListTableViewController.h"


@interface WKManageController ()
@property (nonatomic,strong) NSArray *plistArray;

@end

@implementation WKManageController
-(NSArray *)plistArray{
    
    if (_plistArray == nil) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"manage" ofType:@"plist"];
        _plistArray = [NSArray arrayWithContentsOfFile:path];
    }
    
    return _plistArray;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        return [super initWithStyle:UITableViewStyleGrouped];
    }
    return self;
}


#pragma mark - UITableView代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.plistArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSArray *rowArray = self.plistArray[section];
    
    return rowArray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    NSArray *rowArray = self.plistArray[indexPath.section];
    
    NSDictionary *dic = rowArray[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = dic[@"name"];
    cell.imageView.image = [UIImage imageNamed:dic[@"icon"]];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 70;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"WKCoalListTableViewController" bundle:nil];
        WKCoalListTableViewController *coalListVc = [sb instantiateInitialViewController];
        coalListVc.navigationItem.title = @"煤炭列表";
        [self.navigationController pushViewController:coalListVc animated:YES];
        
    }else if (indexPath.section == 1 && indexPath.row == 0){
        
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"WKPurchaseTableViewController" bundle:nil];
        WKPurchaseTableViewController *PurchaseVc = [sb instantiateInitialViewController];
        [self.navigationController pushViewController:PurchaseVc animated:YES];
        PurchaseVc.hidesBottomBarWhenPushed = YES;
        PurchaseVc.navigationItem.title = @"我要采购";
    
    }else if (indexPath.section == 2 && indexPath.row == 0) {
                  
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"敬请期待" message:nil preferredStyle:  UIAlertControllerStyleAlert];
        
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil        ]];
        
        //弹出提示框；
        [self presentViewController:alert animated:true completion:nil];
    }else if (indexPath.section == 3 && indexPath.row == 0){
    
        WKSellTableViewController *sellVC = [[WKSellTableViewController alloc] init];
        sellVC.hidesBottomBarWhenPushed = YES;
        sellVC.navigationItem.title = @"订单";
        [self.navigationController pushViewController:sellVC animated:YES];

    } else if (indexPath.section == 3 && indexPath.row == 1){
    
//        WKCaiGouController *caigouVC = [[WKCaiGouController alloc] init];
//        caigouVC.hidesBottomBarWhenPushed = YES;
//        caigouVC.navigationItem.title = @"订单";
//        [self.navigationController pushViewController:caigouVC animated:YES];
    
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"WKCaiGou" bundle:nil];
        WKCaiGouController *PurchaseVc = [sb instantiateInitialViewController];
        
        [self.navigationController pushViewController:PurchaseVc animated:YES];
        PurchaseVc.hidesBottomBarWhenPushed = YES;
        

    
    
    }
    
    
}


@end
