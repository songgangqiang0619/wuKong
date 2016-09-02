//
//  WKContactsController.m
//  悟空
//
//  Created by 宋钢强 on 16/8/9.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WKContactsController.h"
//#import "WKCustomController.h"
#import "WKSupplierViewController.h"
#import "WKCustomViewController.h"


@interface WKContactsController ()
@property (nonatomic,strong) NSArray *plistArray;

@end

@implementation WKContactsController

- (void)viewDidLoad {
    [super viewDidLoad];
    

}

-(NSArray *)plistArray{
    
    if (_plistArray == nil) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"LinkMan" ofType:@"plist"];
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
    
//    客户
    if (indexPath.section == 0 && indexPath.row == 0) {
//        WKCustomController *customVC = [[WKCustomController alloc]init];
//        
//        [self.navigationController pushViewController:customVC animated:YES];
        
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"WKCustom" bundle:nil];
        WKCustomViewController *vc = [sb instantiateInitialViewController];
        
        [self.navigationController pushViewController:vc animated:YES];
        
//
//   供应商
    }else{
        
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"WKSupplierController" bundle:nil];
        WKSupplierViewController *vc = [sb instantiateInitialViewController];
        
        [self.navigationController pushViewController:vc animated:YES];
        
    
        
        
//        WKSupplierController *supplier = [[WKSupplierController alloc]init];
//        [self.navigationController pushViewController:supplier animated:YES];
//    
        
//        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"WKGoToAddSupplierTableView" bundle:nil];
//        WKGoToAddSupplierTableViewController *vc = [sb instantiateInitialViewController];
//        
//        [self.navigationController pushViewController:vc animated:YES];
        

    }

}



@end
