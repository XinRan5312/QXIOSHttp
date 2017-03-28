//
//  StudentModle.h
//  QXHTTP
//
//  Created by 新然 on 2017/3/27.
//  Copyright © 2017年 com.wrqx. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ClassesModel;
@interface StudentModle : NSObject
@property(nonatomic,copy)NSString *name;
@property(nonatomic) UInt64 uid;
@property(nonatomic)NSInteger age;
@property(nonatomic) ClassesModel *clsModel;
@end
