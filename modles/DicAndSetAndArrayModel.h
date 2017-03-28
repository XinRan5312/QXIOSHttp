//
//  DicAndSetAndArrayModel.h
//  QXHTTP
//
//  Created by 新然 on 2017/3/27.
//  Copyright © 2017年 com.wrqx. All rights reserved.
//

#import <Foundation/Foundation.h>
@class StudentModle;
@class ClassesModel;
@interface DicAndSetAndArrayModel : NSObject
@property(nonatomic)NSString *name;
@property(nonatomic)NSArray<StudentModle*> *stuArray;
@property(nonatomic)NSDictionary<NSString*,ClassesModel*> *dicCls;
@property(nonatomic)NSSet<NSNumber*> *setNum;
@end
