//
//  UIImage+Original.m
//
//  Created by Ws on 15/7/17.
//  Copyright © 2015年 Ws. All rights reserved.
//

#import "UIImage+Original.h"

@implementation UIImage (Original)

+ (UIImage *)getOriginalImageWithName:(NSString *)name {
    
    UIImage *image = [UIImage imageNamed:name];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return image;
}

@end
