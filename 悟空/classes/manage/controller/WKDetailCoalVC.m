//
//  WKDetailCoalVC.m
//  悟空
//
//  Created by 宋钢强 on 16/8/23.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WKDetailCoalVC.h"
#import "WKChangCoalCell.h"
#import "WKDetailCoalCell.h"
#import "WKPurchaseTableViewController.h"


@interface WKDetailCoalVC ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *detailTableView;
@property (nonatomic,strong) NSArray *plistArray;



@end

@implementation WKDetailCoalVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.detailTableView.delegate = self;
    self.detailTableView.dataSource = self;
    
    
}


- (IBAction)linkSeller:(id)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"确定联系供应商？" message:nil preferredStyle:  UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSString *number = @"400-109-1199";// 此处读入电话号码
        
        NSString *num = [[NSString alloc] initWithFormat:@"tel://%@",number]; //number为号码字符串 如果使用这个方法 结束电话之后会进入联系人列表
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:num]]; //拨号
        
    }]];
    //弹出提示框；
    [self presentViewController:alert animated:true completion:nil];

    
}

- (IBAction)purchasBtnClick {
    NSArray *viewArr = self.navigationController.viewControllers;
    
    [viewArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[WKPurchaseTableViewController class]]) {
            
            WKPurchaseTableViewController *obj1 = (WKPurchaseTableViewController *)obj;
            obj1.dic = self.infoDic;
            [self.navigationController popToViewController:obj1 animated:YES];
        }
    }];
    
//    vc.dic = self.infoDic;
//    [self.navigationController popToViewController:vc animated:YES];
}

#pragma mark - UITableView代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.plistArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSArray *rowArray = self.plistArray[section];
    
    return rowArray.count;
}

//
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WKDetailCoalCell *cell = [WKDetailCoalCell cellWithTableView:tableView andIndexPath:indexPath];
    NSArray *rowArray = self.plistArray[indexPath.section];
    NSDictionary *dic = rowArray[indexPath.row];
    
    if (indexPath.section == 0) {
        
        cell.coalNameLbl.text = dic[@"coalName"];
        cell.coalNumLbl.text = dic[@"coalNum"];
        cell.coalPriceLbl.text = dic[@"coalPrice"];
        cell.numLbl.text = dic[@"num"];
        
    }
    
    if (indexPath.section == 1 || indexPath.section == 2 ){
        
        cell.leftLbl.text = dic[@"leftLbl"];
        cell.rightLbl.text = dic[@"rightLbl"];
        
    }
    
    return cell;


}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        return 200;
        
    }
    
    return 44;
}

#pragma mark - 懒加载
-(NSArray *)plistArray{
    
    if (_plistArray == nil) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"changeCoal1" ofType:@"plist"];
        _plistArray = [NSArray arrayWithContentsOfFile:path];
    }
    
    return _plistArray;
}


@end
