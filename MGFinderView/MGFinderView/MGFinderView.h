//
//  MGFinderView.h
//  MGFinderView
//
//  Created by Matteo Gobbi on 31/05/2015.
//  Copyright (c) 2015 Matteo Gobbi. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface MGFinderView : UIView

@property (nonatomic) IBInspectable UIColor *color;
@property (nonatomic) IBInspectable CGFloat lineWidth;
@property (nonatomic) IBInspectable CGFloat circleDuration;

+ (instancetype)showAnimatedFinderViewForTargetView:(UIView *)targetView bounce:(BOOL)bounce;
+ (instancetype)showAnimatedFinderViewForTargetView:(UIView *)targetView color:(UIColor *)color bounce:(BOOL)bounce;
- (instancetype)initWithSquareSide:(CGFloat)side color:(UIColor *)color;
- (void)startAnimating;

@end
