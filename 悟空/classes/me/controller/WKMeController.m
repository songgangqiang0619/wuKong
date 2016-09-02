//
//  WKMeController.m
//  悟空
//
//  Created by 宋钢强 on 16/8/9.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WKMeController.h"
#import "WKHeaderView.h"
#import "WKChangeTableViewController.h"
#import "WKFindSecurityController.h"
#import "WKAdviceViewController.h"
#import "WKLoginViewController.h"
#import "WKLoginController.h"

@interface WKMeController ()
@property (nonatomic,strong) NSArray *plistArray;

@end

@implementation WKMeController
-(void)viewDidLoad{
    
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的";

    WKHeaderView *headerView = [[WKHeaderView alloc] init];
    
    headerView.backgroundColor = [UIColor whiteColor];
    headerView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 150);
    self.tableView.tableHeaderView = headerView;
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    
    UITapGestureRecognizer *tapGeture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(ActionDo:)];
    [headerView addGestureRecognizer:tapGeture];

}

-(void)ActionDo:(UITapGestureRecognizer *)recognizer{

    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"WKChangeTableViewController" bundle:nil];
    WKChangeTableViewController *vc = [sb instantiateInitialViewController];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}



#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.plistArray.count;
}
//
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSArray *rowArray = self.plistArray[section];
    
    return rowArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"cell";
    
    if (indexPath.section == 0 && indexPath.row == 0) {
//        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];

        
    }
    
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    NSArray *sectionArray = self.plistArray[indexPath.section];
    
    NSDictionary *dic = sectionArray[indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:dic[@"icon"]];
    cell.textLabel.text = dic[@"name"];
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
     return 60;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 1 && indexPath.row == 0) {
        
        
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"changeSecure" bundle:nil];
        WKFindSecurityController *vc = [sb instantiateInitialViewController];
        
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.section == 2 && indexPath.row == 0){
    
        WKAdviceViewController *advice = [[WKAdviceViewController alloc]init];
    
        [self.navigationController pushViewController:advice animated:YES];
    
    
    }else if (indexPath.section == 3 && indexPath.row == 0){
        
        [self callPhone];
    }else if (indexPath.section == 4 && indexPath.row == 0){
        
        [self callPhone];
    }else {
    
        // 1.创建一个AlertController
        UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"提示" message:@"确定退出吗?" preferredStyle:UIAlertControllerStyleActionSheet];
        
        // 2.创建两个按钮
        UIAlertAction *outAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            
            // 点击注销,返回登录控制器
//#warning mark: pop出错
            UIStoryboard *sb = [UIStoryboard storyboardWithName:@"login" bundle:nil];
            WKLoginController *vc = [sb instantiateInitialViewController];
            

//            [self.navigationController popToViewController:vc animated:YES];
            
//            [self.navigationController popToRootViewControllerAnimated:YES];
            [UIApplication sharedApplication].keyWindow.rootViewController = vc;
        }];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        // 3.把按钮添加到alertVC
        [alertVc addAction:outAction];
        [alertVc addAction:cancelAction];
        
        
        // 4.显示alertVc
        [self presentViewController:alertVc animated:YES completion:nil];
        

        
        
        
    }
    
    
    
    }


-(void)callPhone{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"确定拨打服务电话" message:@"400-109-1199" preferredStyle:  UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSString *number = @"400-109-1199";// 此处读入电话号码
        
        NSString *num = [[NSString alloc] initWithFormat:@"tel://%@",number]; //number为号码字符串 如果使用这个方法 结束电话之后会进入联系人列表
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:num]]; //拨号
        
    }
                      
                      ]];
    //弹出提示框；
    [self presentViewController:alert animated:true completion:nil];


}


-(NSArray *)plistArray{
    
    if (_plistArray == nil) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"me" ofType:@"plist"];
        _plistArray = [NSArray arrayWithContentsOfFile:path];
    }
    
    return _plistArray;
}

-(instancetype)init{
    
    return [super initWithStyle:UITableViewStyleGrouped];
}


@end
