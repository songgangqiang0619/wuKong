//
//  WKMessageController.m
//  悟空
//
//  Created by 宋钢强 on 16/8/9.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WKMessageController.h"
#import "Masonry.h"
#import "WKAddCustomController.h"
#import "WKNeedPurchaseTableViewController.h"
#import "WKAddCoalTableViewController.h"
#import "WKPurchaseTableViewController.h"
#import "WKMessageCell.h"
#import "WKMessage.h"
#import "MJExtension.h"


@interface WKMessageController ()
//@property (nonatomic,strong) NSArray *plistArray;
@property (nonatomic, strong) NSMutableArray *plistArray1;
@property (nonatomic, strong) UIView *popView;
@property (strong, nonatomic) IBOutlet UITableView *myTableView;

@property (nonatomic, strong) NSArray *locData;

@end

@implementation WKMessageController

- (NSArray *)locData {
    
    if (!_locData) {

//        NSData *JSONData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"address" ofType:@"json"]];
        
//        NSArray *dataArray = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingAllowFragments error:nil];
        
        NSMutableArray *newArray = [NSMutableArray array];
        
//        for (NSDictionary *dict in dataArray) {
////            MJExtension *ext = [MJExtension
//
//            
//        }
        
        _locData = newArray;
        
    }
    
    return _locData;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = _myTableView;
    
    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightItemClick)];
    
    self.navigationItem.rightBarButtonItem = addBtn;
    [self plistArray1];

    
}
-(void)rightItemClick{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(250, 0, 120, 170)];
    self.popView = view;
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 120, 160)];
    imgView.image = [UIImage imageNamed:@"煤炭列表－添加底"];
    view.backgroundColor = [UIColor whiteColor];

    //添加客户
    UIButton *addCustomBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    popBtn.backgroundColor = [UIColor redColor];
    addCustomBtn.frame = CGRectMake(0, 10, 120, 40);
    [addCustomBtn setTitle:@"添加客户" forState:UIControlStateNormal];
    [addCustomBtn addTarget:self action:@selector(tapClick) forControlEvents:UIControlEventTouchUpInside];

    
//    委托推广
//    UIButton *delegateBtn =
    UIButton *delegateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //    popBtn.backgroundColor = [UIColor redColor];
    delegateBtn.frame = CGRectMake(0, 48, 120, 40);
    [delegateBtn setTitle:@"委托推广" forState:UIControlStateNormal];
    [delegateBtn addTarget:self action:@selector(delegateBtnClick) forControlEvents:UIControlEventTouchUpInside];
//    我要采购
//    UIButton *purchaseBtn =
    UIButton *purchaseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //    popBtn.backgroundColor = [UIColor redColor];
    purchaseBtn.frame = CGRectMake(0, 86, 120, 40);
    [purchaseBtn setTitle:@"我要采购" forState:UIControlStateNormal];
    [purchaseBtn addTarget:self action:@selector(purchaseBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
//    添加煤炭
//    UIButton *addCoalBtn =
    UIButton *addCoalBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //    popBtn.backgroundColor = [UIColor redColor];
    addCoalBtn.frame = CGRectMake(0, 124, 120, 40);
    [addCoalBtn setTitle:@"添加煤炭" forState:UIControlStateNormal];
    [addCoalBtn addTarget:self action:@selector(addCoalBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    [view addSubview:imgView];
    [view addSubview:addCustomBtn];
    [view addSubview:delegateBtn];
    [view addSubview:purchaseBtn];
    [view addSubview:addCoalBtn];

    
    
    
    [self.view addSubview:view];

}
//添加客户
-(void)tapClick{
//    WKAddCustomController *addCustomVC = [[WKAddCustomController alloc]init];
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"WKAddCustomController" bundle:nil];
    WKAddCustomController *vc = [sb instantiateInitialViewController];
    
    [self.navigationController pushViewController:vc animated:YES];
//    [self.coverView removeFromSuperview];
    [self.popView removeFromSuperview];
}
//委托推广
-(void)delegateBtnClick{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"快煤提示" message:@"恭喜您已提交推广请求，稍后会有客服与您联系，请您耐心等待！" preferredStyle:  UIAlertControllerStyleAlert];

    [alert addAction:[UIAlertAction actionWithTitle:@"好的，我知道了" style:UIAlertActionStyleDefault handler:nil        ]];
    [self.popView removeFromSuperview];

    //弹出提示框；
    [self presentViewController:alert animated:true completion:nil];


}
//我要采购
-(void)purchaseBtnClick{
//    WKAddCustomController *addCustomVC = [[WKAddCustomController alloc]init];
//    [self.navigationController pushViewController:addCustomVC animated:YES];
    
//    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"WKNeedPurchaseTableViewController" bundle:nil];
//    WKNeedPurchaseTableViewController *vc = [sb instantiateInitialViewController];
    
//    [self.navigationController pushViewController:vc animated:YES];
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"WKPurchaseTableViewController" bundle:nil];
    WKPurchaseTableViewController *PurchaseVc = [sb instantiateInitialViewController];
    
    [self.navigationController pushViewController:PurchaseVc animated:YES];
    
    
    [self.popView removeFromSuperview];

}
//添加煤炭
-(void)addCoalBtnClick{
//    WKAddCustomController *addCustomVC = [[WKAddCustomController alloc]init];
//    [self.navigationController pushViewController:addCustomVC animated:YES];
//    [self.popView removeFromSuperview];
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"WKAddCoal" bundle:nil];
    WKAddCoalTableViewController *vc = [sb instantiateInitialViewController];
    
    [self.navigationController pushViewController:vc animated:YES];
    
    [self.popView removeFromSuperview];


}



#pragma mark - UITableView代理方法

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    
        return self.plistArray1.count;

}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WKMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"message"];
    
    cell.message = self.plistArray1[indexPath.row];
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
}

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    //    客户
//    if (indexPath.section == 0 && indexPath.row == 0) {
//        WKCustomController *customVC = [[WKCustomController alloc]init];
//        
//        [self.navigationController pushViewController:customVC animated:YES];
//        
//        //   供应商
//    }else{
//        WKSupplierController *supplier = [[WKSupplierController alloc]init];
//        
//        
//        [self.navigationController pushViewController:supplier animated:YES];
//        
//    }
//    
//}

-(NSMutableArray *)plistArray1{
    
    if (_plistArray1 == nil) {
        NSArray *dictArr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"message2.plist" ofType:nil]];
        NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:dictArr.count];
        for (NSDictionary *dict in dictArr) {
            
            WKMessage *message = [WKMessage groupWithDict:dict];
            [arrM addObject:message];
            
        }
        _plistArray1 = arrM;
    }
    
    return _plistArray1;
}




@end
