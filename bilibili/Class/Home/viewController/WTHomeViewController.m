//
//  WTHomeViewController.m
//  bilibili
//
//  Created by admin on 17/9/3.
//  Copyright © 2017年 飞奔的小鲨鱼. All rights reserved.
//

#import "WTHomeViewController.h"

@interface WTHomeViewController ()

@end

@implementation WTHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.navigationBar.titleLabel.hidden = self.navigationBar.leftBarButtonItem.hidden = self.navigationBar.rightBarButtonItem.hidden = YES;
    CGRect leftItemFrame = self.navigationBar.leftBarButtonItem.frame;
    leftItemFrame.size.width = 50;
    [self.navigationBar.leftBarButtonItem removeFromSuperview];
    UIButton * leftBarButtonItem = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.navigationBar addSubview:leftBarButtonItem];
    leftBarButtonItem.backgroundColor = [UIColor greenColor];
    leftBarButtonItem.frame = CGRectMake(10, 0, 50, 44);
    
    self.navigationBar.centerImage = [UIImage imageWithBundleName:@"live_entranceFollow_short"];
}

@end
