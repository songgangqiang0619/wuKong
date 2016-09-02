//
//  WKCoalList.m
//  悟空
//
//  Created by 宋钢强 on 16/8/24.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WKCoalList.h"

@implementation WKCoalList

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

+(instancetype)coalListWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];

}

@end
