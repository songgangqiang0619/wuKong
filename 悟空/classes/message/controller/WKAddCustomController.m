//
//  WKAddCustomController.m
//  悟空
//
//  Created by 宋钢强 on 16/8/12.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WKAddCustomController.h"
#import "Masonry.h"
#import "WKAddCustom.h"


@interface WKAddCustomController ()
//@property (nonatomic,strong) NSArray *plistArray;

@property (nonatomic, strong) UIButton *btn;


/**
 *  公司名称
 */
//companyName;
@property (weak, nonatomic) IBOutlet UITextView *companyNameText;

/**
 *  联系人
 */
//name;
@property (weak, nonatomic) IBOutlet UITextView *nameText;

/**
 *  联系电话
 */
//phoneNumber;
@property (weak, nonatomic) IBOutlet UITextView *phoneNumText;

/**
 *  所在位置
 */
//loaction;
@property (weak, nonatomic) IBOutlet UITextView *loctionText;

/**
 *  详细地址
 */
//detailLoc;
@property (weak, nonatomic) IBOutlet UITextView *detailLoc;

/**
 *  公司行业
 */
//hangYe;
@property (weak, nonatomic) IBOutlet UITextView *hangYeText;

/**
 *  日用量
 */
//num;

@property (weak, nonatomic) IBOutlet UITextView *numText;

@end

@implementation WKAddCustomController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"添加客户";
    
    self.tableView.tableFooterView = [[UIView alloc]init];

    

    
}

- (IBAction)sureBtnClick:(id)sender {
//    companyName;  name;  phoneNumber; loaction; detailLoc; hangYe;num;

    NSString *companyName = self.companyNameText.text;
    NSString *name = self.nameText.text;
    NSString *phoneNumber = self.phoneNumText.text;
    NSString *loaction = self.loctionText.text;
    NSString *detailLoc = self.detailLoc.text;
    NSString *hangYe = self.hangYeText.text;
    NSString *num = self.numText.text;

    WKAddCustom *addContact = [WKAddCustom contactWithcompanyName:companyName name:name phoneNumber:phoneNumber loaction:loaction detailLoc:detailLoc hangYe:hangYe num:num];

    // 3.将模型数据传给列表控制器
    // MARK: - 3.让自己的代理对象执行协议方法 代理   好处: 解耦
    if ([self.delegate respondsToSelector:@selector(addController:wantToAddContact:)]) {
        //
        [self.delegate addController:self wantToAddContact:addContact];
    }
    
    // 4.自己pop出去
    [self.navigationController popViewControllerAnimated:YES];


    
    
//    // 1.获取联系人数据
//    NSString *name = self.nameField.text;
//    NSString *phone = self.phoneField.text;
//    
//    // 2.需要将联系人转为模型
//    HMContact *addContact = [HMContact contactWithName:name phoneNumber:phone];
//    
//    // 3.将模型数据传给列表控制器
//    // MARK: - 3.让自己的代理对象执行协议方法 代理   好处: 解耦
//    if ([self.delegate respondsToSelector:@selector(addController:wantToAddContact:)]) {
//        //
//        [self.delegate addController:self wantToAddContact:addContact];
//    }
//    
//    
//    
//    // 4.自己pop出去
//    [self.navigationController popViewControllerAnimated:YES];
//    
//    

    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    

        if (indexPath.section == 0 && indexPath.row == 4) {
            
//            NSLog(@"省");
//            WKCustomController *customVC = [[WKCustomController alloc]init];
    
//            [self.navigationController pushViewController:customVC animated:YES];
    
        }

}



//-(NSArray *)plistArray{
//    
//    if (_plistArray == nil) {
//        
//        NSString *path = [[NSBundle mainBundle] pathForResource:@"addCustom" ofType:@"plist"];
//        _plistArray = [NSArray arrayWithContentsOfFile:path];
//    }
//    
//    return _plistArray;
//}
//
//
//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        return [super initWithStyle:UITableViewStyleGrouped];
//    }
//    return self;
//}
//
//
//#pragma mark - UITableView代理方法
//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return self.plistArray.count;
//}
//
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    
//    NSArray *rowArray = self.plistArray[section];
//    
//    return rowArray.count;
//}
//
//
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    static NSString *ID = @"cell";
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    
//    if (cell == nil) {
//        
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
//    }
//    
//    NSArray *rowArray = self.plistArray[indexPath.section];
//    
//    NSDictionary *dic = rowArray[indexPath.row];
//    if (indexPath.row == 4) {
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    }
//    cell.textLabel.text = dic[@"name"];
//    cell.imageView.image = [UIImage imageNamed:dic[@"icon"]];
//    
//    return cell;
//}
//
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    return 70;
//}






@end
