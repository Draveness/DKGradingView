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
        self.totalGrade = 5;
        self.gradingImage = [UIImage imageNamed:@"selected"];
        self.ungradingImage = [UIImage imageNamed:@"unselected"];
        CGFloat offset = 10;
        CGFloat height = frame.size.height;
        CGFloat width = frame.size.width;

        CGFloat blankWidth = (self.totalGrade + 1) * offset;

        CGFloat componentSize = MIN((width - blankWidth) / self.totalGrade, height - 2 * offset);
        __unused CGSize size = CGSizeMake(componentSize, componentSize);
        for (NSNumber *number in @[@0, @1, @2, @3, @4]) {
            CGFloat imageViewWidth = offset + (componentSize + offset) * number.integerValue;
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageViewWidth, offset, componentSize, componentSize)];
            imageView.image = self.ungradingImage;
            imageView.userInteractionEnabled = YES;
            imageView.tag = number.integerValue;
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
