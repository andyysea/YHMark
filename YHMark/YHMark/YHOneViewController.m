//
//  YHOneViewController.m
//  YHMark
//
//  Created by junde on 2017/3/1.
//  Copyright © 2017年 junde. All rights reserved.
//

#import "YHOneViewController.h"
#import "ContentCenterView.h"

@interface YHOneViewController ()<ContentCenterViewDelegate>

@end

@implementation YHOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}


#pragma mark - ContentCenterViewDelegate
- (void)contentCenterView:(ContentCenterView *)centerView didClickButtonTag:(NSInteger)tag {
    
    NSLog(@"点中的标签的 tag --> %zd", tag);
}



#pragma mark - 设置界面元素
- (void)setupUI {
    self.title = @"自定义标签视图";
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *dataArray = @[@"呵呵",@"大家攻击力卡积分",@"测试",@"不要脸",@"小王是小狗",@"小王的爸爸去哪了",@"明天又放假了额",@"话说三国",@"如果有一天我走了",@"武松打死景阳冈老虎是假的",@"都不敢去景阳冈,老虎明明是自己快饿死了",@"哈哈哈",@"哎,不还是单身🐶一只"];
    
    
    ContentCenterView *markView = [[ContentCenterView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width - 30, 50) dataArr:dataArray maxWidth:self.view.bounds.size.width - 30];
//    markView.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    
    markView.myDelegate = self;
    
    markView.center = self.view.center;
    
    [self.view addSubview:markView];
    
}



@end



