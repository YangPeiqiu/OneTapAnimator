//
//  Animator.m
//  PushPopAnimation
//
//  Created by QiuQiu on 16/8/16.
//  Copyright © 2016年 Qiu. All rights reserved.
//

#import "Animator.h"

@interface Animator ()

@property (nonatomic, strong) UIView *changeView;

@end

@implementation Animator

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIView *containerView = [transitionContext containerView];
    containerView.backgroundColor = [UIColor whiteColor];
    if (self.presenting) {
        UIView *presentedControllerView = [transitionContext viewForKey:UITransitionContextToViewKey];
        CGPoint originalCenter = presentedControllerView.center;
        CGSize originalSize = presentedControllerView.frame.size;
        self.changeView = [UIView new];
        self.changeView.frame = [self frameForBubble:originalCenter size:originalSize start:self.startingPoint];
        self.changeView.layer.cornerRadius = self.changeView.frame.size.height/2;
        self.changeView.center = self.startingPoint;
        // 设置起始点 0.01
        self.changeView.transform = CGAffineTransformMakeScale(0.001, 0.001);
        self.changeView.backgroundColor = self.viewColor;
        [containerView addSubview:self.changeView];
        
        presentedControllerView.center = self.startingPoint;
        presentedControllerView.transform = CGAffineTransformMakeScale(0.001, 0.001);
        presentedControllerView.alpha = 0;
        [containerView addSubview:presentedControllerView];
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            self.changeView.transform = CGAffineTransformIdentity;
            presentedControllerView.transform = CGAffineTransformIdentity;
            presentedControllerView.alpha = 1;
            presentedControllerView.center = originalCenter;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:true];
        }];
        
    }else {
     
        UIView *returningControllerView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        CGPoint originalCenter = returningControllerView.center;
        CGSize originalSize = returningControllerView.frame.size;
        
        self.changeView.frame = [self frameForBubble:originalCenter size:originalSize start:self.startingPoint];
        self.changeView.layer.cornerRadius = self.changeView.frame.size.height / 2;
        self.changeView.center = self.startingPoint;
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            self.changeView.transform = CGAffineTransformMakeScale(0.001, 0.001);
            returningControllerView.transform = CGAffineTransformMakeScale(0.001, 0.001);
            returningControllerView.center = self.startingPoint;
            returningControllerView.alpha = 0;
            
        } completion:^(BOOL finished) {
            returningControllerView.center = originalCenter;
            [returningControllerView removeFromSuperview];
            [self.changeView removeFromSuperview];
            [transitionContext completeTransition:true];
        }];
        
    }
    
}

- (CGRect)frameForBubble:(CGPoint)originalCenter size:(CGSize)originalSize start:(CGPoint)start {
    // 求最大值
    CGFloat lengthX = fmaxf(start.x, originalSize.width - start.x);
    CGFloat lengthY = fmaxf(start.y, originalSize.height - start.y);
    // 求平方根
    CGFloat offset = sqrt(lengthX * lengthX + lengthY * lengthY) * 2;
    CGSize size = CGSizeMake(offset, offset);
    return CGRectMake(0, 0, size.width, size.height);
}

@end
