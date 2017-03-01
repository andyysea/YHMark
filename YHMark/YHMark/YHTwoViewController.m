
//
//  YHTwoViewController.m
//  YHMark
//
//  Created by junde on 2017/3/1.
//  Copyright © 2017年 junde. All rights reserved.
//

#import "YHTwoViewController.h"

@interface YHTwoViewController ()

@end

@implementation YHTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

#pragma mark - 设置界面元素
- (void)setupUI {
    self.title = @"UICollectionView 标签";
    self.view.backgroundColor = [UIColor whiteColor];
}

@end
