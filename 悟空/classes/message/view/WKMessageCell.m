//
//  WKMessageCell.m
//  悟空
//
//  Created by 宋钢强 on 16/8/15.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WKMessageCell.h"
#import "WKMessage.h"
//@property (nonatomic, copy) NSString *intro;
//@property (nonatomic, copy) NSString *time;
//@property (nonatomic, copy) NSString *name;
//@property (nonatomic, copy) NSString *icon;
//

@interface WKMessageCell ()


@property (weak, nonatomic) IBOutlet UIImageView *iconView;


@property (weak, nonatomic) IBOutlet UILabel *nameLbl;


@property (weak, nonatomic) IBOutlet UILabel *introLbl;


@property (weak, nonatomic) IBOutlet UILabel *timeLbl;



@end

@implementation WKMessageCell


+ (instancetype)cellWithTableView:(UITableView *)tableView {
    return [tableView dequeueReusableCellWithIdentifier:@"message"];
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    return self;
}
//@property (nonatomic, copy) NSString *intro;
//@property (nonatomic, copy) NSString *time;
//@property (nonatomic, copy) NSString *name;
//@property (nonatomic, copy) NSString *icon;

// 重写模型属性的set方法,在此方法中设置cell子控件的数据
-(void)setMessage:(WKMessage *)message{

    _message = message;
    
    _iconView.image = [UIImage imageNamed:message.icon];
    
    self.nameLbl.text = message.name;
    self.introLbl.text = message.intro;
    self.timeLbl.text = message.time;
    
    


}


@end
