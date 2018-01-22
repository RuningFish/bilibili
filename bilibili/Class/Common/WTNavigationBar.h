//
//  WTNavigationBar.h
//  bilibili
//
//  Created by admin on 17/9/6.
//  Copyright © 2017年 飞奔的小鲨鱼. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WTNavigationBar : UIView
/** 标题文字 */
@property (nonatomic, weak) UILabel * titleLabel;
/** 标题是一张图片 */
@property (nonatomic, strong) UIImage * centerImage;
/** 左边的Item */
@property (nonatomic, weak) UIButton * leftBarButtonItem;
/** 右边的Item */
@property (nonatomic, weak) UIButton * rightBarButtonItem;

@end
