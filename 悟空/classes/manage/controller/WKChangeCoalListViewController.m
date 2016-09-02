//
//  WKChangeCoalListViewController.m
//  悟空
//
//  Created by 宋钢强 on 16/8/23.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WKChangeCoalListViewController.h"
#import "WKChangCoalCell.h"
#import "WKDetailCoalVC.h"
#import "WKAddCoalTableViewController.h"

@interface WKChangeCoalListViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *changeTableView;
@property (nonatomic,strong) NSArray *plistArray;



@end

@implementation WKChangeCoalListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.changeTableView.delegate = self;
    self.changeTableView.dataSource = self;
    
    
    
}




-(NSArray *)plistArray{
    
    if (_plistArray == nil) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"changCoal" ofType:@"plist"];
        _plistArray = [NSArray arrayWithContentsOfFile:path];
    }
    
    return _plistArray;
}
//
//


//
//#pragma mark - UITableView代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.plistArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSArray *rowArray = self.plistArray[section];
    
    return rowArray.count;
}

//
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    WKChangCoalCell *cell = [WKChangCoalCell cellWithTableView:tableView];
    
    NSArray *rowArray = self.plistArray[indexPath.section];
    NSDictionary *dic = rowArray[indexPath.row];
    cell.coalName.text = dic[@"coalName"];
    cell.gongYS.text =dic[@"gongYS"];
    cell.liduLbl.text =dic[@"lidu"];
    cell.coalLeiLbl.text =dic[@"coalLei"];
    
    cell.coalPlaceLbl.text =dic[@"coalPlace"];
    
    cell.reZhiLbl.text =dic[@"reZhi"];
    
    cell.liuLbl.text =dic[@"liu"];
    
    cell.waterLbl.text =dic[@"water"];
    
    cell.huiFenLbl.text =dic[@"huiFen"];
    cell.qingLbl.text =dic[@"qing"];
    
    cell.coalPriceLbl.text =dic[@"coalPrice"];
    
    
    return cell;
    

}
//

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 200;

}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"WKDetailCoal" bundle:nil];
    WKDetailCoalVC *vc = [sb instantiateInitialViewController];
    
    NSDictionary *dic = self.plistArray[indexPath.row];
    vc.infoDic = dic;
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
    
    
}



@end
