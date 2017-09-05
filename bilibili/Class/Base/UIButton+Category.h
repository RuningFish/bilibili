//
//  UIButton+Category.h
//  bilibili
//
//  Created by admin on 17/9/3.
//  Copyright © 2017年 飞奔的小鲨鱼. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    WTBaseButtonTypeTop = 0,  // 图片在上 文字在下
    WTBaseButtonTypeLeft,     // 图片在左 文字在右
    WTBaseButtonTypeBottom,   // 图片在下 文字在上
    WTBaseButtonTypeRight     // 图片在右 文字在左
    
}WTBaseButtonType;

@interface UIButton (Category)

/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param type  titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)layoutButtonWithType:(WTBaseButtonType)type andSpace:(CGFloat)space;
@end
