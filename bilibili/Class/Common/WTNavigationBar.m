//
//  WTNavigationBar.m
//  bilibili
//
//  Created by admin on 17/9/6.
//  Copyright © 2017年 飞奔的小鲨鱼. All rights reserved.
//

#import "WTNavigationBar.h"

@interface WTNavigationBar ()

/** 中间的imageView */
@property (nonatomic, weak) UIImageView * contentImageView;

@end

@implementation WTNavigationBar

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self setSubviews];
    }
    
    return self;
}

- (instancetype)init{
    
    if (self = [super init]) {
        
        [self setSubviews];
    }
    
    return self;
    
}


- (void)setSubviews{
    
    self.backgroundColor = [UIColor whiteColor];
    
    // 标题
    UILabel * titleLabel = [[UILabel alloc] init];
    self.titleLabel = titleLabel;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:_titleLabel];
    
    // leftBarButtonItem;
    UIButton * leftBarButtonItem = [UIButton buttonWithType:UIButtonTypeCustom];
    self.leftBarButtonItem = leftBarButtonItem;
    [self addSubview:leftBarButtonItem];
    [self.leftBarButtonItem setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    self.leftBarButtonItem.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    self.leftBarButtonItem.adjustsImageWhenHighlighted = NO;
    [self.leftBarButtonItem addTarget:self action:@selector(barButtonItemClick:) forControlEvents:UIControlEventTouchUpInside];
    
    // rightBarButtonItem
    UIButton * rightBarButtonItem = [UIButton buttonWithType:UIButtonTypeCustom];
    self.rightBarButtonItem = rightBarButtonItem;
    [self addSubview:rightBarButtonItem];
    [self.rightBarButtonItem setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    self.rightBarButtonItem.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    self.rightBarButtonItem.adjustsImageWhenHighlighted = NO;
    [self.rightBarButtonItem addTarget:self action:@selector(barButtonItemClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.rightBarButtonItem.backgroundColor = [UIColor yellowColor];
    self.leftBarButtonItem.backgroundColor = [UIColor greenColor];
    
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = 44;
    CGFloat margin = 10;

    // 标题默认的宽度 100 barButtonItem默认宽度 80
    CGFloat titleLabelWidth = 100;
    CGFloat barButtonItemWidth = 80;
    
    CGFloat titleLabelX = (screenWidth - titleLabelWidth) * 0.5;
    self.titleLabel.frame = CGRectMake(titleLabelX, 0, titleLabelWidth, height);
    CGFloat barButtonItemW = barButtonItemWidth;//- margin * 2) * 0.5;
    self.titleLabel.backgroundColor = [UIColor redColor];
    self.leftBarButtonItem.frame = CGRectMake(margin, 0, barButtonItemW, height);
    self.rightBarButtonItem.frame = CGRectMake(screenWidth - barButtonItemW - margin, 0, barButtonItemW, height);
    
   
}

- (void)barButtonItemClick:(UIButton *)barButtonItem{
    
  
}

- (void)setCenterImage:(UIImage *)centerImage{
    
    _centerImage = centerImage;
    
    UIImageView * contentImageView = [[UIImageView alloc] init];
    self.contentImageView = contentImageView;
    [self addSubview:contentImageView];
    
    self.contentImageView.frame = CGRectMake(0, 0, centerImage.size.width, 44);
    self.contentImageView.center = CGPointMake(self.frame.size.width*0.5, self.frame.size.height*0.5);
    self.contentImageView.contentMode = UIViewContentModeCenter;
    self.contentImageView.image = centerImage;
    self.titleLabel.hidden = YES;
    
}
#pragma mark - 设置属性
//- (void)setBgColor:(UIColor *)bgColor{
//    
//    _bgColor = bgColor;
//    self.backgroundColor = bgColor;
//}
//
//- (void)setTitle:(NSString *)title{
//    
//    _title = title;
//    _titleLabel.text = [NSString stringWithFormat:@"%@",title];
//}
//
//- (void)setLeftTitle:(NSString *)leftTitle{
//    
//    _leftTitle = leftTitle;
//    [_leftItem setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [_leftItem setTitle:_leftTitle forState:UIControlStateNormal];
//    
//}
//
//- (void)setRightTitle:(NSString *)RightTitle{
//    
//    _rightTitle = RightTitle;
//    
//    [_rightItem setTitle:RightTitle forState:UIControlStateNormal];
//}
//
//- (void)setTitleAttrs:(NSDictionary *)titleAttrs{
//    
//    _titleAttrs = titleAttrs;
//    
//    _titleLabel.textColor = [titleAttrs valueForKey:NSForegroundColorAttributeName];
//    _titleLabel.font = [titleAttrs valueForKey:NSFontAttributeName];
//}
//
//- (void)setLeftAttrs:(NSDictionary *)leftAttrs{
//    
//    _leftAttrs = leftAttrs;
//    
//    [_leftItem setTitleColor:[leftAttrs valueForKey:NSForegroundColorAttributeName] forState:UIControlStateNormal];
//    _leftItem.titleLabel.font = [leftAttrs valueForKey:NSFontAttributeName];
//    
//}
//
//- (void)setRightAttrs:(NSDictionary *)rightAttrs{
//    
//    _rightAttrs = rightAttrs;
//    
//    [_rightItem setTitleColor:[rightAttrs valueForKey:NSForegroundColorAttributeName] forState:UIControlStateNormal];
//    _rightItem.titleLabel.font = [rightAttrs valueForKey:NSFontAttributeName];
//}
//
//- (void)setLeftHighlightText:(NSString *)leftHighlightText{
//    
//    _leftHighlightText = leftHighlightText;
//    [_leftItem setTitle:leftHighlightText forState:UIControlStateHighlighted];
//}
//
//- (void)setLeftNormalImage:(UIImage *)leftNormalImage{
//    
//    _leftNormalImage = leftNormalImage;
//    [_leftItem setImage:leftNormalImage forState:UIControlStateNormal];
//}
//
//- (void)setLeftHighlightImage:(UIImage *)leftHighlightImage{
//    
//    _leftHighlightImage = leftHighlightImage;
//    [_leftItem setImage:leftHighlightImage forState:UIControlStateHighlighted];
//}
//
//- (void)setRightHighlightText:(NSString *)rightHighlightText{
//    
//    _rightHighlightText = rightHighlightText;
//    [_rightItem setTitle:rightHighlightText forState:UIControlStateHighlighted];
//}
//
//- (void)setRightNormalImage:(UIImage *)rightNormalImage{
//    
//    _rightNormalImage = rightNormalImage;
//    [_rightItem setImage:rightNormalImage forState:UIControlStateNormal];
//}
//
//- (void)setRightHighlightImage:(UIImage *)rightHighlightImage{
//    
//    _rightHighlightImage = rightHighlightImage;
//    [_rightItem setImage:rightHighlightImage forState:UIControlStateHighlighted];
//}

@end
