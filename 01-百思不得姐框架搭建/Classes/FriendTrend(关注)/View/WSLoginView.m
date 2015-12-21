//
//  WSLoginView.m
//  01-百思不得姐框架搭建
//
//  Created by Ws on 15/12/21.
//  Copyright © 2015年 Ws. All rights reserved.
//

#import "WSLoginView.h"

@interface WSLoginView ()
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;

@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation WSLoginView

- (IBAction)loginBtn:(id)sender {
    WSFunc;
}




- (void)awakeFromNib {
    
    
    
    
    
    
}


- (void)beginEditing {
    self.phoneTextField.tintColor = [UIColor whiteColor];
    
}


+ (instancetype)lunachView {
    
    
    
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}


+ (instancetype)loginView {
     return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
    
}
@end
