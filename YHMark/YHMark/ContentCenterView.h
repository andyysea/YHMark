//
//  ContentCenterView.h
//  DemoButton
//
//  Created by junde on 2017/2/27.
//  Copyright © 2017年 junde. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ContentCenterView;

@protocol ContentCenterViewDelegate <NSObject>

- (void)contentCenterView:(ContentCenterView *)centerView didClickButtonTag:(NSInteger)tag;

@end



@interface ContentCenterView : UIView

@property (nonatomic, weak) id <ContentCenterViewDelegate>myDelegate;

/**
 本视图是根据内容来判断,有多少标签就有多大,主要是宽度的判断,
 - 传入数据创建视图,再把创建出来的视图对象设置中心点 X 与父视图相同就可以
 */


/**
 创建宽度为内容最大宽度的自定义的标签视图
 如果要设置在父视图上面居中,只需要修改此视图在父视图上面的中心位置即可

 @param frame     传入的frame, 其中'宽度'最好设置为在父视图上能达到的最大宽度,本自定义视图会根据内容在最后计算本视图自身最合适的宽度
 @param dataArray 传入的标签文字数组,每一个标签的文字不宜超过此视图最大宽度
 @param maxWidth  此定义的标签视图在父视图上可以设置的最大宽度
 @return 宽度为内容最大宽度的自定义的标签视图
 */
- (instancetype)initWithFrame:(CGRect)frame dataArr:(NSArray *)dataArray maxWidth:(CGFloat)maxWidth;


@end
