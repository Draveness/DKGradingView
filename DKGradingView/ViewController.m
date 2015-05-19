//
//  ViewController.m
//  DKGradingView
//
//  Created by apple on 15/5/18.
//  Copyright (c) 2015年 DeltaX. All rights reserved.
//

#import "ViewController.h"
#import "DKGradingView.h"

@interface ViewController () <DKGradingProtocol>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    DKGradingView *gradingView = [[DKGradingView alloc] initWithFrame:CGRectMake(0, 20, 200, 40)];
    gradingView.delegate = self;
    [self.view addSubview:gradingView];
}

- (void)didGradingForInteger:(NSUInteger)grade {
    NSLog(@"%lu", (unsigned long)grade);
}

@end
