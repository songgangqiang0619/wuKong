//
//  WKSelectPlaceVC.m
//  悟空
//
//  Created by 宋钢强 on 16/8/22.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WKSelectPlaceVC.h"
#import "WKAddCustomController.h"
#import "WKPlaceCell.h"
#import "WKPurchaseTableViewController.h"
#import "WKAddCustom.h"


@interface WKSelectPlaceVC ()<UITableViewDataSource,UITableViewDelegate,WKAddCustomControllerDelegate>

@property (nonatomic, strong) NSMutableArray  *placeArrays;
@property (nonatomic,strong) NSArray *plistArray;
@property (weak, nonatomic) IBOutlet UITableView *placeTableView;

@end

@implementation WKSelectPlaceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.placeTableView.delegate = self;
    self.placeTableView.dataSource = self;

    
    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightItemClick)];
    
    self.navigationItem.rightBarButtonItem = addBtn;

}

- (void)rightItemClick {

    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"WKAddCustomController" bundle:nil];
    WKAddCustomController *vc = [sb instantiateInitialViewController];
    vc.delegate = self;
    
    [self.navigationController pushViewController:vc animated:YES];




}

#pragma mark- 实现添加联系人的代理方法
-(void)addController:(WKAddCustomController *)addVc wantToAddContact:(WKAddCustom *)addCt{
    NSLog(@"%@", addCt.name);
    
    // 1.先把联系人数据存到数组
    [self.placeArrays addObject:addCt];
    
    // 2.刷新
    // 全局刷新
    [self.placeTableView reloadData];
    
    
}
#pragma mark - 数据源

-(NSArray *)plistArray{
    
    if (_plistArray == nil) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"place" ofType:@"plist"];
        _plistArray = [NSArray arrayWithContentsOfFile:path];
    }
    
    return _plistArray;
}


#pragma mark - UITableView代理方法

#pragma mark - 数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.placeArrays.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 1.创建cell
    WKPlaceCell *cell = [WKPlaceCell cellWithTableView:tableView andIndexPath:indexPath];
    
    // 2.设置数据

    WKAddCustom *addCustom = self.placeArrays[indexPath.section];
    
    
        cell.comName.text = addCustom.companyName;
        cell.comPlace.text = addCustom.loaction;
    

    // 3.返回cell
    return cell;
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
        return 120;
        
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WKAddCustom *addCustom = self.placeArrays[indexPath.section];

    // 将模型数据传给采购控制器
//    if ([self.delegate respondsToSelector:@selector(addController:wantToAddPlace:)]) {
//        //
//        [self.delegate addController:self wantToAddPlace:addCustom];
//    }
    if ([self.delegate respondsToSelector:@selector(addController:wantToAddPlace:)]) {
        //
        [self.delegate addController:self wantToAddPlace:addCustom];
    }
    // 自己pop出去
    [self.navigationController popViewControllerAnimated:YES];
    

    
    NSArray *viewArr = self.navigationController.viewControllers;
    
    [viewArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[WKPurchaseTableViewController class]]) {
            
            WKPurchaseTableViewController *obj1 = (WKPurchaseTableViewController *)obj;
//            obj1.dic = self.infoDic;
            [self.navigationController popToViewController:obj1 animated:YES];
        }
    }];
    
    

}


#pragma mark - 懒加载
- (NSMutableArray *)placeArrays {
    
    if (_placeArrays == nil) {
        

      _placeArrays = [NSMutableArray array];
        
        
        
    }
    return _placeArrays;
    
}



@end
