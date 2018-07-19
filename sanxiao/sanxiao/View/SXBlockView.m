//
//  SXBlockView.m
//  sanxiao
//
//  Created by ReckyLin on 2018/7/19.
//  Copyright © 2018年 ReckyLam. All rights reserved.
//

#import "SXBlockView.h"

@implementation SXBlockView


- (void)drawRect:(CGRect)rect {
    [self.blockConfig.blockColor setFill];
    UIRectFill(rect);
}




@end
