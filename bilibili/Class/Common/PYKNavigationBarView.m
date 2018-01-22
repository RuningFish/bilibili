//
//  PYKNavigationBarView.m
//  PiyingkeLibrary
//
//  Created by piyingke on 16/11/11.
//
//

#import "PYKNavigationBarView.h"

@implementation PYKNavigationBarView
{
    UILabel  * _titleLabel;
    UIButton * _leftItem;
    UIButton * _rightItem;
    CGFloat    _titleLbaelWidth;
}

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
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    //_titleLabel.backgroundColor = [UIColor redColor];
    [self addSubview:_titleLabel];
    
    _leftItem = [UIButton buttonWithType:UIButtonTypeCustom];
    [_leftItem setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    _leftItem.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    //_leftItem.backgroundColor = [UIColor greenColor];
    _leftItem.adjustsImageWhenHighlighted = NO;
    [self addSubview:_leftItem];
    [_leftItem addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchUpInside];
    
    _rightItem = [UIButton buttonWithType:UIButtonTypeCustom];
    [_rightItem setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    //_rightItem.backgroundColor = [UIColor yellowColor];
    _rightItem.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    _rightItem.adjustsImageWhenHighlighted = NO;
    [self addSubview:_rightItem];
    [_rightItem addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
//    CGFloat width = [UIScreen mainScreen].bounds.size.width;
//    CGFloat height = 44;
//    CGFloat margin = 10;
//    
//    CGFloat titleLabelWidth = 200;
//    CGFloat titleLabelX = (width - titleLabelWidth) * 0.5;
//    _titleLabel.frame = CGRectMake(titleLabelX, 0, titleLabelWidth, height);
//    
//    CGFloat buttonWidth = (width - titleLabelWidth - margin * 2) * 0.5;
//    _titleLabel.backgroundColor = [UIColor redColor];
//    _leftItem.frame = CGRectMake(10, 0, buttonWidth, height);
//    _rightItem.frame = CGRectMake(width - buttonWidth - 10, 0, buttonWidth, height);
   

}

- (void)itemClick:(UIButton *)item{
    
    if (item == _leftItem) {
        
        if (self.leftItemBlock) {
            
            self.leftItemBlock();
        }
        
    }else{
        
        if (self.rightItemBlock) {
            
            self.rightItemBlock();
        }
    }
}

#pragma mark - 设置属性
- (void)setBgColor:(UIColor *)bgColor{
    
    _bgColor = bgColor;
    self.backgroundColor = bgColor;
}

- (void)setTitle:(NSString *)title{
    
    _title = title;
    _titleLabel.text = [NSString stringWithFormat:@"%@",title];
}

- (void)setLeftTitle:(NSString *)leftTitle{
    
    _leftTitle = leftTitle;
    [_leftItem setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_leftItem setTitle:_leftTitle forState:UIControlStateNormal];
    
}

- (void)setRightTitle:(NSString *)RightTitle{
    
    _rightTitle = RightTitle;
    
    [_rightItem setTitle:RightTitle forState:UIControlStateNormal];
}

- (void)setTitleAttrs:(NSDictionary *)titleAttrs{
    
    _titleAttrs = titleAttrs;
    
    _titleLabel.textColor = [titleAttrs valueForKey:NSForegroundColorAttributeName];
    _titleLabel.font = [titleAttrs valueForKey:NSFontAttributeName];
}

- (void)setLeftAttrs:(NSDictionary *)leftAttrs{
    
    _leftAttrs = leftAttrs;
    
    [_leftItem setTitleColor:[leftAttrs valueForKey:NSForegroundColorAttributeName] forState:UIControlStateNormal];
    _leftItem.titleLabel.font = [leftAttrs valueForKey:NSFontAttributeName];
    
}

- (void)setRightAttrs:(NSDictionary *)rightAttrs{
    
    _rightAttrs = rightAttrs;
    
    [_rightItem setTitleColor:[rightAttrs valueForKey:NSForegroundColorAttributeName] forState:UIControlStateNormal];
    _rightItem.titleLabel.font = [rightAttrs valueForKey:NSFontAttributeName];
}

- (void)setLeftHighlightText:(NSString *)leftHighlightText{
    
    _leftHighlightText = leftHighlightText;
    [_leftItem setTitle:leftHighlightText forState:UIControlStateHighlighted];
}

- (void)setLeftNormalImage:(UIImage *)leftNormalImage{
    
    _leftNormalImage = leftNormalImage;
    [_leftItem setImage:leftNormalImage forState:UIControlStateNormal];
}

- (void)setLeftHighlightImage:(UIImage *)leftHighlightImage{
    
    _leftHighlightImage = leftHighlightImage;
    [_leftItem setImage:leftHighlightImage forState:UIControlStateHighlighted];
}

- (void)setRightHighlightText:(NSString *)rightHighlightText{
    
    _rightHighlightText = rightHighlightText;
    [_rightItem setTitle:rightHighlightText forState:UIControlStateHighlighted];
}

- (void)setRightNormalImage:(UIImage *)rightNormalImage{
    
    _rightNormalImage = rightNormalImage;
    [_rightItem setImage:rightNormalImage forState:UIControlStateNormal];
}

- (void)setRightHighlightImage:(UIImage *)rightHighlightImage{
    
    _rightHighlightImage = rightHighlightImage;
    [_rightItem setImage:rightHighlightImage forState:UIControlStateHighlighted];
}
@end
