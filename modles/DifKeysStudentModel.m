//
//  DifKeysStudentModel.m
//  QXHTTP
//
//  Created by 新然 on 2017/3/27.
//  Copyright © 2017年 com.wrqx. All rights reserved.
//

#import "DifKeysStudentModel.h"
/**
 在返回的Json中的key，跟实体类的属性不相同的情况下
 以下三个方法要重写
 
 */
@implementation DifKeysStudentModel

/*!
 *  1.该方法是 `字典里的属性Key` 和 `要转化为模型里的属性名` 不一样 而重写的
 *  前：模型的属性   后：字典里的属性
 */
+(nullable NSDictionary<NSString*,id>*)modelContainerPropertyMapper{

    return @{
             @"name" :@"n",
             @"age":@"a",
             @"uid":@"u"
             
             };
}


/*!
 *  2. 下面的两个方法 `字典里值`与`模型的值`类型不一样`需要转换`而重写的方法
 *   NSDate *time     dic[@"t"]是double类型的的秒数
 */

/// Dic -> model
-(BOOL)modelCustomTransformFromDictionary:(NSDictionary*)dic{
    return YES;
}

/// model -> Dic

-(BOOL)modelCustomTransformToDictionary:(NSMutableDictionary*)dic{
    return YES;
}


@end
