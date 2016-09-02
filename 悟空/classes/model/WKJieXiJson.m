//
//  WKJieXiJson.m
//  悟空
//
//  Created by 宋钢强 on 16/8/26.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WKJieXiJson.h"

@implementation WKJieXiJson

#pragma mark - 和频道URL相关
+ (instancetype)channelWithDict:(NSDictionary *)dict{
    id obj = [[self alloc] init];
    
    //利用KVC进行赋值
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

+ (NSArray *)channels{
    //1.去加载我们的topic_news.json
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"address.json" ofType:nil];
    
    //2.再将topic_news.json转成二进制
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    //3.调用NSJSONXXXX,将其转成数组
    NSArray *dictArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];

    
    //5.遍历字典数组,取出每一个字典,转成模型
    NSMutableArray *jsons = [NSMutableArray array];
    for (NSDictionary *dict in dictArray) {
        //5.1 字典转模型
        WKJieXiJson *json = [WKJieXiJson channelWithDict:dict];
        
        //5.2 将转好的模型,添加到模型
        [jsons addObject:json];
    }
    return jsons;
}


@end
