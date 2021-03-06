//
//  WSNewController.m
//  01-百思不得姐框架搭建
//
//  Created by Ws on 15/12/17.
//  Copyright © 2015年 Ws. All rights reserved.
//

#import "WSNewController.h"
#import "UIBarButtonItem+Item.h"
#import "WSRecommendController.h"

@implementation WSNewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    [self setUpNavigationItem];
}


- (void)setUpNavigationItem {
    //设置顶部背景 (纯白不透明 ,用的是图片)
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    
    //设置titleView
    
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    //设置导航条按钮
    //LeftButton
    UIBarButtonItem *leftButton = [UIBarButtonItem initWithNormImage:[UIImage imageNamed:@"MainTagSubIcon"] andHighImage:[UIImage imageNamed:@"MainTagSubIconClick"] target:self action:@selector(TagSubIconClick)];
    //添加导航控制器左边的按钮
    self.navigationItem.leftBarButtonItem = leftButton;

}
#pragma mark -    //跳转到推荐标签
- (void)TagSubIconClick {

    WSRecommendController *recommend = [[WSRecommendController alloc]init];
    
    [self.navigationController pushViewController:recommend animated:YES];
    
}

@end
