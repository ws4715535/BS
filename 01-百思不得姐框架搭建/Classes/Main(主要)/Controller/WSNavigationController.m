//
//  WSNavigationController.m
//  01-百思不得姐框架搭建
//
//  Created by Ws on 15/12/18.
//  Copyright © 2015年 Ws. All rights reserved.
//

#import "WSNavigationController.h"
#import "UIBarButtonItem+Item.h"

@interface WSNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation WSNavigationController

+ (void)load {
    //自定义后,通过appearance拿到想要的控件
        //获取这个类下全局的导航条,用来统一设置
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    
    //设置它的富文本属性
    NSMutableDictionary *attri = [NSMutableDictionary dictionary];
    
    attri[NSFontAttributeName] = [UIFont systemFontOfSize:17];
    //attrubutes
    [navBar setTitleTextAttributes:attri];
}

//重写push方法,让在push之前全局的修改返回按钮

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    //判断下,不是根控制器才去修改
    if (self.childViewControllers.count != 0 ) {
        UIBarButtonItem *backItem = [UIBarButtonItem backItemWithImage:[UIImage imageNamed:@"navigationButtonReturn"] highImage:[UIImage imageNamed:@"navigationButtonReturnClick"] target:self action:@selector(back) norColor:[UIColor blackColor] highColor:[UIColor redColor] title:@"返回"];
        viewController.navigationItem.leftBarButtonItem = backItem;
    }
    //这个方法才能真的push阿!!
    [super pushViewController:viewController animated:animated];
}

- (void)back {
    
    [self popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //设置完返回按钮后,发现系统的手势返回失效 分析:
       //1.手势被清除  2.代理被清除
    
//    self.interactivePopGestureRecognizer.delegate = self;
    //设置完后发现滑动返回可用,新的问题:
        //1.主界面会卡死  2.手势返回范围太小
    
//    打印这个pop时的手势,发现执行的方法是handleNavigationTransition:,所以解决方案是自己重写手势,然后执行这个方法
//    NSLog(@"%@",self.interactivePopGestureRecognizer);
    
    //重点在target上,执行这个自由方法的是系统的原代理,所以如果target写错 会报错
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    // _UINavigationInteractiveTransition
//    WSLog(@"%@",self.interactivePopGestureRecognizer.delegate);
    //给view添加手势
    [self.view addGestureRecognizer:pan];
    pan.delegate = self;
    
    //waring:记得取消系统的手势
    self.interactivePopGestureRecognizer.enabled = NO;
}

//解决方案,发现这个方法是在调用手势的适合会判断是否执行,当为根控制器时,让它不执行
// called before touchesBegan:withEvent: is called on the gesture recognizer for a new touch. return NO to prevent the gesture recognizer from seeing this touch
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    
    //也就是说.只有当不是根控制器的时候才能调用返回手势   下来解决2.手势返回范围太小问题;
    return self.childViewControllers.count !=1;
}


@end
