//
//  WKChangeCustomController.m
//  悟空
//
//  Created by 宋钢强 on 16/8/19.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WKChangeCustomController.h"
#import "WKAddCustom.h"
@interface WKChangeCustomController ()
//联系人
@property (weak, nonatomic) IBOutlet UITextView *nameText;
//联系电话
@property (weak, nonatomic) IBOutlet UITextView *phoneNum;

//公司名称
@property (weak, nonatomic) IBOutlet UITextView *companyName;

//所在位置

@property (weak, nonatomic) IBOutlet UITextView *location;

//详细地址
@property (weak, nonatomic) IBOutlet UITextView *detailLoc;

//公司行业
@property (weak, nonatomic) IBOutlet UITextView *hangYe;

//日用量
@property (weak, nonatomic) IBOutlet UITextView *num;

@property (weak, nonatomic) IBOutlet UIButton *sureBtn;


@end

@implementation WKChangeCustomController

- (void)viewDidLoad {
    [super viewDidLoad];

    // MARK: - 设置数据
    self.nameText.text = self.editCt.name;
    self.phoneNum.text = self.editCt.phoneNumber;
    self.location.text = self.editCt.loaction;
    self.hangYe.text = self.editCt.hangYe;
    self.num.text = self.editCt.num;
    self.companyName.text = self.editCt.companyName;
    self.detailLoc.text = self.editCt.detailLoc;
    
    // MARK: - 监听保存按钮的点击
    [self.sureBtn addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];

}
#pragma mark - 当点击保存按钮的时候调用
- (void)sureBtnClick {
    
    // 1.修改模型数据
//    self.editCt.name = self.nameText.text;
//    self.editCt.phoneNumber = self.phoneNum.text;
    
    
    self.editCt.name = self.nameText.text ;
    self.editCt.phoneNumber =  self.phoneNum.text;
    self.editCt.loaction= self.location.text;
    self.editCt.hangYe = self.hangYe.text;
     self.editCt.num = self.num.text;
     self.editCt.companyName = self.companyName.text;
     self.editCt.detailLoc= self.detailLoc.text;

    
    // 2.让列表刷新 // 通过代理让列表刷新
    if ([self.delegate respondsToSelector:@selector(didFinishEditedContact:)]) {
        [self.delegate didFinishEditedContact:self];
    }
    
    
    // 3.返回
    [self.navigationController popViewControllerAnimated:YES];
    
    
}



@end
