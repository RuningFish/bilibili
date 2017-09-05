//
//  WTTabBarButton.m
//  bilibili
//
//  Created by admin on 17/9/3.
//  Copyright © 2017年 飞奔的小鲨鱼. All rights reserved.
//

#import "WTTabBarButton.h"
#import "UIButton+Category.h"
@implementation WTTabBarButton

- (instancetype)init{
    
    if (self = [super init]) {
        
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        
    }
    
    return self;
}

- (void)setHighlighted:(BOOL)highlighted{}
@end
