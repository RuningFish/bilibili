//
//  WTTabBar.h
//  bilibili
//
//  Created by admin on 17/9/3.
//  Copyright © 2017年 飞奔的小鲨鱼. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WTTabBar,WTTabBarItem;
@protocol WTTabBarDelegate <NSObject>

- (void)tabbar:(WTTabBar*)tabbar didClickWithIndex:(NSInteger )index;

@end

@interface WTTabBar : UIView

/** delegate */
@property (nonatomic, weak) id<WTTabBarDelegate> delegate;

+ (instancetype)tabBar;

- (void)selectItemWithIndex:(NSInteger)index;
@end
