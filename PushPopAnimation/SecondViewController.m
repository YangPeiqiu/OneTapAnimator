//
//  SecondViewController.m
//  PushPopAnimation
//
//  Created by QiuQiu on 16/8/17.
//  Copyright © 2016年 Qiu. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet UIButton *backButton;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    // self.backButton size == (60,60)
    // backGroundColor = whiteColor titleColor = greenColor;
    self.backButton.layer.cornerRadius = 30.f;
    self.backButton.layer.masksToBounds = YES;
    // self.title == @"+", 转换成 X
    self.backButton.transform = CGAffineTransformMakeRotation(M_PI_4);
    
}
- (IBAction)backAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
