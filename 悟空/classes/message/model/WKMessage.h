//
//  WKMessage.h
//  悟空
//
//  Created by 宋钢强 on 16/8/15.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WKMessage : NSObject

@property (nonatomic, copy) NSString *intro;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;


- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)groupWithDict:(NSDictionary *)dict;

@end
