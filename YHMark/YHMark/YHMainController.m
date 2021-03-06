//
//  YHMainController.m
//  YHMark
//
//  Created by junde on 2017/3/1.
//  Copyright © 2017年 junde. All rights reserved.
//

#import "YHMainController.h"
#import "YHOneViewController.h"
#import "YHTwoViewController.h"


@interface YHMainController ()

@end

@implementation YHMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}


#pragma mark - 设置界面元素
- (void)setupUI {
    
    YHOneViewController *oneVC = [YHOneViewController new];
    oneVC.title = @"自定义标签视图";
    UINavigationController *oneNav = [[UINavigationController alloc] initWithRootViewController:oneVC];
    
    YHTwoViewController *twoVC = [YHTwoViewController new];
    twoVC.title = @"UICollectionView 标签";
    UINavigationController *twoNav = [[UINavigationController alloc] initWithRootViewController:twoVC];
    
    self.viewControllers = @[oneNav, twoNav];
}





@end
