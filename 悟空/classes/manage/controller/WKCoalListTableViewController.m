//
//  WKCoalListTableViewController.m
//  悟空
//
//  Created by 宋钢强 on 16/8/10.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WKCoalListTableViewController.h"
#import "WKAddCoalTableViewController.h"
#import "WKCoalListCell.h"
#import "WKCoalDetailViewController.h"

@interface WKCoalListTableViewController ()<WKAddCoalTableViewControllerDelegate>
@property (nonatomic,strong) NSArray *plistArray;
@property (nonatomic, strong) NSMutableArray *contactsArrM;

@end

@implementation WKCoalListTableViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        return [super initWithStyle:UITableViewStyleGrouped];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"添加新煤炭" style:UIBarButtonItemStylePlain target:self action:@selector(addCustom)];
    

}

- (void)addCustom {

    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"WKAddCoal" bundle:nil];
    WKAddCoalTableViewController *vc = [sb instantiateInitialViewController];
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:YES];
    
}
#pragma mark - 数据源

-(NSArray *)plistArray{
    
    if (_plistArray == nil) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"coalList" ofType:@"plist"];
        _plistArray = [NSArray arrayWithContentsOfFile:path];
    }
    
    return _plistArray;
}

-(void)addController:(WKAddCoalTableViewController *)addVc wantToAddCoal:(WKAddCoal *)addCt{
    
        // 1.先把数据存到数组
        [self.contactsArrM addObject:addCt];
    
        // 2.刷新
        // 全局刷新
        [self.tableView reloadData];

}


#pragma mark - UITableView代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.contactsArrM.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
//    NSArray *rowArray = self.contactsArrM[section];
    
//    return rowArray.count;
//        return self.contactsArrM.count;;
    return 1;

}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WKCoalListCell *cell = [WKCoalListCell cellWithTableView:tableView];
    
    WKAddCoal *addCoal = self.contactsArrM[indexPath.section];
    
    
//    cell.coalList = self.contactsArrM[indexPath.row];
    cell.coalList = addCoal;

    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 200;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"WKCoalDetail" bundle:nil];
    WKCoalDetailViewController *vc = [sb instantiateInitialViewController];
    vc.addCoal = self.contactsArrM[indexPath.section];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];

}


#pragma mark - 懒加载
- (NSMutableArray *)contactsArrM {
    
    if (_contactsArrM == nil) {
 
        _contactsArrM = [NSMutableArray array];
        
        
    }
    return _contactsArrM;
    
}

@end
