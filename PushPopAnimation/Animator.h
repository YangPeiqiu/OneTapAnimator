//
//  Animator.h
//  PushPopAnimation
//
//  Created by QiuQiu on 16/8/16.
//  Copyright © 2016年 Qiu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Animator : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) BOOL presenting;
@property (nonatomic, strong) UIColor *viewColor;
@property (nonatomic, assign) CGPoint startingPoint;

@end
