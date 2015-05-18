//
//  DKGradingView.m
//  DKGradingView
//
//  Created by apple on 15/5/18.
//  Copyright (c) 2015年 DeltaX. All rights reserved.
//

#import "DKGradingView.h"

@interface DKGradingView ()

@property (nonatomic, assign) NSUInteger totalGrade;
@property (nonatomic, strong) NSMutableArray *thumbnailImageViews;

@end

@implementation DKGradingView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.totalGrade = 10;

        self.gradingImage = [UIImage imageNamed:@"selected"];
        self.ungradingImage = [UIImage imageNamed:@"unselected"];


        CGFloat height = frame.size.height;
        CGFloat width = frame.size.width;

        CGFloat ratio = 5;
        CGFloat offset = width / (6 * self.totalGrade - 1);

        CGFloat componentSize = MIN(ratio * offset, height);
        __unused CGSize size = CGSizeMake(componentSize, componentSize);
        for (int i = 0; i < self.totalGrade; i++) {
            CGFloat imageViewWidth = (componentSize + offset) * i;
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageViewWidth, 0, componentSize, componentSize)];
            CGPoint center = imageView.center;
            center.y = self.frame.size.height / 2;
            imageView.center = center;
            imageView.image = self.ungradingImage;
            imageView.userInteractionEnabled = YES;
            imageView.tag = i;
            UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(grading:)];
            [imageView addGestureRecognizer:gesture];
            [self.thumbnailImageViews addObject:imageView];
            [self addSubview:imageView];
        }
    }
    return self;
}

- (NSMutableArray *)thumbnailImageViews {
    if (!_thumbnailImageViews) {
        _thumbnailImageViews = [[NSMutableArray alloc] initWithCapacity:self.totalGrade];
    }
    return _thumbnailImageViews;
}

- (void)grading:(UITapGestureRecognizer *)gesture {
    NSUInteger tag = gesture.view.tag;
    [self.thumbnailImageViews enumerateObjectsUsingBlock:^(UIImageView *imageView, NSUInteger idx, BOOL *stop) {
        if (idx <= tag) {
            imageView.image = self.gradingImage;
        } else {
            imageView.image = self.ungradingImage;
        }
    }];

}

@end
