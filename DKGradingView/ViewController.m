//
//  ViewController.m
//  DKGradingView
//
//  Created by apple on 15/5/18.
//  Copyright (c) 2015年 DeltaX. All rights reserved.
//

#import "ViewController.h"
#import "DKGradingView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    DKGradingView *gradingView = [[DKGradingView alloc] initWithFrame:CGRectMake(0, 20, 310, 70)];
//    gradingView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:gradingView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
