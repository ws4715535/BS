//
//  WSEssenceController.m
//  01-百思不得姐框架搭建
//
//  Created by Ws on 15/12/17.
//  Copyright © 2015年 Ws. All rights reserved.
//

#import "WSEssenceController.h"
#import "UIBarButtonItem+Item.h"

@implementation WSEssenceController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    
    [self setUpNavigationItem];
}


- (void)setUpNavigationItem {
    //设置顶部背景 (纯白不透明 ,用的是图片)
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    //设置导航条按钮
      //LeftButton
    UIBarButtonItem *leftButton = [UIBarButtonItem initWithNormImage:[UIImage imageNamed:@"nav_item_game_icon"] andHighImage:[UIImage imageNamed:@"nav_item_game_click_icon"] target:self action:@selector(action)];
    //添加导航控制器左边的按钮
    self.navigationItem.leftBarButtonItem = leftButton;
      //RightButton
    UIBarButtonItem *rightButton = [UIBarButtonItem initWithNormImage:[UIImage imageNamed:@"navigationButtonRandom"] andHighImage:[UIImage imageNamed:@"navigationButtonRandomClick"] target:self action:@selector(randomCliack)];
    //添加导航控制器右边的按钮
    self.navigationItem.rightBarButtonItem = rightButton;
    
}

- (void)action {
    
    WSFunc;
    
}

- (void)randomCliack {
    
    WSFunc;
    
}
@end
