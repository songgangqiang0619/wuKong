//
//  WKAddCustom.m
//  悟空
//
//  Created by 宋钢强 on 16/8/18.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WKAddCustom.h"
#define HM_CTNAME @"HM_CTNAME"
#define HM_CTNUMBER @"HM_CTNUMBER"
#define HM_CTcompanyName @"HM_CTcompanyName"
#define HM_CTloaction @"HM_CTloaction"
#define HM_CTdetailLoc @"HM_CTdetailLoc"
#define HM_CThangYe @"HM_CThangYe"
#define HM_CTnum @"HM_CTnum"




@implementation WKAddCustom

#pragma mark - 归档解档的协议方法
// 归档
- (void)encodeWithCoder:(NSCoder *)aCoder {
//    addCustom.companyName = companyName;
//    addCustom.name = name;
//    addCustom.phoneNumber = phoneNum;
//    addCustom.loaction = loaction;
//    addCustom.detailLoc = detailLoc;
//    addCustom.hangYe = hangYe;
//    addCustom.num = num;

    
    [aCoder encodeObject:self.name forKey:HM_CTNAME];
    [aCoder encodeObject:self.phoneNumber forKey:HM_CTNUMBER];
    
    [aCoder encodeObject:self.companyName forKey:HM_CTcompanyName];
    [aCoder encodeObject:self.loaction forKey:HM_CTloaction];
    [aCoder encodeObject:self.detailLoc forKey:HM_CTdetailLoc];
    [aCoder encodeObject:self.hangYe forKey:HM_CThangYe];
    [aCoder encodeObject:self.num forKey:HM_CTnum];


    
}

// 解档
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    if (self = [super init]) {
        self.name = [aDecoder decodeObjectForKey:HM_CTNAME];
        self.phoneNumber = [aDecoder decodeObjectForKey:HM_CTNUMBER];
        self.companyName = [aDecoder decodeObjectForKey:HM_CTcompanyName];
        
        self.loaction = [aDecoder decodeObjectForKey:HM_CTloaction];
        self.detailLoc = [aDecoder decodeObjectForKey:HM_CTdetailLoc];
        self.hangYe = [aDecoder decodeObjectForKey:HM_CThangYe];
        self.num = [aDecoder decodeObjectForKey:HM_CTnum];

        
        
        
    }
    return self;
}
+ (instancetype)contactWithcompanyName:(NSString *)companyName name:(NSString *)name phoneNumber:(NSString *)phoneNum loaction:(NSString *)loaction detailLoc:(NSString *)detailLoc hangYe:(NSString *)hangYe num:(NSString *)num{
    WKAddCustom *addCustom = [[self alloc] init];
    addCustom.companyName = companyName;
    addCustom.name = name;
    addCustom.phoneNumber = phoneNum;
    addCustom.loaction = loaction;
    addCustom.detailLoc = detailLoc;
    addCustom.hangYe = hangYe;
    addCustom.num = num;

    return addCustom;


}


@end
