//
//  WSNavigationController.m
//  01-百思不得姐框架搭建
//
//  Created by Ws on 15/12/18.
//  Copyright © 2015年 Ws. All rights reserved.
//

#import "WSNavigationController.h"

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

@end
