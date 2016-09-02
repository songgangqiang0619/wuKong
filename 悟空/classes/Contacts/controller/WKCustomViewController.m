//
//  WKCustomViewController.m
//  悟空
//
//  Created by 宋钢强 on 16/8/18.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WKCustomViewController.h"
#import "WKAddCustomController.h"
#import "WKAddCustom.h"
#import "WKCustomCell.h"
#import "WKDetailCustomController.h"
#import "WKChangeCustomController.h"

@interface WKCustomViewController () <WKAddCustomControllerDelegate,WKChangeCustomControllerDelegate,UITableViewDelegate,UITableViewDataSource>
/**
 *  保存所有联系人的模型数组
 */
@property (nonatomic, strong) NSMutableArray<WKAddCustom *> *contactsArrM;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation WKCustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"客户";

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"添加客户" style:UIBarButtonItemStylePlain target:self action:@selector(addSupplier)];

    self.tableView.tableFooterView = [[UIView alloc]init];

}

- (void)addSupplier{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"WKAddCustomController" bundle:nil];
    WKAddCustomController *vc = [sb instantiateInitialViewController];
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:YES];

}

//实现代理方法
-(void)addController:(WKAddCustomController *)addVc wantToAddContact:(WKAddCustom *)addCt{
    NSLog(@"%@", addCt.name);

    // 1.先把联系人数据存到数组
    [self.contactsArrM addObject:addCt];
    
    // 2.刷新
    // 全局刷新
    [self.tableView reloadData];

#pragma mark - 1 添加好联系人存储一下
    [self saveContacts];

}



/**************************** 删除联系人 *****************************/
#pragma mark - tableView的代理方法
// commit 提交   实现此代理方法,即可实现向左滑动,显示delete按钮
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 1.从集合中删除对应的联系人
    [self.contactsArrM removeObjectAtIndex:indexPath.row];
    
    // 2.刷新表格
    [self.tableView reloadData];
    
#pragma mark - 3 删除联系人时进行存储
    [self saveContacts];
}

// 作用,实现此代理方法,可以修改向左滑动时,显示的删除按钮的title
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return @"删除";
    
}

#pragma mark: 修改的代理方法
- (void)didFinishEditedContact:(WKChangeCustomController *)editVc{

#pragma mark - 2 编辑联系人的时候存储一下
    [self saveContacts];
    
    // 直接让列表刷新,读取最新的数据
    [self.tableView reloadData];
    

}




#pragma mark - 数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.contactsArrM.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 1.创建cell
    WKCustomCell *cell = [WKCustomCell cellWithTableView:tableView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setImage:[UIImage imageNamed:@"通讯录－电话"] forState:UIControlStateNormal];
    btn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 68, 10, 80, 48);
    
    [btn addTarget:self action:@selector(callPhone) forControlEvents:UIControlEventTouchUpInside];
    
    [cell addSubview:btn];

    cell.accessoryView = btn;
    // 2.设置数据
    cell.modelContact = self.contactsArrM[indexPath.row];
    
    // 3.返回cell
    return cell;
    
    
}

-(void)callPhone{
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"确认联系客户" message:nil preferredStyle:  UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil        ]];
    [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        // 获取选中行的索引
        NSIndexPath *selIndexPath = [self.tableView indexPathForSelectedRow];
        // 获取数据
        WKAddCustom *selContact = self.contactsArrM[selIndexPath.row];
        
        NSString *number = selContact.phoneNumber;// 此处读入电话号码
        
        NSString *num = [[NSString alloc] initWithFormat:@"tel://%@",number]; //number为号码字符串 如果使用这个方法 结束电话之后会进入联系人列表
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:num]]; //拨号
        
        
    }        ]];
    
    //弹出提示框；
    [self presentViewController:alert animated:true completion:nil];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"WKChangeCustomController" bundle:nil];
    WKChangeCustomController *editVc = [sb instantiateInitialViewController];
    
    editVc.delegate = self;
    // 2.设置数据
    // 2.1 获取选中的数据
    // 获取选中行的索引
    NSIndexPath *selIndexPath = [self.tableView indexPathForSelectedRow];
    // 获取数据
    WKAddCustom *selContact = self.contactsArrM[selIndexPath.row];
    
    editVc.editCt = selContact;

    
    [self.navigationController pushViewController:editVc animated:YES];
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 70;

}

#pragma mark - 保存所有的联系人数据
- (void)saveContacts {
    
    // 归档数据进行存储.
    // 1.文件路径
    NSString *ctsFilePath = [self filePathWithName:@"hm_contact.db"];
    
    // 2.存储
    [NSKeyedArchiver archiveRootObject:self.contactsArrM toFile:ctsFilePath];
    
}
/**
 *  返回存储文件路径的方法
 */
- (NSString *)filePathWithName:(NSString *)fileName {
    
    // 1.doc的路径
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    // 2.拼接文件路径并返回
    return [docPath stringByAppendingPathComponent:fileName];
}



#pragma mark - 懒加载
- (NSMutableArray *)contactsArrM {
    
    if (_contactsArrM == nil) {
        
//        _contactsArrM = [NSMutableArray array];
        
        // 来两条数据
//        WKAddCustom *hyl = [WKAddCustom contactWithcompanyName:@"北京" name:@"song" phoneNumber:@"123" loaction:@"ds" detailLoc:@"ze" hangYe:@"we" num:@"e"];
//        WKAddCustom *zyd = [WKAddCustom contactWithcompanyName:@"上海" name:@"song" phoneNumber:@"123" loaction:@"ds" detailLoc:@"ze" hangYe:@"we" num:@"e"];
        
        
//        [_contactsArrM addObject:hyl];
//        [_contactsArrM addObject:zyd];
        
#pragma mark - 4 读取数据 防 nil
        _contactsArrM = [NSKeyedUnarchiver unarchiveObjectWithFile: [self filePathWithName:@"hm_contact.db"]];
        
        // 屏蔽掉数组为空的错误
        if (_contactsArrM == nil) {
            _contactsArrM = [NSMutableArray array];
        }
        

    }
    return _contactsArrM;
    
}





@end
