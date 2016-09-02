//
//  WKLoginViewController.m
//  悟空
//
//  Created by 宋钢强 on 16/8/10.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WKLoginViewController.h"
#import "WKTabBarController.h"
#import "AFNetworking.h"
#import "WKJieXiJson.h"
#import "NSString+Hash.h"



@interface WKLoginViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) NSArray *channels;


@property (weak, nonatomic) IBOutlet UITextField *phoneNumTextField;
@property (weak, nonatomic) IBOutlet UITextField *securtTextField;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentLbl;
@property (weak, nonatomic) IBOutlet UIButton *yanzmBtn;


@property (weak, nonatomic) IBOutlet UIView *phoneSecureView;

// 定时器
@property (nonatomic ,strong) NSTimer *captchaTimer;
// 倒计时数值
@property (nonatomic ,assign)NSInteger captcha;
//// 获取验证码的按钮
//@property (weak, nonatomic) IBOutlet UIButton *captchaBtn;

@property (nonatomic, strong) UIButton *visalBtn;

@property (weak, nonatomic) IBOutlet UIView *view2;

@end

@implementation WKLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    self.channels = [WKJieXiJson channels];
    
    NSLog(@"%@",self.channels);

    self.view.backgroundColor = [UIColor whiteColor];
//    self.navigationItem.leftBarButtonItem

    self.navigationItem.title = @"登录";
    
    [self segmentClick:nil];
    self.securtTextField.delegate = self;
    
    self.phoneSecureView.layer.borderWidth = 0.5;
    self.phoneSecureView.layer.borderColor = [[UIColor grayColor] CGColor];
    self.phoneSecureView.layer.masksToBounds = YES;
    self.phoneSecureView.layer.cornerRadius = 5;
    
    // MARK: - 监听文本框内容的改变
//    [self.phoneNumTextField addTarget:self action:@selector(textChange:) forControlEvents:UIControlEventEditingChanged];
//    [self.securtTextField addTarget:self action:@selector(textChange:) forControlEvents:UIControlEventEditingChanged];

    

    [self setupBtn];
    self.segmentLbl.selectedSegmentIndex = 0;
    
    
    
    
    
    
}

