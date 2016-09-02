//
//  UIView+HMExt.m
//  69-UIView分类
//
//  Created by 韩萌 on 16/5/10.
//  Copyright © 2016年 hanmeng. All rights reserved.
//

#import "UIView+HMExt.h"
#import "UIView+HMExt.h"
@implementation UIView (HMExt)

-(void)setX:(CGFloat)x{

    // 1.取出frame
    CGRect frame = self.frame;
    
    // 2.修改frame
    frame.origin.x = x;
    
    // 3.赋值
    self.frame = frame;
}

-(CGFloat)x{
    
    return self.frame.origin.x;
}

-(void)setY:(CGFloat)y{

    CGRect frame = self.frame;
    
    frame.origin.y = y;
    
    self.frame = frame;
}

-(CGFloat)y{

    return self.frame.origin.y;
    
}

-(void)setWidth:(CGFloat)width{
    
    CGRect frame = self.frame;
    
    frame.size.width = width;
    
    self.frame = frame;
}

-(CGFloat)width{

    return self.frame.size.width;
}

-(void)setHeight:(CGFloat)height{

    CGRect frame = self.frame;
    
    frame.size.height = height;
    
    self.frame = frame;
}

-(CGFloat)height{

    return self.frame.size.height;
}
@end
