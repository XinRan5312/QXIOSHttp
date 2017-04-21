//
//  NeiBuCategory.h
//  QXHTTP
//
//  Created by 新然 on 2017/4/6.
//  Copyright © 2017年 com.wrqx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIViewController()
-(void)testCategory;
@end

@implementation UIViewController

-(void)testCategory{


}

@end

@interface NeiBuCategory : NSObject
@property(nonatomic,strong)UIViewController *viewContrller;

-(void)add:(id) value;

@end
