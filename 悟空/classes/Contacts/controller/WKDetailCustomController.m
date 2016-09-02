//
//  WKDetailCustomController.m
//  悟空
//
//  Created by 宋钢强 on 16/8/18.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WKDetailCustomController.h"
#import "WKAddCustomController.h"
#import "WKAddCustom.h"
#import "WKChangeCustomController.h"


@interface WKDetailCustomController ()
//联系人
@property (weak, nonatomic) IBOutlet UILabel *name;
//联系电话
@property (weak, nonatomic) IBOutlet UILabel *phoneNum;

//公司地址
@property (weak, nonatomic) IBOutlet UILabel *location;

//公司行业
@property (weak, nonatomic) IBOutlet UILabel *hangYe;

//日用量
@property (weak, nonatomic) IBOutlet UILabel *num;

@end

@implementation WKDetailCustomController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"客户详情";
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"通讯录－电话"] style:UIBarButtonItemStylePlain target:self action:@selector(doTel)];
    
    
    // MARK: - 设置数据
    self.name.text = self.editCt.name;
    self.phoneNum.text = self.editCt.phoneNumber;
    self.location.text = self.editCt.loaction;
    self.hangYe.text = self.editCt.hangYe;
    self.num.text = self.editCt.num;
    

    
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 44)];
    
    footerView.backgroundColor = [UIColor greenColor];
    self.tableView.tableFooterView = footerView;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, self.view.bounds.size.width, footerView.bounds.size.height);
    [btn setTitle:@"完善信息" forState:UIControlStateNormal];

    [btn addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [footerView addSubview:btn];
    
}

-(void)sureBtnClick{

    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"WKChangeCustomController" bundle:nil];
    WKChangeCustomController *vc = [sb instantiateInitialViewController];
    
    [self.navigationController pushViewController:vc animated:YES];

    


}

-(void)doTel{

    NSLog(@"shuchu");

}

@end
