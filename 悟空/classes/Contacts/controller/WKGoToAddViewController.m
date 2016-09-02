//
//  WKGoToAddViewController.m
//  悟空
//
//  Created by 宋钢强 on 16/8/16.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WKGoToAddViewController.h"
#import "WKChangeTableViewController.h"
#import "WKYaoQingGysTableViewController.h"

@interface WKGoToAddViewController ()
@property (weak, nonatomic) IBOutlet UIView *yaoqinggysView;

@property (weak, nonatomic) IBOutlet UITableView *goToTableView;


@end

@implementation WKGoToAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];

// 供应商中调到邀请记录界面
    UITapGestureRecognizer *tapGeture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goDo:)];
    [self.yaoqinggysView addGestureRecognizer:tapGeture];

    self.navigationItem.title = @"供应商";

//    self.goToTableView.delegate = self;
//    self.goToTableView.dataSource = self;
    
    
    
}

    
    -(void)goDo:(UITapGestureRecognizer *)recognizer{

        UIStoryboard *sbYQ = [UIStoryboard storyboardWithName:@"WKYaoQingGysTableViewController" bundle:nil];
        WKYaoQingGysTableViewController *sbYQvc = [sbYQ instantiateInitialViewController];
        
        [self.navigationController pushViewController:sbYQvc animated:YES];
        
    }

//    UITapGestureRecognizer *tapGeture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(barAction:)];
//    [bar addGestureRecognizer:tapGeture];

//    bar.userInteractionEnabled = NO;




//-(void)barAction:(UITapGestureRecognizer *)recognizer{
//
//
//    NSLog(@"shishi");
//}

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 0;
//    
//}




@end
