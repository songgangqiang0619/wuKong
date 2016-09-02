//
//  WKMessage.m
//  悟空
//
//  Created by 宋钢强 on 16/8/15.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WKMessage.h"

@implementation WKMessage

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        
        [self setValuesForKeysWithDictionary:dict];
    
    }
    return self;
}


-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

+ (instancetype)groupWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
