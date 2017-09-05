//
//  WTTabBarItem.m
//  bilibili
//
//  Created by admin on 17/9/3.
//  Copyright © 2017年 飞奔的小鲨鱼. All rights reserved.
//

#import "WTTabBarItem.h"

@interface WTTabBarItem ()

@end

@implementation WTTabBarItem
- (instancetype)init{
    
    if (self = [super init]) {
        
        UILabel * newsLabel = [[UILabel alloc] init];
        self.newsLabel = newsLabel;
        [self insertSubview:newsLabel atIndex:0];
        newsLabel.backgroundColor = [UIColor colorWithRed:255/255.0 green:82/255.0 blue:153/255.0 alpha:1.0];
        newsLabel.hidden = YES;
    }
    
    return self;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    CGFloat width = 8;
    CGFloat margin = 10;
    CGFloat x = self.frame.size.width - width - margin;
    self.newsLabel.frame = CGRectMake(x, margin, width, width);
    self.newsLabel.layer.cornerRadius = width * 0.5;
    self.newsLabel.layer.masksToBounds = YES;
}
@end
