//
//  WKSupplierViewController.m
//  悟空
//
//  Created by 宋钢强 on 16/8/16.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WKSupplierViewController.h"
#import "WKGoToAddViewController.h"
#import "WKYaoQingGysTableViewController.h"


@interface WKSupplierViewController ()
@property (weak, nonatomic) IBOutlet UIView *supplierView;

@end

@implementation WKSupplierViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"客户";
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"添加平台供应商" style:UIBarButtonItemStylePlain target:self action:@selector(addSupplier)];
    UITapGestureRecognizer *tapGeture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goDo:)];
    [self.supplierView addGestureRecognizer:tapGeture];
    

    

}


-(void)goDo:(UITapGestureRecognizer *)recognizer{
    
    UIStoryboard *sbYQ = [UIStoryboard storyboardWithName:@"WKYaoQingGysTableViewController" bundle:nil];
    WKYaoQingGysTableViewController *sbYQvc = [sbYQ instantiateInitialViewController];
    
    [self.navigationController pushViewController:sbYQvc animated:YES];
    
}

- (void)addSupplier{
    
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"WKGoToAddSupplierTableView" bundle:nil];
    WKGoToAddViewController *vc = [sb instantiateInitialViewController];
    
    [self.navigationController pushViewController:vc animated:YES];
    
    
    
}

@end
