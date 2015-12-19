//
//  AdItem.h
//  01-百思不得姐框架搭建
//
//  Created by Ws on 15/12/19.
//  Copyright © 2015年 Ws. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AdItem : NSObject
//ori_curl
//w
//h
//w_picurl

/** 广告图片 */
@property (nonatomic ,strong) NSString *w_picurl;

// 点击广告跳转的界面
@property (nonatomic ,strong) NSString *ori_curl;

// 广告图片的尺寸,不一定是固定
@property(nonatomic ,assign)CGFloat w;

@property(nonatomic ,assign)CGFloat h;

@end
