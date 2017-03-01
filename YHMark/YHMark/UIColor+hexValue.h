//
//  UIColor+hexValue.h
//  YHMark
//
//  Created by junde on 2017/3/1.
//  Copyright © 2017年 junde. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (hexValue)

+ (UIColor *)colorWithHexString:(NSString *)color;

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;


@end
