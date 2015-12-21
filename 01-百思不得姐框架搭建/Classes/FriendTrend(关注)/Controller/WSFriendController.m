//
//  WSFriendController.m
//  01-百思不得姐框架搭建
//
//  Created by Ws on 15/12/17.
//  Copyright © 2015年 Ws. All rights reserved.
//

#import "WSFriendController.h"
#import "UIBarButtonItem+Item.h"
#import "WSIoginLunachController.h"
@implementation WSFriendController
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor yellowColor];
    [self setUpNavigationItem];
}

- (IBAction)loginLunachBtn {
    
    WSIoginLunachController *loginController = [[WSIoginLunachController alloc]init];
    [self presentModalViewController:loginController animated:YES];
    
}


- (void)setUpNavigationItem {
    
    
    
    //设置顶部背景 (纯白不透明 ,用的是图片)
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    //设置导航条按钮
    //LeftButton
    UIBarButtonItem *leftButton = [UIBarButtonItem initWithNormImage:[UIImage imageNamed:@"friendsRecommentIcon"] andHighImage:[UIImage imageNamed:@"friendsRecommentIcon-click"] target:self action:@selector(RecommentIconClick)];
    //添加导航控制器左边的按钮
    self.navigationItem.leftBarButtonItem = leftButton;
    
    self.navigationItem.title = @"我的关注";
}

- (void)RecommentIconClick {
    WSFunc;
}
@end
