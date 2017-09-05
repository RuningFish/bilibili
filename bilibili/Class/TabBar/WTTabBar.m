//
//  WTTabBar.m
//  bilibili
//
//  Created by admin on 17/9/3.
//  Copyright © 2017年 飞奔的小鲨鱼. All rights reserved.
//

#import "WTTabBar.h"
#import "WTTabBarButton.h"
#import "Const.h"
#import "UIButton+Category.h"
@implementation WTTabBar

+ (instancetype)tabBar{
    
    __block WTTabBar * instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
        NSLog(@"jkldsjlf");
    });
    return instance;
}


- (instancetype)init{
    
    if (self = [super init]) {
        
        NSInteger count = 5;
        CGFloat width = WTScreenWidth / count;
        CGFloat height = 49;
        
        for (int i = 0; i < count; i ++) {
            
            WTTabBarButton * button = [WTTabBarButton buttonWithType:UIButtonTypeCustom];
            button.backgroundColor = WTRandomColor;
            button.frame = CGRectMake(i*width, 0, width, height);
            [button setTitle:@"首页" forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:@"home_home_tab"] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:13];
            [button layoutButtonWithType:WTBaseButtonTypeTop andSpace:5];
            [button addTarget:self action:@selector(tabBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
        }
    }
    
    return self;
}

- (void)tabBarButtonClick:(WTTabBarButton *)button{
    
    NSLog(@"button");
    if ([self.delegate respondsToSelector:@selector(tabbar:didClickWithButton:)]) {
        [self.delegate tabbar:self didClickWithButton:button];
    }
}
@end
