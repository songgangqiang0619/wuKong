//
//  WKJieXiJson.h
//  悟空
//
//  Created by 宋钢强 on 16/8/26.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WKJieXiJson : NSObject

@property (nonatomic, copy) NSString *tid;

@property (nonatomic, copy) NSString *pid;


@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *level;



+ (NSArray *)channels;
@end
