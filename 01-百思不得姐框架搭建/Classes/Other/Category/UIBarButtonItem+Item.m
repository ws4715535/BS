//
//  UIBarButtonItem+Item.m
//  01-百思不得姐框架搭建
//
//  Created by Ws on 15/12/18.
//  Copyright © 2015年 Ws. All rights reserved.
//

#import "UIBarButtonItem+Item.h"

@implementation UIBarButtonItem (Item)


//自定义高亮状态button
+ (UIBarButtonItem *)initWithNormImage:(UIImage *)NormImage andHighImage:(UIImage *)highImage target:(id)target action:(SEL)action {
    
    
    UIButton *button = [[UIButton alloc] init];
    
    [button setImage:NormImage forState:UIControlStateNormal]; //普通状态
    [button setImage:highImage forState:UIControlStateHighlighted]; //高亮
    
    //监听点击时间  (!Warning: target action 参数不能写成外面一样  self .应该是从外面传进来的)
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    //自适应尺寸
    [button sizeToFit];
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (UIBarButtonItem *)initWithNormImage:(UIImage *)NormImage andSelImage:(UIImage *)SelImage target:(nullable id)target action:(nonnull SEL)action {
    
    
    UIButton *button = [[UIButton alloc] init];
    
    [button setImage:NormImage forState:UIControlStateNormal]; //普通状态
    [button setImage:SelImage forState:UIControlStateSelected]; //高亮
    
    //监听点击时间  (!Warning: target action 参数不能写成外面一样  self .应该是从外面传进来的)
    //自适应尺寸
    [button sizeToFit];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

//+ (UIBarButtonItem *)itemWithImage:(UIImage *)image selImage:(UIImage *)selImage target:(nullable id)target action:(nullable SEL)action
//{
//    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [leftButton setImage:image forState:UIControlStateNormal];
//    [leftButton setImage:selImage forState:UIControlStateSelected];
//    // 自适应尺寸:自动根据按钮图片和文字计算按钮大小
//    [leftButton sizeToFit];
//    [leftButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
//    
//    return  [[UIBarButtonItem alloc] initWithCustomView:leftButton];
//    
//}




@end
