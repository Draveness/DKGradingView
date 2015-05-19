//
//  DKGradingView.m
//  DKGradingView
//
//  Created by apple on 15/5/18.
//  Copyright (c) 2015年 DeltaX. All rights reserved.
//

#import "DKGradingView.h"

@interface DKGradingView ()

@property (nonatomic, strong) NSMutableArray *thumbnailImageViews;

@end

@implementation DKGradingView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.thumbnailImageViews = [[NSMutableArray alloc] init];
        self.ratio = 5;
        self.totalGrade = 5;

        self.gradingImage = [UIImage imageNamed:@"selected"];
        self.ungradingImage = [UIImage imageNamed:@"unselected"];
    }
    return self;
}

- (UIImageView *)imageViewForGradingViewWithFrame:(CGRect)frame andTag:(NSUInteger)tag {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image = self.ungradingImage;
    imageView.userInteractionEnabled = YES;
    imageView.tag = tag;

    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(grading:)];
    [imageView addGestureRecognizer:gesture];
    return imageView;
}

- (CGRect)imageViewFrameWithNumber:(NSNumber *)number {
    CGFloat viewHeight = self.frame.size.height;
    CGFloat viewWidth = self.frame.size.width;

    CGFloat padding = viewWidth / (6 * self.totalGrade - 1);
    CGFloat componentWidth = MIN(self.ratio * padding, viewHeight);

    CGFloat imageViewX = (componentWidth + padding) * number.integerValue;

    CGRect rect = CGRectMake(imageViewX, 0, 0, 0);
    rect.size = CGSizeMake(componentWidth, componentWidth);
    rect.origin.y = (viewHeight - componentWidth) / 2.0;

    return rect;
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

#pragma mark - Setter/Getter

- (NSMutableArray *)thumbnailImageViews {
    if (!_thumbnailImageViews) {
        _thumbnailImageViews = [[NSMutableArray alloc] initWithCapacity:self.totalGrade];
    }
    return _thumbnailImageViews;
}

- (void)setUngradingImage:(UIImage *)ungradingImage {
    _ungradingImage = ungradingImage;
    for (UIImageView *imageView in self.thumbnailImageViews) {
        imageView.image = _ungradingImage;
    }
}

- (void)setTotalGrade:(NSUInteger)totalGrade {
    NSAssert(totalGrade > 0, @"Total grade must greater than 0!");
    _totalGrade = totalGrade;
    for (UIImageView *imageView in self.thumbnailImageViews) {
        [imageView removeFromSuperview];
    }

    for (int i = 0; i < self.totalGrade; i++) {
        CGRect imageViewRect = [self imageViewFrameWithNumber:[NSNumber numberWithInteger:i]];

        UIImageView *imageView = [self imageViewForGradingViewWithFrame:imageViewRect andTag:i];

        [self.thumbnailImageViews addObject:imageView];
        [self addSubview:imageView];
    }
}

- (void)setRatio:(NSUInteger)ratio {
    _ratio = ratio;
    [self.thumbnailImageViews enumerateObjectsUsingBlock:^(UIImageView *imageView, NSUInteger idx, BOOL *stop) {
        imageView.frame = [self imageViewFrameWithNumber:[NSNumber numberWithInteger:idx]];
    }];
}

@end
