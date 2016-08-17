//
//  ViewController.m
//  PushPopAnimation
//
//  Created by QiuQiu on 16/8/16.
//  Copyright © 2016年 Qiu. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "Animator.h"

@interface ViewController () <UIViewControllerTransitioningDelegate>

@property (weak, nonatomic) IBOutlet UIButton *goButton;
@property (nonatomic, strong) Animator *animator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // self.goButton size == (60,60)
    self.goButton.layer.cornerRadius = 30.f;
    self.goButton.layer.masksToBounds = YES;
    // Animator init
    self.animator = [[Animator alloc] init];
    
}
- (IBAction)goAction:(id)sender {
    
    SecondViewController *secondVC = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"SecondViewController"];
    secondVC.transitioningDelegate = self;
    [self presentViewController:secondVC animated:YES completion:nil];
    
}

#pragma mark - UIViewControllerTransitioningDelegate
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    self.animator.presenting = YES;
    self.animator.startingPoint = self.goButton.center;
    self.animator.viewColor = self.goButton.backgroundColor;
    return self.animator;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    self.animator.presenting = NO;
    self.animator.startingPoint = self.goButton.center;
    self.animator.viewColor = self.goButton.backgroundColor;
    return self.animator;
}

@end
