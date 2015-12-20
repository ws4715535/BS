//
//  RecommendItem.h
//  01-百思不得姐框架搭建
//
//  Created by Ws on 15/12/20.
//  Copyright © 2015年 Ws. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecommendItem : NSObject
/*
 
 
 image_list
 
 sub_number
 
 theme_name
 
 */

// 图片地址
@property (strong, nonatomic) NSString *image_list;
// 图片名称
@property (strong, nonatomic) NSString *theme_name;
// 订阅数
@property (strong, nonatomic) NSString *sub_number;



@end
