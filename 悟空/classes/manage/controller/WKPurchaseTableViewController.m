//
//  WKPurchaseTableViewController.m
//  悟空
//
//  Created by 宋钢强 on 16/8/10.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WKPurchaseTableViewController.h"
#import "WKNeedPurchaseTableViewController.h"
#import "WKSelectPlaceVC.h"
#import "WKPurchaseCell.h"
#import "WKAddCustom.h"

@interface WKPurchaseTableViewController ()<WKSelectPlaceVCDelegate>

@property (nonatomic,strong) NSMutableArray *plistArray;
@property (nonatomic,assign) NSInteger index;
//点击与否添加收货地址
@property (nonatomic, assign) BOOL isReturnPlace;
//减
@property (weak, nonatomic) IBOutlet UIButton *jian;
//数量
@property (weak, nonatomic) IBOutlet UITextField *num;
//加
@property (weak, nonatomic) IBOutlet UIButton *add;
//总吨数
@property (weak, nonatomic) IBOutlet UILabel *totalNum;

@property (nonatomic, copy) NSString *identifier;

@property (nonatomic, strong) NSMutableArray *caiGouArrM;
//@property (nonatomic, strong) NSMutableArray<WKAddCustom *> *caiGouArrM;

//支付按钮
@property (weak, nonatomic) IBOutlet UIButton *zhiFu1;
@property (weak, nonatomic) IBOutlet UIButton *zhiFu2;
@property (weak, nonatomic) IBOutlet UIButton *zhiFu3;


//我的电话
@property (weak, nonatomic) IBOutlet UIButton *myPhoneNum;


//送货方式
@property (weak, nonatomic) IBOutlet UIButton *sendStyle;

@end


@implementation WKPurchaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.index = 1;
    self.isReturnPlace = NO;
    
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 44)];
    
    footerView.backgroundColor = [UIColor greenColor];
    self.tableView.tableFooterView = footerView;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(self.view.bounds.size.width *2/4, 0, self.view.bounds.size.width *2/4, footerView.bounds.size.height);
    [btn setTitle:@"发起采购" forState:UIControlStateNormal];
    //    [btn sizeToFit];
    [footerView addSubview:btn];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, self.view.bounds.size.width *2/4, footerView.bounds.size.height);
    [btn setTitle:@"实付款：¥0" forState:UIControlStateNormal];
    //    [btn sizeToFit];
    [footerView addSubview:btn2];
    

}

- (IBAction)jianBtnClick:(id)sender {
    if (self.index >1) {
        self.index--;
    }
    self.num.text = [NSString stringWithFormat:@"%zd",self.index];
    self.totalNum.text = [NSString stringWithFormat:@"%zd",40*self.index];
    
}

- (IBAction)addBtnClick:(id)sender {
    self.index++;
    self.num.text = [NSString stringWithFormat:@"%zd",self.index];
    self.totalNum.text = [NSString stringWithFormat:@"%zd",40*self.index];
}

//文本框事件的改变
- (IBAction)textFieldEdit:(id)sender {
    
    self.totalNum.text = [NSString stringWithFormat:@"%zd",40*self.index];
    
    
}

//按钮选中状态的改变
- (IBAction)selectedBtnClick:(UIButton *)sender {
    if (sender.tag == 10) {
//        self.zongLei1.selected = YES;
//        self.zongLei2.selected = NO;
//        self.zongLei3.selected = NO;
//        self.yongTuBtn2.enabled = YES;
//        self.yongTuBtn1.enabled = YES;
//        self.yongTuBtn3.enabled = YES;
//        self.coalZongLei = self.zongLei1.titleLabel.text;
        
    }
    
    if (sender.tag == 11) {
//        self.zongLei1.selected = NO;
//        self.zongLei2.selected = YES;
//        self.zongLei3.selected = NO;
//        self.yongTuBtn2.enabled = NO;
//        self.yongTuBtn1.enabled = YES;
//        self.yongTuBtn3.enabled = YES;
//        self.coalZongLei = self.zongLei2.titleLabel.text;
        
    }

    
    
    
    
}





