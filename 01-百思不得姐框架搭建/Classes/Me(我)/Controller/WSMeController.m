//
//  WSMeController.m
//  01-百思不得姐框架搭建
//
//  Created by Ws on 15/12/17.
//  Copyright © 2015年 Ws. All rights reserved.
//

#import "WSMeController.h"
#import "UIBarButtonItem+Item.h"
@implementation WSMeController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    [self setUpNavigationItem];
}


- (void)setUpNavigationItem {
    //设置顶部背景 (纯白不透明 ,用的是图片)
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    //设置导航条按钮
    //settingtButton
    UIBarButtonItem *settingButton = [UIBarButtonItem initWithNormImage:[UIImage imageNamed:@"mine-setting-icon"] andHighImage:[UIImage imageNamed:@"mine-setting-icon-click"] target:self action:@selector(settingClick)];
    
    //处理一个夜间模式按钮
       //按钮的点击状态必须要通过代码实现
    UIBarButtonItem *moonButton = [UIBarButtonItem initWithNormImage:[UIImage imageNamed:@"mine-moon-icon"] andSelImage:[UIImage imageNamed:@"mine-moon-icon-click"] target:self action:@selector(moonClick:)];
    //添加导航控制器左边的按钮
    self.navigationItem.rightBarButtonItems = @[settingButton ,moonButton];
    
    self.navigationItem.title = @"我的";

}

//夜间模式处理
- (void)moonClick:(UIButton *)button {
    
    button.selected = !button.selected;
    
}

- (void)settingClick {
    
    WSFunc;
}
@end
