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
#import "WSTabBar.h"

#import "UIImage+Original.h"

#import "WSNavigationController.h"

#define WSRGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define WSFontSize [UIFont systemFontOfSize:12]
@implementation WSTabBarController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setUpAllChildViewControllers];
    [self setupTabbarItem];
    //自定义tabBar
    WSTabBar *tabbar = [[WSTabBar alloc]init];
    
//    self.tabBar = tabbar; readOnly 可以通过kvc来搞
//    readOnly : 没有set方法
//    [self setValue:@"tabbar" forKeyPath:@"tabBar"];
    self.tabBar.backgroundImage = [UIImage imageNamed:@"tabbar-light"];
    
    [self setValue:tabbar forKeyPath:@"tabBar"];

}


//加载控制器的时候就会调用这个方法
+ (void)load {
   //1.appearance 方法可以拿到某个类的相关控件,但是如果用来设置相关性质的时候,必须在控件显示之前设置,否则无效
    
    //这就代表拿到这个WSTabBarController内的所有UITabBarItem控件
    UITabBarItem *barItem = [UITabBarItem appearanceWhenContainedIn:self, nil];
    
    
    //拿到后修改相关文字的富文本
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    
    //选中状态文字颜色
    attr[NSFontAttributeName] = WSFontSize;
    attr[NSForegroundColorAttributeName] = WSRGBColor(64, 64, 64);
    [barItem setTitleTextAttributes:attr forState:UIControlStateSelected];
    
    //设置默认状态下文字颜色
    NSMutableDictionary *attrNorm = [NSMutableDictionary dictionary];
    attrNorm[NSFontAttributeName] = WSFontSize;
    attrNorm[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [barItem setTitleTextAttributes:attrNorm forState:UIControlStateNormal];
    
    
}

//重写addChildViewController方法,让他们都是WSNaVigationController,包装成导航控制器
- (void)addChildViewController:(UIViewController *)childController {
    
    WSNavigationController *navi = [[WSNavigationController alloc]initWithRootViewController:childController];
    //调用super的这个方法,可以确保导航控制器能被添加为自控制器,否则方法重写原功能失效
    [super addChildViewController:navi];
}




//设置所有的子控制器
- (void)setUpAllChildViewControllers {
    //1.精华
    WSEssenceController *essenVC = [[WSEssenceController alloc]init];
    
    [self addChildViewController:essenVC];
    //2.新帖
    WSNewController *newVC = [[WSNewController alloc]init];
    [self addChildViewController:newVC];
    //3.发布
//    WSPublishController *publishVC = [[WSPublishController alloc]init];
//    [self addChildViewController:publishVC];
    //4.关注
    WSFriendController *friendVC = [[WSFriendController alloc]init];
     [self addChildViewController:friendVC];
    //5.我
    WSMeController *meVC = [[WSMeController alloc]init];
    [self addChildViewController:meVC];
}

//设置TabbarItem样式

- (void)setupTabbarItem {
    //1.精华
    UIViewController *vc1 = self.childViewControllers[0];
    vc1.tabBarItem.title = @"精华";
    vc1.tabBarItem.image = [UIImage getOriginalImageWithName:@"tabBar_essence_icon"];
    vc1.tabBarItem.selectedImage = [UIImage getOriginalImageWithName:@"tabBar_essence_click_icon"];;
   
    
    //2.新帖
    UIViewController *vc2 = self.childViewControllers[1];
    vc2.title = @"新帖";
    vc2.tabBarItem.image = [UIImage getOriginalImageWithName:@"tabBar_new_icon"];
    vc2.tabBarItem.selectedImage = [UIImage getOriginalImageWithName:@"tabBar_new_click_icon"];;
    

    //3.关注
    UIViewController *vc3 = self.childViewControllers[2];
    vc3.title = @"关注";
    vc3.tabBarItem.image = [UIImage getOriginalImageWithName:@"tabBar_friendTrends_icon"];
    vc3.tabBarItem.selectedImage = [UIImage getOriginalImageWithName:@"tabBar_friendTrends_click_icon"];;
    

    //4.我
    UIViewController *vc4 = self.childViewControllers[3];
    vc4.title = @"我";
    vc4.tabBarItem.image = [UIImage getOriginalImageWithName:@"tabBar_me_icon"];
    vc4.tabBarItem.selectedImage = [UIImage getOriginalImageWithName:@"tabBar_me_click_icon"];;
    

    
}



@end
