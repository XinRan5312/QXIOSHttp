//
//  QXRACManager.m
//  QXHTTP
//
//  Created by 新然 on 2017/4/5.
//  Copyright © 2017年 com.wrqx. All rights reserved.
//

#import "QXRACManager.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
@implementation QXRACManager
-(RACSignal*)ceatOneRACSignal{
RACSignal *signal=[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    [subscriber sendNext:@"string"];
    [subscriber sendNext:@"qx"];
    return [RACDisposable disposableWithBlock:^{
        NSLog(@"signal dispose");
    }];
}];
    return signal;
}

-(RACDisposable*)creatRACDisposable:(RACSignal*)signal{
    
    return [signal subscribeNext:^(id x) {
        
        
    } error:^(NSError *error) {
        
        
    } completed:^{
        
        
    }];
}
@end
