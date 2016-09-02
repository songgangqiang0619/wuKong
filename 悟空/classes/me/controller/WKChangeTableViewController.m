


//
//  WKChangeTableViewController.m
//  悟空
//
//  Created by 宋钢强 on 16/8/10.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WKChangeTableViewController.h"
#import "WKEditInfoController.h"

@interface WKChangeTableViewController ()
@property (nonatomic,strong) NSArray *plistArray;

@end

@implementation WKChangeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的";

    self.view.userInteractionEnabled = NO;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"修改" style:UIBarButtonItemStylePlain target:self action:@selector(changeInfo)];
    self.automaticallyAdjustsScrollViewInsets = NO;


}

-(void)changeInfo{
//    NSLog(@"yes");
//    WKEditInfoController *edit = [[WKEditInfoController alloc]init];
//    [self.navigationController pushViewController:edit animated:YES];
    
//#warning mark: 跳转不过去
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"WKEditInfoController" bundle:nil];
    WKEditInfoController *vc = [sb instantiateInitialViewController];
    
    [self.navigationController pushViewController:vc animated:YES];

}


//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    if (indexPath.section == 0 && indexPath.row == 0) {
//        UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
//        
//        UIAlertAction *fromAlbumnBtn = [UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//            
//            UIImagePickerController *picker = [UIImagePickerController new];
//            [self presentViewController:picker animated:YES completion:nil];
//            
//        }];
//        [alertVc addAction:fromAlbumnBtn];
//        
//        UIAlertAction *takePhotoBtn = [UIAlertAction actionWithTitle:@"拍照上传" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//            
//        }];
//        [alertVc addAction:takePhotoBtn];
//        
//        UIAlertAction *cancelBtn = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//            
//        }];
//        [alertVc addAction:cancelBtn];
//        
//        [self presentViewController:alertVc animated:YES completion:nil];
//        
//    }
//
//
//}
//






//-(NSArray *)plistArray{
//    
//    if (_plistArray == nil) {
//        
//        NSString *path = [[NSBundle mainBundle] pathForResource:@"change" ofType:@"plist"];
//        _plistArray = [NSArray arrayWithContentsOfFile:path];
//    }
//    
//    return _plistArray;
//}
//
//-(instancetype)init{
//    
//    return [super initWithStyle:UITableViewStyleGrouped];
//}

//
//#pragma mark - Table view data source
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return self.plistArray.count;
//}
////
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    
//    NSArray *rowArray = self.plistArray[section];
//    
//    return rowArray.count;
//}
//
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    static NSString *ID = @"cell";
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    
//    if (cell == nil) {
//        
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
//    }
//    
//    
//    NSArray *sectionArray = self.plistArray[indexPath.section];
//    
//    NSDictionary *dic = sectionArray[indexPath.row];
//    
////    cell.imageView.image = [UIImage imageNamed:dic[@"icon"]];
//    cell.textLabel.text = dic[@"name"];
//    
//    return cell;
//    
//}
//
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//        if (indexPath.section == 0 && indexPath.row == 0) {
//            return 100;
//        }else if (indexPath.section == 3 && indexPath.row == 0){
//            return 100;
//        }else{
//            return 50;
//        }
//}
//
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    //    SettingController *settingVC = [[SettingController alloc] init];
//    //
//    //    settingVC.hidesBottomBarWhenPushed = YES;
//    //
//    //    [self.navigationController pushViewController:settingVC animated:YES];
//}
//



@end
