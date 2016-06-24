//
//  Person.h
//  XYRuntime
//
//  Created by 建星 on 16/6/24.
//  Copyright © 2016年 建星. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol personPlayDelegate <NSObject>

-(void)giveMeBall:(NSString *)ball;

@end

@interface Person : NSObject

@property(nonatomic,assign)id<personPlayDelegate> delegate;

@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *sex;
@property(nonatomic,assign)NSInteger age;
@property(nonatomic,assign)float height;
@property(nonatomic,copy)NSString *job;
@property(nonatomic,copy)NSString *native;

-(void)eat;
-(void)sleep;
-(NSString *)doSomeThing;
-(NSString *)doSomeOtherThing;



@end
