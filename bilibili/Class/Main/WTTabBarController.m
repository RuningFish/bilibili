//
//  WTTabBarController.m
//  bilibili
//
//  Created by admin on 17/9/3.
//  Copyright © 2017年 飞奔的小鲨鱼. All rights reserved.
//

#import "WTTabBarController.h"
#import "WTHomeViewController.h"
#import "WTPartitionViewController.h"
#import "WTDynamicViewController.h"
#import "WTDiscoverViewController.h"
#import "WTMineViewController.h"
#import "WTTabBar.h"
#import <objc/runtime.h>
@interface WTTabBarController ()<WTTabBarDelegate>

@end

@implementation WTTabBarController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 0.添加自定义的tabbar
    WTTabBar * tabbar = [WTTabBar tabBar];
    tabbar.frame = self.tabBar.bounds;
    [self.tabBar addSubview:tabbar];
    tabbar.delegate = self;
    
    // 1.添加子控制器
    NSArray * childControllers = @[@"WTHomeViewController",
                                   @"WTPartitionViewController",
                                   @"WTDynamicViewController",
                                   @"WTDiscoverViewController",
                                   @"WTMineViewController"
                                   ];
    
    for (NSString * child in childControllers) {
        UIViewController * childController = [[NSClassFromString(child) alloc] init];
        [self addChildViewController:childController];
    }
    
    // 2.去掉tabbar上的黑线
    [[UITabBar appearance] setBackgroundImage:[UIImage new]];
    [[UITabBar appearance] setShadowImage:[UIImage new]];
}


- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    for (UIView * child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

- (void)tabbar:(WTTabBar *)tabbar didClickWithIndex:(NSInteger)index{
    
      self.selectedIndex = index;
}

@end
