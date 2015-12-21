//
//  WSIoginLunachController.m
//  01-百思不得姐框架搭建
//
//  Created by Ws on 15/12/20.
//  Copyright © 2015年 Ws. All rights reserved.
//

#import "WSIoginLunachController.h"
#import "WSLoginView.h"
#import "WSFastLoginView.h"

@interface WSIoginLunachController ()
@property (weak, nonatomic) IBOutlet UIView *inputView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leadingConstraint;

@property (weak, nonatomic) IBOutlet UIView *fastLoginView;



@end

@implementation WSIoginLunachController


//点击其他地方退出编辑
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.view endEditing:YES];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];

    //创建注册界面
    WSLoginView *loginView = [WSLoginView loginView];
    [self.inputView addSubview:loginView];
    //创建登陆界面
    WSLoginView *lunachView = [WSLoginView lunachView];
    [self.inputView addSubview:lunachView];
    //创建快速登陆界面
    WSFastLoginView *fastLoginView = [WSFastLoginView fastLoginView];
    [self.fastLoginView addSubview:fastLoginView];

}
- (IBAction)loginLunachClick:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    
    //通过修改约束,来改变登陆框还是注册框
    NSLog(@"%@",self.leadingConstraint);
    
    //当约束等于0的时候让它左移, 当约束等于-WSscreenW的时候,让它右移动
    _leadingConstraint.constant = _leadingConstraint.constant == 0? -WSScreenW : 0;
    
    //加上动画
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
    
    
}
- (IBAction)closeClick {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewDidLayoutSubviews {
    
    [super viewDidLayoutSubviews];
    
    WSLoginView *loginView = self.inputView.subviews[0];
    WSLoginView *lunachView = self.inputView.subviews[1];

    //改变尺寸
        //1.登陆界面的frame
    lunachView.frame = CGRectMake(0, 0, self.inputView.width * 0.5, self.inputView.height);
        //2.注册界面的frame
    loginView.frame = CGRectMake(self.inputView.width * 0.5, 0, self.inputView.width * 0.5, self.inputView.height);

        //3.快速登陆的frame
    WSFastLoginView *fastLogin = self.fastLoginView.subviews.firstObject;
    fastLogin.frame = self.fastLoginView.bounds;
    
}

@end
