//
//  AppDelegate.m
//  悟空
//
//  Created by 宋钢强 on 16/8/9.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "AppDelegate.h"
#import "WKTabBarController.h"
#import "WKGuideController.h"
#define LOGIN @"login"
#import "WKLoginController.h"
#import "AFNetworking.h"
#import <SMS_SDK/SMSSDK.h>


@interface AppDelegate ()

@end

@implementation AppDelegate
#pragma mark - 判断新特性界面的逻辑
- (BOOL)isNewVersion {
    
    // MARK: - 显示新特性控制器的逻辑分析 -> 根据版本号进行判断
    // - 当前应用的版本号
    // 1.获取info.plist文件的所有信息
    NSDictionary *infoDict = [NSBundle mainBundle].infoDictionary;
    // 2.获取应用的版本号
    NSString *currentV = infoDict[@"CFBundleShortVersionString"];
    
    // - 旧的版本号,从偏好设置中读取
    // 1.获取偏好设置对象
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // 2.读取数据 -> 旧的版本号
    NSString *oldV = [defaults objectForKey:@"app_version"]; // 读取应用的版本信息
    
    // - 比较版本号
    // 如果新的 == 旧的,就不需要显示新特性
    if ([currentV isEqualToString:oldV]) {
        //        NSLog(@"不需要显示新特性界面");
        return NO;
        
    } else {
        
        // 否则需要显示,需要将新的版本号存起来
        //        NSLog(@"显示新特性,并存储当前的版本号");
        
        // MARK: - 存储版本信息
        // 1.获取偏好设置对象
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        // 2.存储数据
        [defaults setObject:currentV forKey:@"app_version"];
        // 3.同步
        [defaults synchronize];
        
        return YES;
    }
    
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    [SMSSDK registerApp:@"16a12ed758b30" withSecret:@"b3670518ee6bfc5810f2352208642523"];
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setBool:YES forKey:LOGIN];
    
    // 1.创建窗口
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    // 2.设置窗口的根控制器
//    WKTabBarController *tabBarVC = [[WKTabBarController alloc]init];
//    self.window.rootViewController = tabBarVC;
    
    if ([self isNewVersion]) {
        // 是新版本
        self.window.rootViewController = [[WKGuideController alloc] init];
        
    } else {
        
        // 不是新版本
//        self.window.rootViewController = [[WKTabBarController alloc]init];
//        self.window.rootViewController = [[WKLoginController alloc]init];

        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"login" bundle:nil];
        WKLoginController *vc = [sb instantiateInitialViewController];
        
        
        self.window.rootViewController = vc;

    }
    
    // 3.显示窗口
    [self.window makeKeyAndVisible];
    
    [self networkListener];
    
    return YES;

}


- (void)networkListener{
    //1.创建一个联网检测的单例
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    
    //2.当网络状态改变之后
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        /**
         AFNetworkReachabilityStatusUnknown          = -1, //未知网络
         AFNetworkReachabilityStatusNotReachable     = 0, //不能达到
         AFNetworkReachabilityStatusReachableViaWWAN = 1, //3G/4G 蜂窝数据
         AFNetworkReachabilityStatusReachableViaWiFi = 2, //WiFi
         */
        NSLog(@"%zd",status);
        
    
    }];
    
    //3.开始监听
    [manager startMonitoring];
}







- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
