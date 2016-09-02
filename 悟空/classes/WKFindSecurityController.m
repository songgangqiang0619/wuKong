//
//  WKFindSecurityController.m
//  悟空
//
//  Created by 宋钢强 on 16/8/15.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WKFindSecurityController.h"

@interface WKFindSecurityController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneField;

@end

@implementation WKFindSecurityController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"找回密码";
}
//获取验证码
- (IBAction)getproperty:(id)sender {
    
  
    if (self.phoneField.text.length == 0){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请输入手机号码" message:nil preferredStyle:  UIAlertControllerStyleAlert];
        
        [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil        ]];
        
        //弹出提示框；
        [self presentViewController:alert animated:true completion:nil];
    
    }else {
    
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请输入正确的手机号码" message:nil preferredStyle:  UIAlertControllerStyleAlert];
        
        [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil        ]];
        
        //弹出提示框；
        [self presentViewController:alert animated:true completion:nil];
    
    }

    
    
}
//联系客服
- (IBAction)linkman:(id)sender {

//        此处写打电话
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




@end
