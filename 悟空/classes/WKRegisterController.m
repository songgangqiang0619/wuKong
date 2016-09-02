//
//  WKRegisterController.m
//  悟空
//
//  Created by 宋钢强 on 16/8/12.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WKRegisterController.h"
#import "AFNetworking.h"
#import "NSString+Hash.h"
#import <SMS_SDK/SMSSDK.h>


@interface WKRegisterController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *qiYeBtn;
@property (weak, nonatomic) IBOutlet UIButton *personBtn;

@property (weak, nonatomic) IBOutlet UIButton *registerBtnClick;

@property (weak, nonatomic) IBOutlet UITextField *phoneNumTextField;

@property (weak, nonatomic) IBOutlet UITextField *securtTextField;


@property (weak, nonatomic) IBOutlet UITextField *yanzmTextField;


//请输入公司名称
@property (weak, nonatomic) IBOutlet UITextField *changeNameField;
//请输入姓名CELL
@property (weak, nonatomic) IBOutlet UITableViewCell *qudiaoNameField;

@property (nonatomic, assign) NSInteger cellCount;

@property (nonatomic, assign) Boolean isPersonal;

@end

@implementation WKRegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"注册";

    self.personBtn.selected = NO;
    self.qiYeBtn.selected = YES;
//    self.tableView.delegate = self;
//    self.tableView.dataSource = self;
//    
//    self.cellCount = 8;
//    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 30)];
//    
//    footerView.backgroundColor = [UIColor yellowColor];
//    self.tableView.tableFooterView = footerView;
    self.isPersonal = false;
}

- (IBAction)qiYeBtnClick:(id)sender {
    self.changeNameField.placeholder = @"请输入公司名称";
    self.personBtn.selected = NO;
    self.qiYeBtn.selected = YES;

    self.isPersonal = false;
    [self.tableView reloadData];
}

- (IBAction)personBtnClick:(id)sender {
    self.personBtn.selected = YES;
    self.qiYeBtn.selected = NO;
    self.changeNameField.placeholder = @"请输入姓名";
    self.isPersonal = YES;
    [self.tableView reloadData];
//    self.tableView.rowHeight = 100;

}

- (IBAction)yanZhengMaBtnClick:(id)sender {
    
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.phoneNumTextField.text
                                   zone:@"86"
                       customIdentifier:nil
                                 result:^(NSError *error){
                                     if (!error) {
                                         NSLog(@"获取验证码成功");
                                     } else {
                                         NSLog(@"错误信息：%@",error);
                                     }

                                 }];
}



- (IBAction)registerBtnClick:(id)sender {
    

 [SMSSDK commitVerificationCode:self.yanzmTextField.text phoneNumber:self.phoneNumTextField.text zone:nil result:^(NSError *error) {
        
        if (!error) {
            NSLog(@"验证成功");
        }
        else
        {
            NSLog(@"错误信息:%@",error);
        }
 }];


    
    [self postDemo];
    
    
    
}

#pragma mark: 注册用户
- (void)postDemo{
    //1.创建一个管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //设置成功/失败的block在哪个线程中调用
    manager.completionQueue = dispatch_queue_create("com.wk", DISPATCH_QUEUE_CONCURRENT);
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    
    
    //2.由管理者发起请求
    
    
    //获取系统当前的时间戳
    //    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    //    NSTimeInterval a=[dat timeIntervalSince1970]*1000;
    //    NSString *timeString = [NSString stringWithFormat:@"%f", a];
    //    获取设备的udid
    
    NSString *UDID = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    NSString *UID = @"0";
    NSString *client = @"iOS";
    NSString *app = @"seller";
    NSTimeInterval a = [[NSDate date]timeIntervalSince1970]*1000;
    NSString *timeStamp = [NSString stringWithFormat:@"%.0f",a];
    //    NSString *sign = @"6f27b3e5b70d10";
    
    //    把参数添加到数组中
    NSMutableArray *arrayM = [NSMutableArray array];
    [arrayM addObject:UDID];
    [arrayM addObject:UID];
    [arrayM addObject:client];
    [arrayM addObject:app];
    [arrayM addObject:timeStamp];
    //    [arrayM addObject:sign];
    
    //    排序数组
    [arrayM sortUsingComparator:^NSComparisonResult(NSString * obj1, NSString * obj2) {
        
        return [obj1 compare:obj2];
    }];
    
    //    把排序后的数组拼接成字符串
    NSMutableString *stringM = [NSMutableString string];
    for (int i = 0; i < arrayM.count; i++) {
        [stringM appendString:UDID];
        [stringM appendString:UID];
        [stringM appendString:client];
        [stringM appendString:app];
        [stringM appendString:timeStamp];
    }
    
    //    加密字符串
    NSString *str = [stringM md5String];
    
    
    
    
    NSDictionary *parameter = @{
                                @"UDID":UDID,
                                @"siganature":str,
                                @"UID":UID,
                                @"timeStamp":timeStamp,
                                @"client":client,
                                @"app":app,
                                @"mobile":self.phoneNumTextField.text,
                                @"password":self.securtTextField.text,
                                @"mcode":self.yanzmTextField.text
                                };
    [manager POST:@"http://app.trade.51kuaimei.com/asyn/SetUserInfoByCreate" parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSString *result = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"%@",result);
        
        
        //把它保存到数据库
        //        NSLog(@"%@---%@",responseObject,[NSThread currentThread]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}


//返回cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.isPersonal == true) {
        
    
    if (indexPath.section ==1 && indexPath.row == 8) {
        
        return 160;
    }
    if (indexPath.section ==1 && indexPath.row == 3) {
        
        return 0;
    }
    
    return 44;
    }
    
    else{
        if (indexPath.section ==1 && indexPath.row == 8) {
            
            return 160;
        }
        else{
            return 44;
        }
        
    }
    
}




@end
