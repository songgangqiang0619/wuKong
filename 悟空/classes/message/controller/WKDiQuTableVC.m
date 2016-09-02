//
//  WKDiQuTableVC.m
//  悟空
//
//  Created by 宋钢强 on 16/8/31.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WKDiQuTableVC.h"
#import "WKJieXiJson.h"

@interface WKDiQuTableVC ()
@property (nonatomic, strong) NSArray *locData;

@end

@implementation WKDiQuTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.locData = [WKJieXiJson channels];

}

#pragma mark - UITableView代理方法

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return self.locData.count;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    WKMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"message"];
//    
//    cell.message = self.plistArray1[indexPath.row];
//    
//    return cell;
    
    return nil;
    
}




@end
