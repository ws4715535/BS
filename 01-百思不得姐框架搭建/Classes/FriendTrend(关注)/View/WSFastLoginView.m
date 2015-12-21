//
//  WSFastLoginView.m
//  
//
//  Created by Ws on 15/12/21.
//
//

#import "WSFastLoginView.h"

@implementation WSFastLoginView

+ (instancetype)fastLoginView {
    
    
   return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
    
}

@end
