//
//  WSButton.m
//  01-百思不得姐框架搭建
//
//  Created by Ws on 15/12/21.
//  Copyright © 2015年 Ws. All rights reserved.
//

#import "WSButton.h"

@implementation WSButton

- (void)layoutSubviews {
    
    
    [super layoutSubviews];
    
    // 设置图片
    self.imageView.y = 0;
    self.imageView.centerX = self.width * 0.5;
    
    // 设置文字
    // 从xib计算的标题尺寸不对,自己在计算一下
    // 自动计算控件尺寸,根据内容
    [self.titleLabel sizeToFit];
    self.titleLabel.y = self.height - self.titleLabel.height;
    self.titleLabel.centerX = self.width * 0.5;

    
    
}
@end
