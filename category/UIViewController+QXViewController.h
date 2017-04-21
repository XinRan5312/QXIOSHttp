//
//  UIViewController+QXViewController.h
//  QXHTTP
//
//  Created by 新然 on 2017/4/6.
//  Copyright © 2017年 com.wrqx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (QXViewController)
//分类中只能声明方法  需要使用这个多加的方法只要在使用的地方导入#import "UIViewController+QXViewController.h"就可以了
//如果只导入UIViewController.h是不行的，是不会看到分类中新加的方法的，因为分类，跟原类 没有写在同一个object-c file里
//NSString就可以，因为系统把它所有的分类都写在了NSString这个file里了
-(NSInteger)getStarTime;

@end
