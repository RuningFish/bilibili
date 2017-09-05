//
//  WTNavigationController.m
//  WTSummary
//
//  Created by admin on 17/6/25.
//  Copyright © 2017年 飞奔的小鲨鱼. All rights reserved.
//

#import "WTNavigationController.h"
#import <objc/runtime.h>
//#import "Const.h"

@interface WTNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation WTNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

//    // 1.获取系统的target 和 action
//    NSArray * targets = [self.interactivePopGestureRecognizer valueForKey:@"_targets"];
//    id target = [targets.firstObject valueForKey:@"target"];
//    SEL action = NSSelectorFromString(@"handleNavigationTransition:");
//    
//    // 2.创建全屏的滑动手势
//    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:action];
//    pan.delegate = self;
//    [self.view addGestureRecognizer:pan];
    
    
        UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleNavigationTransition:)];
        [self.view addGestureRecognizer:pan];
        //设置自定义手势的代理，用于拦截自定义手势的触发
        pan.delegate = self;
        //关闭系统的边缘手势
        self.interactivePopGestureRecognizer.enabled = NO;
    
    
    
}


- (void)handleNavigationTransition:(UIPanGestureRecognizer *)panGesture{
    //调用系统手势绑定的方法
    [self.interactivePopGestureRecognizer.delegate performSelector:@selector(handleNavigationTransition:) withObject:panGesture];
  
    if (panGesture.state == UIGestureRecognizerStateBegan) {
    }
    else if (panGesture.state == UIGestureRecognizerStateChanged){
    }
    else if (panGesture.state == UIGestureRecognizerStateEnded){
    }
}

+ (void)initialize{
    
    [[UINavigationBar appearance]  setBackgroundImage:[UIImage createImageWithColor:KNormalNavColor] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[UIImage createImageWithColor:KNormalNavColor]];
 

    [UINavigationBar appearance].titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    [UINavigationBar appearance].backIndicatorImage =
    [UINavigationBar appearance].backIndicatorTransitionMaskImage =
    [UIImage imageNamed:@"nav_bar_back_icon_white"];
    
    // 设置导航栏的颜色
    [[UINavigationBar appearance] setBarTintColor:KNormalNavColor];
//    [[UINavigationBar appearance] setTintColor:KNormalNavColor];
    // hide title of back button
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                         forBarMetrics:UIBarMetricsDefault];
    
    NSShadow *clearShadow = [[NSShadow alloc] init];
    clearShadow.shadowColor = [UIColor clearColor];
    clearShadow.shadowOffset = CGSizeMake(0, 0);
    
    UIColor *normalTitleColor = [UIColor whiteColor];
    UIColor *highlightedTitleColor = [UIColor whiteColor];
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{
                                                           NSForegroundColorAttributeName : normalTitleColor,
                                                           NSShadowAttributeName : clearShadow
                                                           } forState:UIControlStateNormal];
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{
                                                           NSForegroundColorAttributeName : highlightedTitleColor,
                                                           NSShadowAttributeName : clearShadow
                                                           } forState:UIControlStateHighlighted];
    
    [[UIBarButtonItem appearance] setTintColor:KNormalNavColor];
    
    [[UIToolbar appearance] setBarTintColor:KNormalNavColor];
    
}

- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer {
    //解决与左滑手势冲突
    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
    
//    NSLog(@"xx - %@",NSStringFromCGPoint(translation));
    if (translation.x <= 0) {
        return NO;
    }
    return self.childViewControllers.count == 1 ? NO : YES;
}

- (NSMutableArray *)class_copyIvarList:(id)class {
    unsigned int count = 0;
    Ivar * ivars = class_copyIvarList(class, &count);
    NSMutableArray * property = [NSMutableArray array];
    for (int i = 0; i < count; i ++) {
        const char * ivar = ivar_getName(ivars[i]);
        [property addObject:[NSString stringWithUTF8String:ivar]];
    }
    free(ivars);
    
    return property;
}



//- (void)viewDidLoad {
//    [super viewDidLoad];
//    //自定义滑动手势
//    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handleNavigationTransition:)];
//    //将自定义手势添加到NavigationController的view上
//    [self.view addGestureRecognizer:panGestureRecognizer];
//    //设置自定义手势的代理，用于拦截自定义手势的触发
//    panGestureRecognizer.delegate = self;
//    //关闭系统的边缘手势
//    self.interactivePopGestureRecognizer.enabled = NO;
//}
//
//- (void)handleNavigationTransition:(UIPanGestureRecognizer *)panGesture{
//    //调用系统手势绑定的方法
//    [self.interactivePopGestureRecognizer.delegate performSelector:@selector(handleNavigationTransition:) withObject:panGesture];
//    //计算偏移量
//    CGFloat offetX = [panGesture locationInView:self.view].x - self.startX;
//    if (offetX >= 0) {
//        //输出偏移量
//        NSLog(@"%f", offetX);
//    } else {
//        NSLog(@"%f", 0.0f);
//    }
//}
//
////拦截自定义手势的触发，并记录触发手势的开始位置
//- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
//    //导航控制器的跟控制器不需要返回侧滑手势（如果不屏蔽会有奇怪的效果）
//    if (self.childViewControllers.count == 1) {
//        return NO;
//    }
//    //记录触发手势的开始位置
//    self.startX = [gestureRecognizer locationInView:self.view].x;
//    return YES;
//}


@end
