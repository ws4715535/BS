//
//  WSRecommendCell.m
//  01-百思不得姐框架搭建
//
//  Created by Ws on 15/12/20.
//  Copyright © 2015年 Ws. All rights reserved.
//

#import "WSRecommendCell.h"
#import <UIImageView+WebCache.h>
#import "UIImage+Antialias.h"

@interface WSRecommendCell ()
@property (weak, nonatomic) IBOutlet UIImageView *tagPicView;
@property (weak, nonatomic) IBOutlet UILabel *tagNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *tagSubLabel;

@end

@implementation WSRecommendCell

+ (instancetype)wsRecommendCell {
    
   return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
    
    
}


- (void)awakeFromNib {
    
    self.separatorInset = UIEdgeInsetsZero;
    
    self.layoutMargins = UIEdgeInsetsZero;
    
}

//重写set方法,获取数据
- (void)setRecommendItem:(RecommendItem *)recommendItem {
    _recommendItem = recommendItem;
    
    
    NSURL *url = [NSURL URLWithString:recommendItem.image_list];
    
    //因为要画成圆形的头像,所以搞成抗锯齿的
    [_tagPicView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        //拿到图片进行上下文操作
       /*
        // 图形上下文生成新的图片
        
        // 1.开启图形上下文
        UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
        
        // 2.描述圆形路径
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
        // 3.设置裁剪区域
        [path addClip];
        
        // 4.画图
        [image drawAtPoint:CGPointZero];
        
        // 5.取出图片
        image = UIGraphicsGetImageFromCurrentImageContext();
        
        // 6.关闭上下文
        UIGraphicsEndImageContext();
        
        _iconView.image = [image imageAntialias];
        
        */
            //1.开启上下文
        UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
            //2.绘制贝瑟尔曲线
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
        
            //3.关闭曲线
        [path addClip];
            //4.画图
        [image drawAtPoint:CGPointZero];
            //5.取出图片
        image = UIGraphicsGetImageFromCurrentImageContext();
            //6.关闭上下文
        UIGraphicsEndImageContext();
        
        //设置图片 抗锯齿
        _tagPicView.image = [image imageAntialias];
        
    }];
    
    _tagNameLabel.text = recommendItem.theme_name;
    
    float number = recommendItem.sub_number.floatValue;
    //判断下人数书不是过万
    if (number >= 10000) {
        number = number / 10000;
    }
    _tagSubLabel.text = [NSString stringWithFormat:@"%.2f人订阅",number];
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
