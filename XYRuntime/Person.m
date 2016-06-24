//
//  Person.m
//  XYRuntime
//
//  Created by 建星 on 16/6/24.
//  Copyright © 2016年 建星. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>
@implementation Person


//注意：归档解档需要遵守<NSCoding>协议，实现以下两个方法
- (void)encodeWithCoder:(NSCoder *)encoder{
    //归档存储自定义对象
    unsigned int count = 0;
    //获得指向该类所有属性的指针
    objc_property_t *properties = class_copyPropertyList([Person class], &count);
    for (int i =0; i < count; i ++) {
        //获得
        objc_property_t property = properties[i];
        //根据objc_property_t获得其属性的名称--->C语言的字符串
        const char *name = property_getName(property);
        NSString *key = [NSString stringWithUTF8String:name];
        // 编码每个属性,利用kVC取出每个属性对应的数值
        [encoder encodeObject:[self valueForKeyPath:key] forKey:key];
    }
}

- (instancetype)initWithCoder:(NSCoder *)decoder{
    //归档存储自定义对象
    unsigned int count = 0;
    //获得指向该类所有属性的指针
    objc_property_t *properties = class_copyPropertyList([Person class], &count);
    for (int i =0; i < count; i ++) {
        objc_property_t property = properties[i];
        //根据objc_property_t获得其属性的名称--->C语言的字符串
        const char *name = property_getName(property);
        NSString *key = [NSString stringWithUTF8String:name];
        //解码每个属性,利用kVC取出每个属性对应的数值
        [self setValue:[decoder decodeObjectForKey:key] forKeyPath:key];
    }
    return self;
}


-(void)eat
{
    NSLog(@"吃饭");
}
-(void)sleep
{
    NSLog(@"睡觉");
}
-(NSString *)doSomeThing
{
    return @"我要去爬山";
}
-(NSString *)doSomeOtherThing
{
    return @"我要去唱歌";
}


@end
