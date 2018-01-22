//
//  WTBaseViewController.h
//  bilibili
//
//  Created by admin on 17/9/3.
//  Copyright © 2017年 飞奔的小鲨鱼. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTNavigationBar.h"
@interface WTBaseViewController : UIViewController

/** titleLabel */
@property (nonatomic, weak) UILabel * titleLabel;

/** navigationBar */
@property (nonatomic, weak) WTNavigationBar * navigationBar;
@end
