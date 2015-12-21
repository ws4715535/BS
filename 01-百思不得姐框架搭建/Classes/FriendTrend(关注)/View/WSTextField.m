//
//  WSTextField.m
//  01-百思不得姐框架搭建
//
//  Created by Ws on 15/12/21.
//  Copyright © 2015年 Ws. All rights reserved.
//

#import "WSTextField.h"

@implementation WSTextField

- (void)awakeFromNib {
    
    //目的是为了更改占位文字的颜色 和光标颜色  ,发现系统对placeholder有富文本属性,这里通过监听他们的编辑状态去修改它的富文本属性
    
        //1.修改光标颜色
    self.tintColor = [UIColor whiteColor];
    
    [self addTarget:self action:@selector(Editingbegin) forControlEvents:UIControlEventEditingDidBegin];
    
    [self addTarget:self action:@selector(Editingend) forControlEvents:UIControlEventEditingDidEnd];
    
        //2.先设置默认的富文本颜色为 lightGray
    NSMutableDictionary *attribute = [NSMutableDictionary dictionary];
    
    attribute[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    
        //3.创建富文本字符串
    NSAttributedString *attributeString = [[NSAttributedString alloc] initWithString:self.placeholder attributes:attribute];
    
    self.attributedPlaceholder = attributeString;
}



- (void)Editingbegin {
    NSMutableDictionary *attribute = [NSMutableDictionary dictionary];
    
    attribute[NSForegroundColorAttributeName] = [UIColor whiteColor];
    
    //3.创建富文本字符串
    NSAttributedString *attributeString = [[NSAttributedString alloc] initWithString:self.placeholder attributes:attribute];
    
    self.attributedPlaceholder = attributeString;
    
    
    
}

- (void)Editingend {
    NSMutableDictionary *attribute = [NSMutableDictionary dictionary];
    
    attribute[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    
    //3.创建富文本字符串
    NSAttributedString *attributeString = [[NSAttributedString alloc] initWithString:self.placeholder attributes:attribute];
    
    self.attributedPlaceholder = attributeString;
    
    
    
}


@end