-(NSMutableArray *)plistArray{
    
    if (_plistArray == nil) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"WKPurchase1" ofType:@"plist"];
        _plistArray = [NSMutableArray arrayWithContentsOfFile:path];
    }
    
    return _plistArray;
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
//    默认的
    WKPurchaseCell *cell = [WKPurchaseCell cellWithTableView:tableView andIndexPath:indexPath];
//    防止点击 我要采购 时数组越界
    if (self.isReturnPlace) {
        
    WKAddCustom *caiGou = self.caiGouArrM.lastObject;
    static NSString *identifier = @"";
    //    添加需采购煤炭有返回值，添加收货地址无返回值时
    if (self.dic  && self.isReturnPlace == NO) {
        if (indexPath.section == 0) {
            identifier =  @"CoalCell";
        }
        if (indexPath.section == 1) {
            identifier =  @"GysCell";
        }
        if (indexPath.section == 2) {
            identifier =  @"baseCell1";
            
        }
        
        if (indexPath.section == 3) {
            identifier = @"BuyCountCell";
            
        }
        if (indexPath.section == 4) {
            identifier = @"PayCell";
            
        }
        if (indexPath.section == 5) {
            identifier = @"PhoneCell";
            
        }
        if (indexPath.section == 6) {
            identifier = @"PhoneCell";
            
        }
        if (indexPath.section == 7) {
            identifier = @"yuEcell";
            
        }
        if (indexPath.section == 8) {
            identifier = @"LiuYanCell";
            
        }
        if (indexPath.section == 9) {
            identifier = @"MoneyCell";
            
        }
        if (indexPath.section == 10) {
            identifier = @"yuEcell";
            
        }
        if (indexPath.section == 11) {
            identifier = @"LastCell";
            
        }
        cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        return cell;
    }
    //    添加需采购煤炭无返回值，添加收货地址有返回值时、
    if (self.isReturnPlace && self.dic == NO) {
        if (indexPath.section == 0) {
            identifier =  @"baseCell";
        }
        if (indexPath.section == 1) {
            identifier =  @"SellerInfoCell";
#warning mark:赋值没起作用
//            cell.shouHuoComName.text = caiGou.companyName;
//            cell.shouHuoComPlace.text = caiGou.companyName;
        }
        if (indexPath.section == 2) {
            identifier = @"BuyCountCell";
            
        }
        if (indexPath.section == 3) {
            identifier = @"PayCell";
            
        }
        if (indexPath.section == 4) {
            identifier = @"PhoneCell";
            
        }
        if (indexPath.section == 5) {
            identifier = @"PhoneCell";
            
        }
        if (indexPath.section == 6) {
            identifier = @"yuEcell";
            
        }
        if (indexPath.section == 7) {
            identifier = @"LiuYanCell";
            
        }
        if (indexPath.section == 8) {
            identifier = @"MoneyCell";
            
        }
        if (indexPath.section == 9) {
            identifier = @"yuEcell";
            
        }
        if (indexPath.section == 10) {
            identifier = @"LastCell";
            
        }
        cell = [tableView dequeueReusableCellWithIdentifier:identifier];
//        cell.shouHuoComName.text = @"12";
//        cell.shouHuoComPlace.text = @"12";
        cell.shouHuoComName.text = caiGou.companyName;
        cell.shouHuoComPlace.text = caiGou.detailLoc;

        return cell;
    }
    //    添加需采购煤炭有返回值，添加收货地址有返回值时
    if (self.isReturnPlace && self.dic) {
        
        if (indexPath.section == 0) {
            identifier =  @"CoalCell";
        }
        if (indexPath.section == 1) {
            identifier =  @"GysCell";
        }

//        if (indexPath.section == 0) {
//            
//            identifier =  @"baseCell";
//        }
        if (indexPath.section == 2) {
            identifier =  @"SellerInfoCell";
        }
        if (indexPath.section == 3) {
            identifier = @"BuyCountCell";
            
        }
        if (indexPath.section == 4) {
            identifier = @"PayCell";
            
        }
        if (indexPath.section == 5) {
            identifier = @"PhoneCell";
            
        }
        if (indexPath.section == 6) {
            identifier = @"PhoneCell";
            
        }
        if (indexPath.section == 7) {
            identifier = @"yuEcell";
            
        }
        if (indexPath.section == 8) {
            identifier = @"LiuYanCell";
            
        }
        if (indexPath.section == 9) {
            identifier = @"MoneyCell";
            
        }
        if (indexPath.section == 10) {
            identifier = @"yuEcell";
            
        }
        if (indexPath.section == 11) {
            identifier = @"LastCell";
            
        }
        cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        return cell;
    }

        
    }

    return cell;
    
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.dic) {
        
        if (indexPath.section == 0 && indexPath.row == 0){
            
            UIStoryboard *sb = [UIStoryboard storyboardWithName:@"WKNeedPurchaseTableViewController" bundle:nil];
            WKNeedPurchaseTableViewController *needPurchaseVc = [sb instantiateInitialViewController];
            
            [self.navigationController pushViewController:needPurchaseVc animated:YES];
        }
        
        if (indexPath.section == 2 && indexPath.row == 0) {
            UIStoryboard *sb = [UIStoryboard storyboardWithName:@"WKSelectPlace" bundle:nil];
            WKSelectPlaceVC *needPurchaseVc = [sb instantiateInitialViewController];
            needPurchaseVc.delegate = self;
            [self.navigationController pushViewController:needPurchaseVc animated:YES];
            
            
        }
    }
    
    
    if (indexPath.section == 0 && indexPath.row == 0){
        
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"WKNeedPurchaseTableViewController" bundle:nil];
        WKNeedPurchaseTableViewController *needPurchaseVc = [sb instantiateInitialViewController];
        
        [self.navigationController pushViewController:needPurchaseVc animated:YES];
        
    }
    
    if (indexPath.section == 1 && indexPath.row == 0){
        
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"WKSelectPlace" bundle:nil];
        WKSelectPlaceVC *needPurchaseVc = [sb instantiateInitialViewController];
        needPurchaseVc.delegate = self;
        [self.navigationController pushViewController:needPurchaseVc animated:YES];
        
        
    }
        
    
}
#pragma mark: 实现代理方法
- (void)addController:(WKSelectPlaceVC *)addVc wantToAddPlace:(WKAddCustom *)place{

    [self.caiGouArrM addObject:place];
    self.isReturnPlace = YES;
    
    [self.tableView reloadData];


}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    添加需采购煤炭有返回值，添加收货地址无返回值时
    if (self.dic  && self.isReturnPlace == NO) {
        
        if (indexPath.section == 0 || indexPath.section == 1) {
            return 100;
            
        }
        

        if (indexPath.section == 3) {
            return 60;
            
        }
        
        if (indexPath.section == 4) {
            return 130;
            
        }
        
        if (indexPath.section == 8) {
            return 60;
            
        }


        
        return 44;
        
    }
    //    添加需采购煤炭无返回值，添加收货地址有返回值时
    if (self.isReturnPlace && self.dic == NO) {
        
        if (indexPath.section == 1) {
            return 103;
            
        }

        
        if (indexPath.section == 2) {
            return 60;
            
        }
        
        if (indexPath.section == 3) {
            return 130;
            
        }
        
        if (indexPath.section == 7) {
            return 60;
            
        }

        
        
    }
    //    添加需采购煤炭有返回值，添加收货地址有返回值时
    if (self.dic  && self.isReturnPlace ) {
        
        if (indexPath.section == 0 || indexPath.section == 1) {
            return 100;
            
        }
        
        if (indexPath.section == 2) {
            return 103;
            
        }
        

        if (indexPath.section == 3) {
            return 60;
            
        }
        
        if (indexPath.section == 4) {
            return 130;
            
        }
        
        if (indexPath.section == 8) {
            return 60;
            
        }
        
//        return 44;
        
    }
    
    return 44;

}

#pragma mark - 懒加载

-(NSMutableArray *)caiGouArrM{

    if (_caiGouArrM == nil) {
        _caiGouArrM = [NSMutableArray array];
    }

    return _caiGouArrM;

}

- (void)setDic:(NSDictionary *)dic {
    _dic = dic;

    NSArray *arr = @[dic];
    [self.plistArray insertObject:arr atIndex:1];
    
    [self.tableView reloadData];
    NSLog(@"%@",dic);
}

@end
