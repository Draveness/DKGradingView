//
//  DKGradingView.h
//  DKGradingView
//
//  Created by apple on 15/5/18.
//  Copyright (c) 2015年 DeltaX. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DKGradingProtocol <NSObject>

@optional

/**
 *  @author Draveness
 *
 *  Delegate method after grading
 *
 *  @param grade Current Point you get, you can also get the current grade from `currentGrade` property
 */
- (void)didGradingForInteger:(NSUInteger)grade;

@end

@interface DKGradingView : UIView

/**
 *  @author Draveness
 *
 *  When the small part of grading view is highlighted, this image is attached to it
 */
@property (nonatomic, strong) UIImage *gradingImage;

/**
 *  @author Dravenss
 *
 *  When the small part of grading view is unhighlighted, this image is attached to it
 */
@property (nonatomic, strong) UIImage *ungradingImage;

/**
 *  @author Dravenss
 *
 *  The ratio is every small parts / blanking space, default is 5. Means if every part's height
 *  and width is 50, the blanking space between each part is 10
 */
@property (nonatomic, assign) NSUInteger ratio;

/**
 *  @author Draveness
 *
 *  Current graing from 0 to max grade
 */
@property (nonatomic, assign, readonly) NSUInteger currentGrade;

/**
 *  @author Draveness
 *
 *  Maximum grading, controls the small part number of grading view
 */
@property (nonatomic, assign) NSUInteger totalGrade;

/**
 *  @author Draveness
 *
 *  Delegate is optional to implement method `didGradingForInteger:`
 */
@property (nonatomic, strong) id<DKGradingProtocol> delegate;

@end
