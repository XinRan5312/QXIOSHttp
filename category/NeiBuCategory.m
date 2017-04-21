//
//  NeiBuCategory.m
//  QXHTTP
//
//  Created by 新然 on 2017/4/6.
//  Copyright © 2017年 com.wrqx. All rights reserved.
//

#import "NeiBuCategory.h"


@interface NeiBuCategory()
//扩展其实就是分类的一个特例，就是没有名字，匿名的分类就是扩展，由于是在.m文件中声明的分类，所以是优化的，外面是看不到remove:这个方法的
-(void)remove:(id)value;

@end

@implementation NeiBuCategory

-(instancetype)init{
    if(self=[super init]){
        self.viewContrller=[[UIViewController alloc] init];
    return self;
    }else{
        return nil;
    
    }

    
}

-(void)add:(id)value{

    [_viewContrller testCategory];
}

-(void)remove:(id)value{

}

@end