- (void)setupBtn {
    self.visalBtn = [[UIButton alloc] initWithFrame:self.yanzmBtn.frame];
    self.securtTextField.placeholder = @"请输入验证码";
    
    [self.yanzmBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    
    [self.visalBtn setImage:[UIImage imageNamed:@"不可视"] forState:UIControlStateNormal];
    [self.visalBtn setImage:[UIImage imageNamed:@"可视"] forState:UIControlStateSelected];
    [self.visalBtn setTitle:@"123" forState:UIControlStateNormal];
    
    
    [self.view2 addSubview:self.visalBtn];
}


- (IBAction)segmentClick:(id)sender {
    
    if (self.segmentLbl.selectedSegmentIndex == 1) {
        self.visalBtn.hidden = YES;
        self.yanzmBtn.hidden = NO;
    }else{
        
        self.visalBtn.hidden = YES;
        self.yanzmBtn.hidden = YES;
        self.securtTextField.placeholder = @"请输入密码";
    }
    
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.visalBtn.hidden = NO;
}


- (IBAction)findSecurity:(id)sender {
    
    NSLog(@"下次再做");
    
}


#pragma mark: 请求验证码
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
    NSString *client = @"ios";
    NSString *app = @"seller";
    NSTimeInterval a = [[NSDate date]timeIntervalSince1970]*1000;
    NSString *timestamp = [NSString stringWithFormat:@"%.0f",a];
    NSString *sign = @"6f27b3e5b70d10";

//    把参数添加到数组中
    NSMutableArray *arrayM = [NSMutableArray array];
    [arrayM addObject:UDID];
    [arrayM addObject:UID];
    [arrayM addObject:client];
    [arrayM addObject:app];
    [arrayM addObject:timestamp];
    [arrayM addObject:sign];
    
//    排序数组
//    NSMutableString *stringM = [NSMutableString string];
//    for (int i = 0; i < arrayM.count; i++) {
//        [stringM appendString:UDID];
//        [stringM appendString:UID];
//        [stringM appendString:client];
//        [stringM appendString:app];
//        [stringM appendString:timeStamp];
//    }

    [arrayM sortUsingComparator:^NSComparisonResult(NSString * obj1, NSString * obj2) {
        
//        if ([obj1 compare:obj2] == NSOrderedAscending) {
//            [stringM appendString:obj1];
//
//        }
//
//        return stringM;
        return [obj1 compare:obj2];
    }];
    
//    把排序后的数组拼接成字符串
    NSMutableString *stringM = [NSMutableString string];
    for (int i = 0; i < arrayM.count; i++) {
        [stringM appendString:arrayM[i]];
        
            }

//    加密字符串
    NSString *str = [stringM md5String];
    
// 获取版本号
//    NSString *mobile = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    
    NSDictionary *parameter = @{
                                @"UDID":UDID,
                                @"signature":str,
                                @"UID":UID,
                                @"timestamp":timestamp,
                                @"client":client,
                                @"app":app,
                                @"mobile":@"18513993054"
                                };


    [manager POST:@"http://app.trade.51kuaimei.com/asyn/GetVerifyCodeByMobile" parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
         NSString *result = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
          NSLog(@"%@",result);
        
        //把它保存到数据库
//        NSLog(@"%@---%@",responseObject,[NSThread currentThread]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

- (void)postDemo1{
    //1.创建一个管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //设置成功/失败的block在哪个线程中调用
    manager.completionQueue = dispatch_queue_create("com.wk", DISPATCH_QUEUE_CONCURRENT);
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager.requestSerializer setValue:@"123" forHTTPHeaderField:@"x-access-id"];
    [manager.requestSerializer setValue:@"123" forHTTPHeaderField:@"x-signature"];
    




    //2.由管理者发起请求
    // 2.获取应用的版本号
//    NSString *currentV = infoDict[@"CFBundleShortVersionString"];
    
//    NSDictionary *parameter = @{
//                                @"mobile":@1.0
//                                };
    [manager POST:@"http://app.trade.51kuaimei.com/" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSString *result = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"%@",result);
        
        
        //把它保存到数据库
        //        NSLog(@"%@---%@",responseObject,[NSThread currentThread]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

/**
 *  获取验证码点击
 */
- (IBAction)getCaptcha:(id)sender {
    NSLog(@"%s", __func__);
    // 启动定时器,倒计时60秒
    [self startCaptchaWithSecond:60.0];
}
/**
 *  启动定时器
 *  @param second 倒计时的秒数
 */
- (void)startCaptchaWithSecond:(float)second {
    // 判断定时器为空
    if (!self.captchaTimer) {
        // 记录剩余倒计时为传入的数值秒
        self.captcha = second;
        // 让按钮的启用为关闭,禁止交互
        self.yanzmBtn.enabled = NO;
        // 创建定时器重复每间隔1秒执行captchaChange方法,并赋值到全局定义好的变量
        self.captchaTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(captchaChange) userInfo:nil repeats:YES];
        // 定时器启动
        [self.captchaTimer fire];
    }
    
}
// 计时器每秒调用事件
- (void)captchaChange {
    // 记录的秒数-1
    self.captcha --;
    // 设置按钮的标题为当前剩余秒数
//    [self.captchaBtn setTitle:[NSString stringWithFormat:@"重新发送:%zd秒" ,self.captcha] forState:UIControlStateNormal];
    if (self.segmentLbl.selectedSegmentIndex == 0) {
       //对显示密码按钮进行处理
    }else {
        [self.yanzmBtn setTitle:[NSString stringWithFormat:@"重新发送:%zd秒" ,self.captcha] forState:UIControlStateNormal];
    }
    // 判断倒计时小余等于0的时候
    if (self.captcha <= 0) {
        // 标题恢复
        [self.yanzmBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        // 按钮开启,可以交互点击
        self.yanzmBtn.enabled = YES;
        // 停止定时器
        [self stopCaptcha];
    }
}

/**
 *  停止定时器
 */
- (void)stopCaptcha {
    [self.captchaTimer invalidate];
    self.captchaTimer = nil;
}


/**
 *  控制器的View即将隐藏时
 */
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    // 停止定时器
    [self stopCaptcha];
}



//登录按钮的点击事件
- (IBAction)loginBtn:(id)sender {
    
//    [WKJieXiJson channels];
    
//    [self postDemo];

//    [self postDemo1];
    
//    以下逻辑正确，为了方便，暂时不让起作用
    // 如果用户名 1,密码 1 才能登录
    // 1.获取用户名和密码
//    NSString *userName = self.phoneNumTextField.text;
//    NSString *password = self.securtTextField.text;
//    
//    
//        if (userName.length == 0 ) {
//    
//            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请输入手机号码" message:nil preferredStyle:  UIAlertControllerStyleAlert];
//    
//            [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil        ]];
//    
//            //弹出提示框；
//            [self presentViewController:alert animated:true completion:nil];
//    
//    
//            // 可以点击
//            //        self.loginBtn.enabled = YES;
//    
//        } else if(userName.length  > 0 && userName.length <11){
//    
//            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请输入正确的手机号码" message:nil preferredStyle:  UIAlertControllerStyleAlert];
//    
//            [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil        ]];
//    
//            //弹出提示框；
//            [self presentViewController:alert animated:true completion:nil];
//        }else if(userName.length == 12 && password.length == 0 ){
//            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请输入密码" message:nil preferredStyle:  UIAlertControllerStyleAlert];
//    
//            [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil        ]];
//    
//            //弹出提示框；
//            [self presentViewController:alert animated:true completion:nil];
//        }
    
        
        

    // 2.判断
//    if ([userName isEqualToString:@"1"] && [password isEqualToString:@"1"]) {
//        
//        NSLog(@"执行登录操作");
//
//        
//        [UIApplication sharedApplication].keyWindow.rootViewController = [[WKTabBarController alloc] init];
//
//    
//        
//    } else {
//        
//        NSLog(@"用户名或密码错误");
//        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"用户名或密码错误" message:nil preferredStyle:  UIAlertControllerStyleAlert];
//        
//        [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil        ]];
//        
//        //弹出提示框；
//        [self presentViewController:alert animated:true completion:nil];
//
//    }
//    
    
//    
     [UIApplication sharedApplication].keyWindow.rootViewController = [[WKTabBarController alloc] init];
}



@end
