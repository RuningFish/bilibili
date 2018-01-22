//
//  UIImage+category.m
//  bilibili
//
//  Created by admin on 17/9/4.
//  Copyright © 2017年 飞奔的小鲨鱼. All rights reserved.
//

#import "UIImage+category.h"

@implementation UIImage (category)
+ (UIImage *)imageWithBundleName:(NSString *)name{
    
    NSBundle * bundle = [NSBundle bundleWithURL:[[NSBundle mainBundle] URLForResource:@"Bilibili" withExtension:@"bundle"]];
    
    CGFloat scale = [UIScreen mainScreen].scale;
    NSString * imageName = [NSString stringWithFormat:@"%@@%.0lfx~iphone",name,scale];
    UIImage * image = [UIImage imageWithContentsOfFile:[bundle pathForResource:imageName ofType:@"png"]];
    
    if (image) {
        return image;
    }
    else{
        
        NSString * imageName = [NSString stringWithFormat:@"%@@%.0lfx",name,scale];
        UIImage * image = [UIImage imageWithContentsOfFile:[bundle pathForResource:imageName ofType:@"png"]];
        
        if (image) {
            return image;
            
        }
        else{
             return [UIImage imageWithContentsOfFile:[bundle pathForResource:name ofType:@"png"]];
        }
       
    }
}
@end
