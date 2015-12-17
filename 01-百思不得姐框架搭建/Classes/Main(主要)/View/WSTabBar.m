//
//  WSTabBar.m
//  01-百思不得姐框架搭建
//
//  Created by Ws on 15/12/17.
//  Copyright © 2015年 Ws. All rights reserved.
//

#import "WSTabBar.h"

@interface WSTabBar ()

@property (weak, nonatomic) UIButton *plusButton;



@end



@implementation WSTabBar


//懒加载
- (UIButton *)plusButton {
    if (!_plusButton) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        //让根据图片的大小填充
        [button sizeToFit];
        _plusButton = button;
        [self addSubview:_plusButton];
    }
    return  _plusButton;
}

//布局各个按钮的位置
- (void)layoutSubviews {
    
    [super layoutSubviews];
    
   //1.给中间加号按钮留个位置
    NSInteger count = self.items.count + 1;
    int i = 0;
    CGFloat width = self.bounds.size.width / count;
    CGFloat height = self.bounds.size.height;
    for (UIView *button in self.subviews) {
        //因为这个View里面,不仅有buttonItem还有其他的subView,所以要做个判断
        if ([button isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (i == 2) {
                i +=1;
            }
            
            button.frame = CGRectMake(i * width, 0, width, height);
            i++;
        }
    }
    //让加号按钮居中
    self.plusButton.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
    //控件不显示的原因  : alpha = 0  隐藏 没尺寸 没添加到view

}

@end
