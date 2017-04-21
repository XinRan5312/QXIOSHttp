//
//  TestCategoryViewController.m
//  QXHTTP
//
//  Created by 新然 on 2017/4/6.
//  Copyright © 2017年 com.wrqx. All rights reserved.
//

#import "TestCategoryViewController.h"
#import "UIViewController+QXViewController.h"
#import "NeiBuCategory.h"

@interface TestCategoryViewController ()

@end

@implementation TestCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NeiBuCategory *nei=[[NeiBuCategory alloc] init];
    [nei.viewContrller testCategory];//因为在NeiBuCategory.h文件中扩展了UIViewController，添加了testCategory的方法所以可以在这个文件中使用
    //如果是在 NeiBuCategory.m文件扩展UIViewController，添加了testCategory的方法在这里就不能使用，因为是私有的只能在NeiBuCategory.m中使用
    
    [self getStarTime];//导入#import "UIViewController+QXViewController.h"才可以用
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
