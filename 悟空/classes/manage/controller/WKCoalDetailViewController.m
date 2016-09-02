//
//  WKCoalDetailViewController.m
//  悟空
//
//  Created by 宋钢强 on 16/8/23.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WKCoalDetailViewController.h"
#import "WKCoalListCell.h"
#import "WKCoalDetailCell.h"
#import "WKAddCoalTableViewController.h"
#import "WKAddCoal.h"

@interface WKCoalDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *coalDetailTableView;
@property (nonatomic,strong) NSArray *plistArray;
//存放按钮的view
@property (weak, nonatomic) IBOutlet UIView *bottomView;


@end

@implementation WKCoalDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.coalDetailTableView.delegate = self;
    self.coalDetailTableView.dataSource = self;

    self.navigationItem.title = @"煤炭详情";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"修改煤炭" style:UIBarButtonItemStylePlain target:self action:@selector(changeInfo)];

//    [self setUpBtns];
//    [self initButton:self.btn1];
    
}

-(void)changeInfo{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"WKAddCoal" bundle:nil];
    WKAddCoalTableViewController *vc = [sb instantiateInitialViewController];
    
    [self.navigationController pushViewController:vc animated:YES];
    
//    NSLog(@"...");
    
}

//添加底部按钮
-(void)initButton:(UIButton*)btn{
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居中显示
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(btn.imageView.frame.size.height ,-btn.imageView.frame.size.width, 0.0,0.0)];//文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0.0, 0.0,0.0, -btn.titleLabel.bounds.size.width)];//图片距离右边框距离减少图片的宽度，其它不边
}
-(void)setUpBtns{
 
    CGFloat width = [UIScreen mainScreen].bounds.size.width /3;
    
    //生成一个btn1对象，不需要alloc和init，而是直接用内置的工厂方法，有很多可CMD+点击查看
    UIButton *btn1=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    //设置位置和宽高
    
    btn1.frame=CGRectMake(0, 0, width, 30);
    //设置按钮的文字，状态有好几种常用的时Normal和Highlighted（点击时状态），可CMD+点击查看
    [btn1 setTitle:@"点我啊！" forState:UIControlStateNormal];
    //设置点击时的文本
    [btn1 setTitle:@"我被点了！" forState:UIControlStateHighlighted];
    //设置文字颜色
    [btn1 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    //设置点击时按钮背景颜色，呃，完全不起作用，即无效果
    [btn1 setTintColor:[UIColor purpleColor]];
    //点击时按钮发光，就是在按钮中间发亮光，这个有效果
    btn1.showsTouchWhenHighlighted=YES;
    //设置tag标签，唯一标记用，可用于分辨是哪个按钮控件
    btn1.tag=1;
    //设置背景颜色
    btn1.backgroundColor=[UIColor redColor];
    //现在高版本的iOS里这个方法会让人抓狂，因为我们发现，不设置背景时，圆角按钮没有边框，所以上面设置frame其实意义不大
    //设置了背景或者图片后，背景是矩形，说好的圆角呢？坑爹呢！
    //所以现在大多数开发都是用UIButtonTypeCustom，而不是UIButtonTypeRoundedRect
    
    //最重要的添加触发事件用户交互
    //self是指调用哪个对象的方法
    //btnClick:是调用的方法，btnClick和btnClick:不一样，后者表示有参数
    //UIControlEventTouchUpInside是触发事件，有很多，可以CMD+点击查看
    //这里三个参数都可以随意更换，比如新建一个类Hi，在类里定义一个方法-(void)report;
    //然后在此文件引入Hi.h头文件，在这里实例化一个对象hi1，然后就可以用hi1代替self,用report代替btnClick
    //意思就是点击后调用的是hi1对象里面的report方法
    [btn1 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    //再增加一个按钮
    UIButton *btn2=[UIButton buttonWithType:UIButtonTypeContactAdd];
    btn2.frame=CGRectMake(width, 0, width, 30);
    //这个增加联系人按钮其实也是一个矩形，和上面的一样，都是继承自UIControl，而后者又继承自UIView，所以是矩形
    //虽然按钮就一点点大，但点击整个矩形区域都是相当于点击按钮
    btn2.backgroundColor=[UIColor greenColor];
    //设置标签
    btn2.tag=2;
    //增加事件：和btn1调用同一个方法，但问题是我们如果需要区分是哪个按钮的话，就需要用到tag，并且把控件作为参数传递给btnClick
    [btn2 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    //再增加一个最常用的Custom按钮，其他按钮自己尝试
    UIButton *btn3=[UIButton buttonWithType:UIButtonTypeCustom];
    btn3.frame=CGRectMake(width *2 , 0 , width, 30);
    btn3.backgroundColor=[UIColor redColor];
    btn3.tag=3;
    [btn3 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    //设置图片背景被点击时变暗（但没有图片背景时则无效果）
    btn3.adjustsImageWhenHighlighted=YES;
    //所以，增加图片方式之一是增加背景图片，这个图片如小会被放大充满整个背景
    [btn3 setBackgroundImage:[UIImage imageNamed:@"logo.png"] forState:UIControlStateNormal];
    //还有一种增加图片的方式，是在按钮上面加而不是背景，这种方式不会缩放图片，而且会居中
    [btn3 setImage:[UIImage imageNamed:@"logo.png"] forState:UIControlStateNormal];
    //设置按钮文字，增加的文字会和setImage图片一并居中，图片在左边，文字紧随其后
    [btn3 setTitle:@"自定义按钮" forState:UIControlStateNormal];
    //如果需要重新排版这个图片和按钮文字的位置，则需要重写UIButton类里面的两个函数，点击UIButton可查看
    //- (CGRect)titleRectForContentRect:(CGRect)contentRect;文字相对于按钮的位置
    //- (CGRect)imageRectForContentRect:(CGRect)contentRect;图片相对于按钮的位置
    //第一步：可以重新定义一个UIButton类叫myButton，在.m里重写如下函数
    //- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    //    return CGRectMake(50, 25, 100, 40);
    //}
    //- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    //    return CGRectMake(150, 25, 40, 40);
    //}
    //第二步，在这个文件中引入myButton.h头文件，然后实例化btn3的时候，用myButton，而不用原始的UIButton
    //myButton相当于稍微定制了一下原生的UIButton，所以前者实例出得对象也就具有定制效果
    //这种方式仅对UIButtonTypeCustom有效，其他无效
    
    //把三个按钮显示出来
    [self.bottomView addSubview:btn1];
    [self.bottomView addSubview:btn2];
    [self.bottomView addSubview:btn3];

}

-(void)btnClick:(id)sender{
    //把传递过来的控件参数转化成按钮
    UIButton *btn=(UIButton *)sender;
    //把btn.tag转化成整型
    NSLog(@"OMG,it is %i",(int)btn.tag);
}

#pragma mark - 数据源

-(NSArray *)plistArray{
    
    if (_plistArray == nil) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"coalDetail" ofType:@"plist"];
        _plistArray = [NSArray arrayWithContentsOfFile:path];
    }
    
    return _plistArray;
}


#pragma mark - UITableView代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.plistArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSArray *rowArray = self.plistArray[section];
    
    return rowArray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WKCoalDetailCell *cell = [WKCoalDetailCell cellWithTableView:tableView andIndexPath:indexPath];
//    NSArray *rowArray = self.coalsArrM[indexPath.section];
//    WKAddCoal *addCoal = rowArray[indexPath.row];
//    WKAddCoal *addCoal = self.coalsArrM[indexPath.section];
//    NSDictionary *dic = rowArray[indexPath.row];

    
    if (indexPath.section == 0) {
    
//        cell.coalNameLbl.text = dic[@"coalName"];
//        cell.coalNumLbl.text = dic[@"coalNum"];
//        cell.coalPriceLbl.text = dic[@"coalPrice"];
//        cell.numLbl.text = dic[@"num"];
        cell.coalNameLbl.text = self.addCoal.coalName;
        cell.coalNumLbl.text = self.addCoal.coalXiaoShouJia;
        cell.coalPriceLbl.text = self.addCoal.coalXiaoShouJia;
        cell.numLbl.text = self.addCoal.coalXiaoShouJia;

        
        
    }
    
    if (indexPath.section == 1  ){

//        //煤炭名称
        cell.coalNameLblRight.text = self.addCoal.coalName;
//        //煤炭用途
        cell.yongTuLbl.text = self.addCoal.coalYongTu;
//        //煤炭来源
        cell.laiYuanLbl.text = self.addCoal.coalLaiYuan;

//        //煤炭加工
        cell.jaiGongLbl.text = self.addCoal.coalJiaGong;

//        //煤矿
        cell.meiKuang.text = self.addCoal.coalMeiKuang;

//        //日供货量
        cell.gongHuoLiang.text = self.addCoal.coalGongHuoLiang;

//        //发货地点
        cell.faHuoPlace.text = self.addCoal.coalCangDi;

        
        
    }
    if ( indexPath.section == 3 ){
        
//        cell.customNum.text = dic[@"customNum"];
        
    }


    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.section == 0) {

        return 143;

    }

    return 44;

}




@end
