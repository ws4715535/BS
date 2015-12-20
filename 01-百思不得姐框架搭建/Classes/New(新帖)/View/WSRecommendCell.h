//
//  WSRecommendCell.h
//  01-百思不得姐框架搭建
//
//  Created by Ws on 15/12/20.
//  Copyright © 2015年 Ws. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RecommendItem.h"
@interface WSRecommendCell : UITableViewCell


+ (instancetype)wsRecommendCell;


//模型
@property (strong, nonatomic) RecommendItem *recommendItem;

@end
