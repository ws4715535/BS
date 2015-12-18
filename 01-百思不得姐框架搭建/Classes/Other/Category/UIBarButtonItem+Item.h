//
//  UIBarButtonItem+Item.h
//
//  Created by Ws on 15/8/18.
//  Copyright © 2015年 Ws. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Item)

+ (UIBarButtonItem *)initWithNormImage:(UIImage *)NormImage andHighImage:(UIImage *)highImage target:(nullable id)target action:(nonnull SEL)action;

+ (UIBarButtonItem *)initWithNormImage:(UIImage *)NormImage andSelImage:(UIImage *)SelImage target:(nullable id)target action:(nonnull SEL)action;
@end
