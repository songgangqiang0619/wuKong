//
//  WKEditInfoController.m
//  悟空
//
//  Created by 宋钢强 on 16/8/17.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WKEditInfoController.h"

@interface WKEditInfoController ()

@property (nonatomic, assign) Boolean isPersonal;


@end

@implementation WKEditInfoController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isPersonal = false;

}


- (IBAction)qiYeBtnClick:(id)sender {
//    self.changeNameField.placeholder = @"请输入公司名称";
//    self.personBtn.selected = NO;
//    self.qiYeBtn.selected = YES;
    
    self.isPersonal = false;
    [self.tableView reloadData];
}

- (IBAction)personBtnClick:(id)sender {
//    self.personBtn.selected = YES;
//    self.qiYeBtn.selected = NO;
//    self.changeNameField.placeholder = @"请输入姓名";
    self.isPersonal = YES;
    [self.tableView reloadData];
    //    self.tableView.rowHeight = 100;
    
}


//返回cell高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        return 120;
    }

    if (indexPath.section == 3 && indexPath.row == 0) {
        
        return 100;
    }

    if (self.isPersonal == true) {

        
        if (indexPath.section ==2 && indexPath.row == 0) {
            
            return 0;
        }
        return 44;

    }else{
        if (indexPath.section ==2 && indexPath.row == 0) {
            
            return 44;
        }
        return 44;

    }


}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction *fromAlbumnBtn = [UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            UIImagePickerController *picker = [UIImagePickerController new];
            [self presentViewController:picker animated:YES completion:nil];
            
        }];
        [alertVc addAction:fromAlbumnBtn];
        
        UIAlertAction *takePhotoBtn = [UIAlertAction actionWithTitle:@"拍照上传" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alertVc addAction:takePhotoBtn];
        
        UIAlertAction *cancelBtn = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alertVc addAction:cancelBtn];
        
        [self presentViewController:alertVc animated:YES completion:nil];
        
    }
    
    
}



@end
