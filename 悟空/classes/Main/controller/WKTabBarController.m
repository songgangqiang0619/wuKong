//
//  WKTabBarController.m
//  悟空
//
//  Created by 宋钢强 on 16/8/9.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WKTabBarController.h"
#import "WKMessageController.h"
#import "WKContactsController.h"
#import "WKManageController.h"
#import "WKMeController.h"
#import "WKNavigationController.h"

@interface WKTabBarController ()

@end

@implementation WKTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self setUpAllChildViewController];
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"WKMessageController" bundle:nil];
    WKMessageController *ovc = [sb instantiateInitialViewController];
    

    WKMessageController *oneVC = ovc;
    [self addChildVC:oneVC imageName:@"消息－灰" selectImage:@"消息－绿" title:@"消息"];
    
    
    WKContactsController *twoVC = [[WKContactsController alloc]init];
    [self addChildVC:twoVC imageName:@"通讯录－灰" selectImage:@"通讯录－绿" title:@"通讯录"];
    
    WKManageController *threeVC = [[WKManageController alloc]init];
    [self addChildVC:threeVC imageName:@"管理－灰" selectImage:@"管理－绿" title:@"管理"];
    
    WKMeController *fourVC = [[WKMeController alloc]init];
    [self addChildVC:fourVC imageName:@"我－灰" selectImage:@"我－绿" title:@"我"];
    
    }



#pragma mark - 给tabbarController添加子控制器
-(void)addChildVC:(UIViewController *)childVC imageName:(NSString *)imageName selectImage:(NSString *)selectImageName title:(NSString *)title{
    //    childVC.tabBarItem.title = title;
    //    childVC.navigationItem.title = title;
    childVC.title = title;
    
    //设置tabbaritem文字的颜色
    [childVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:14/255.0 green:180/255.0 blue:0/255.0 alpha:1.0]} forState:UIControlStateSelected];
    
    //图片
    childVC.tabBarItem.image = [UIImage imageNamed:imageName];
    
    //不让图片渲染成蓝色
    UIImage *selectImage = [[UIImage imageNamed:selectImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //选中后的图片
    childVC.tabBarItem.selectedImage = selectImage;
    
    WKNavigationController *nav = [[WKNavigationController alloc] initWithRootViewController:childVC];
    [self addChildViewController:nav];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
