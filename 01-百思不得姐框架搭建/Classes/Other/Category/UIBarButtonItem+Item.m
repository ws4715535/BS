//
//  UIBarButtonItem+Item.m
//
//  Created by Ws on 15/8/18.
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

+ (UIBarButtonItem *)backItemWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action norColor:(UIColor *)norColor highColor:(UIColor *)highColor title:(NSString *)title {
    
    UIButton *button = [[UIButton alloc]init];
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:highImage forState:UIControlStateHighlighted];
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateHighlighted];
    
    [button setTitleColor:norColor forState:UIControlStateNormal];
    [button setTitleColor:highColor forState:UIControlStateHighlighted];
    
    //添加点击事件
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    //设置内边距
//    [button setImageEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 0)];
    
    [button sizeToFit];
    
    return [[UIBarButtonItem alloc]initWithCustomView:button];
}



@end
