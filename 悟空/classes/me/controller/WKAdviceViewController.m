//
//  WKAdviceViewController.m
//  悟空
//
//  Created by 宋钢强 on 16/8/17.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WKAdviceViewController.h"
#import "ZBHTextView.h"
@interface WKAdviceViewController ()
/** 自定义的textView */
@property(nonatomic, strong) ZBHTextView *textView;

@end

@implementation WKAdviceViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithRed:188/255.0 green:188/255.0 blue:188/255.0 alpha:1.0];
    self.navigationItem.title = @"意见反馈";
    
    [self setUpUI];
    
}

-(void)setUpUI{
    //添加文本框
    [self setupTextView];


    //添加提交按钮
    [self setupTiJiaoBtn];

}

- (void)setupTextView{
    
    ZBHTextView *textView = [[ZBHTextView alloc] init];
//    textView.backgroundColor = [UIColor greenColor];
    textView.frame = self.view.bounds;
    textView.frame = CGRectMake(0,0,self.view.bounds.size.width ,200);

    //设置可以上下拖动
    textView.alwaysBounceVertical = YES;
//    textView.delegate = self;
    textView.placeholder = @"我是占位文字....我是占位文字....我是占位文字....我是占位文字....我是占位文字....我是占位文字....哈哈哈";
    [self.view addSubview:textView];
    self.textView = textView;
    
//    图片
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 120, 60, 60);
//    btn.imageView.image = [UIImage imageNamed:@"photo_img"];
    [btn setImage:[UIImage imageNamed:@"photo_img"] forState:UIControlStateNormal];
    //选中状态下的图片

    [textView addSubview:btn];
    
    
    
}

-(void)setupTiJiaoBtn{

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(20, 210, self.view.bounds.size.width - 40, 44);
    btn.backgroundColor = [UIColor greenColor];
//    btn.titleLabel.text = @"提交";
    [btn setTitle:@"提交" forState:UIControlStateNormal];

    btn.imageView.image = [UIImage imageNamed:@"photo_img"];
    [self.view addSubview:btn];


}

- (void)cancel{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)post{
    //发表
}

#pragma mark -- UITextFieldDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //拖拽时 结束编辑 退出键盘
    [self.textView endEditing:YES];
}

//- (void)textViewDidChange:(UITextView *)textView{
//    //判读是否有文字  设置发表按钮的状态
//    self.navigationItem.rightBarButtonItem.enabled = textView.hasText;
//}

@end
