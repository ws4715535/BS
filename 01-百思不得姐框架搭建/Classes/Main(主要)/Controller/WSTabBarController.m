//
//  WSTabBarController.m
//  01-百思不得姐框架搭建
//
//  Created by Ws on 15/12/17.
//  Copyright © 2015年 Ws. All rights reserved.
//

#import "WSTabBarController.h"
#import "WSEssenceController.h"
#import "WSFriendController.h"
#import "WSMeController.h"
#import "WSNewController.h"
#import "WSPublishController.h"
@implementation WSTabBarController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setUpAllChildViewControllers];
}

//设置所有的子控制器
- (void)setUpAllChildViewControllers {
    //1.精华
    WSEssenceController *essenVC = [[WSEssenceController alloc]init];
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:essenVC];
    [self addChildViewController:nav1];
    //2.新帖
    WSNewController *newVC = [[WSNewController alloc]init];
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:newVC];
    [self addChildViewController:nav2];
    //3.发布
//    WSPublishController *publishVC = [[WSPublishController alloc]init];
//    [self addChildViewController:publishVC];
    //4.关注
    WSFriendController *friendVC = [[WSFriendController alloc]init];
    UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:friendVC];
    [self addChildViewController:nav3];
    //5.我
    WSMeController *meVC = [[WSMeController alloc]init];
    UINavigationController *nav4 = [[UINavigationController alloc]initWithRootViewController:meVC];
    [self addChildViewController:meVC];
}

//设置Tabbar样式

- (void)setupTabbarItem {
    
    
    
    
}



@end
