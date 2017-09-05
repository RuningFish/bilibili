//
//  WTBaseViewController.m
//  bilibili
//
//  Created by admin on 17/9/3.
//  Copyright © 2017年 飞奔的小鲨鱼. All rights reserved.
//

#import "WTBaseViewController.h"
@interface WTBaseViewController ()

@end

@implementation WTBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = WTRandomColor;
    
}


- (UIStatusBarStyle)preferredStatusBarStyle{
    
    return UIStatusBarStyleLightContent;
}
@end
