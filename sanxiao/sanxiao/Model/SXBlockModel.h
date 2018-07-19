//
//  SXBlockModel.h
//  sanxiao
//
//  Created by ReckyLin on 2018/7/18.
//  Copyright © 2018年 ReckyLam. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SXBlockModelType) {
    SXBlockModelTypeNormal = 1,          //normal block, can be destoryed or moved
    SXBlockModelTypeBrick = 2            //brick block, cannt be destoryed or moved
};

@interface SXBlockModel : NSObject

@property (nonatomic) SXBlockModelType blockType;
@property (nonatomic, strong) UIColor *blockColor;

@end
