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
#import "WTTabBarItem.h"
#import "UIImage+category.h"

@interface WTTabBar ()
@property (nonatomic, strong) NSArray * imageArray;
/**当前选中的下标 */
@property (nonatomic, assign) NSInteger selectIndex;

@end

@implementation WTTabBar

- (NSArray *)imageArray{
    if (_imageArray == nil) {
        _imageArray = @[@"home_home_tab",@"home_category_tab",@"home_attention_tab",@"home_discovery_tab",@"home_mine_tab"];
    }
    return _imageArray;
}

+ (instancetype)tabBar{
    
    __block WTTabBar * instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
        instance.backgroundColor = [UIColor whiteColor];
    });
    return instance;
}


- (instancetype)init{
    
    if (self = [super init]) {
        
        NSInteger count = 5;
        CGFloat width = WTScreenWidth / count;
        CGFloat height = 49;
        
        for (int i = 0; i < self.imageArray.count; i ++) {
            
            WTTabBarItem * tabBarItem = [[WTTabBarItem alloc] init];
            tabBarItem.tag = i;
            tabBarItem.userInteractionEnabled = YES;
            tabBarItem.frame = CGRectMake(i*width, 0, width, height);
            [self addSubview:tabBarItem];
            tabBarItem.image = [UIImage imageWithBundleName:self.imageArray[i]];
            tabBarItem.contentMode = UIViewContentModeCenter;
            
            // 单击
            UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tabBarButtonClick:)];
            [tabBarItem addGestureRecognizer:tap];
            // 双击
            UITapGestureRecognizer * doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tabBarButtonDoubleClick:)];
            doubleTap.numberOfTapsRequired = 2;
            [tabBarItem addGestureRecognizer:doubleTap];
            
            if (i == self.imageArray.count - 1) {
                tabBarItem.newsLabel.hidden = NO;
            }
        }
        
        self.selectIndex = 100;
        // 默认选中第0个
        [self selectItemWithIndex:0];
    }
    
    return self;
}

- (void)tabBarButtonClick:(UITapGestureRecognizer *)singleTap{
  
    [self selectItemWithIndex:singleTap.view.tag];
}

- (void)tabBarButtonDoubleClick:(UITapGestureRecognizer *)doubleTap{
    NSLog(@"tabBarButtonDoubleClick");
}

- (void)selectItemWithIndex:(NSInteger)index{
    
    if (self.selectIndex == index) return;
    
    // 0.将选中的item图片置为高亮，其它设置为nomal
    WTTabBarItem * selectItem = self.subviews[index];
    NSString * highLight = [NSString stringWithFormat:@"%@_s",self.imageArray[index]];
    selectItem.image = [UIImage imageWithBundleName:highLight];
    
    for (NSInteger i = 0; i < self.imageArray.count; i ++) {
        if (i != index) {
            WTTabBarItem * tabBarItem = self.subviews[i];
            tabBarItem.image = [UIImage imageWithBundleName:self.imageArray[i]];
        }
        
    }
    
    // 1.通知代理
    if ([self.delegate respondsToSelector:@selector(tabbar:didClickWithIndex:)]) {
        [self.delegate tabbar:self didClickWithIndex:index];
    }
    
    self.selectIndex = index;
}
@end
