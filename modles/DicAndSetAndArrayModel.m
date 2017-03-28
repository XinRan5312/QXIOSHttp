//
//  DicAndSetAndArrayModel.m
//  QXHTTP
//
//  Created by 新然 on 2017/3/27.
//  Copyright © 2017年 com.wrqx. All rights reserved.
//

#import "DicAndSetAndArrayModel.h"
#import "StudentModle.h"
#import "ClassesModel.h"
@implementation DicAndSetAndArrayModel


//把数组里面带有对象的类型专在这个方法根据变量一一声明class
+(nullable NSDictionary<NSString*,id>*)modelContainerPropertyGenericClass{

    return @{
             @"stuArray": StudentModle.class,
             @"dicCls":ClassesModel.class,
             @"setNum" :NSNumber.class
             
             };
}


@end
