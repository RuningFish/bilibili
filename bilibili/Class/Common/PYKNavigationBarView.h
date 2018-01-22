//
//  PYKNavigationBarView.h
//  PiyingkeLibrary
//
//  Created by piyingke on 16/11/11.
//
//

#import <UIKit/UIKit.h>

typedef void (^leftItemBlock)();
typedef void (^rightItemBlock)();

@interface PYKNavigationBarView : UIView
/*** 背景色 */
@property (nonatomic,strong) UIColor * bgColor;
/** 中间的文字 */
@property (nonatomic,copy)  NSString * title;
@property (nonatomic,strong) NSDictionary * titleAttrs;

/** leftTitle */
@property (nonatomic,copy)  NSString * leftTitle;
@property (nonatomic,copy)  NSString * leftHighlightText;
@property (nonatomic,strong) UIImage * leftNormalImage;
@property (nonatomic,strong) UIImage * leftHighlightImage;
@property (nonatomic,strong) NSDictionary * leftAttrs;

/** rightTitle */
@property (nonatomic,copy)   NSString * rightTitle;
@property (nonatomic,copy)  NSString * rightHighlightText;
@property (nonatomic,strong) UIImage * rightNormalImage;
@property (nonatomic,strong) UIImage * rightHighlightImage;
@property (nonatomic,strong) NSDictionary * rightAttrs;

/**左侧Item点击事件 */
@property (nonatomic,copy) leftItemBlock leftItemBlock;
/**右侧Item点击事件 */
@property (nonatomic,copy) rightItemBlock rightItemBlock;

@end
