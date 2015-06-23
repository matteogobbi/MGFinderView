//
//  MGFinderView.m
//  MGFinderView
//
//  Created by Matteo Gobbi on 31/05/2015.
//  Copyright (c) 2015 Matteo Gobbi. All rights reserved.
//

#import "MGFinderView.h"

#define kMGDefaultColor [UIColor blueColor]


static const CGFloat kMGOffsetToLineWidthFactor = 0.70;

static const CGFloat kMGDegreeToRadianFactor = 0.0174532925;

// For automatic calcualation
static const CGFloat kMGRadiusToLineWidthFactor = 0.09;


@interface MGFinderView ()

@property (strong, nonatomic) UIView *targetView;

@end


@implementation MGFinderView


#pragma mark - Lifecycle

- (void)awakeFromNib
{
    self.backgroundColor = [UIColor clearColor];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    return [self initWithSquareSide:frame.size.width color:kMGDefaultColor];
}

- (instancetype)initWithSquareSide:(CGFloat)side color:(UIColor *)color
{
    if (self = [super initWithFrame:CGRectMake(0, 0, side, side)]) {
        // Set an automatic line
        _lineWidth = self.frame.size.width * kMGRadiusToLineWidthFactor;
        _color = [color copy];
        _circleDuration = 5.0;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

+ (instancetype)showAnimatedFinderViewForTargetView:(UIView *)targetView
{
    return [self showAnimatedFinderViewForTargetView:targetView color:kMGDefaultColor];
}

+ (instancetype)showAnimatedFinderViewForTargetView:(UIView *)targetView color:(UIColor *)color
{
    NSAssert(targetView, @"View must not be nil");
    
    CGFloat targetSide = targetView.frame.size.width;
    CGFloat lineWidth = (targetSide * kMGRadiusToLineWidthFactor) / (1.0 - kMGRadiusToLineWidthFactor);
    CGFloat offsetSpace = lineWidth*kMGOffsetToLineWidthFactor;
    CGFloat side = targetSide + offsetSpace*2.0 + lineWidth*2.0;
    
    MGFinderView *finderView = [[MGFinderView alloc] initWithSquareSide:side color:color];
    finderView.targetView = targetView;
    [targetView.superview addSubview:finderView];
    finderView.center = targetView.center;
    [finderView startAnimating];
    
    return finderView;
}

- (void)drawRect:(CGRect)rect
{
    CGFloat side = self.frame.size.width;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [_color setStroke];
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGMutablePathRef path2 = CGPathCreateMutable();
    CGMutablePathRef path3 = CGPathCreateMutable();
    
    CGPathAddArc(path, NULL, side/2.0, side/2.0, (side-_lineWidth)/2.0, 180.0*kMGDegreeToRadianFactor, 280.0*kMGDegreeToRadianFactor, 0);
    CGPathAddArc(path2, NULL, side/2.0, side/2.0, (side-_lineWidth)/2.0, 300.0*kMGDegreeToRadianFactor, 40.0*kMGDegreeToRadianFactor, 0);
    CGPathAddArc(path3, NULL, side/2.0, side/2.0, (side-_lineWidth)/2.0, 60.0*kMGDegreeToRadianFactor, 160.0*kMGDegreeToRadianFactor, 0);
    
    CGContextAddPath(context, path);
    CGContextAddPath(context, path2);
    CGContextAddPath(context, path3);
    
    CGContextSetLineWidth(context, _lineWidth);
    CGContextStrokePath(context);
}


#pragma mark - Public methods

- (void)startAnimating
{
    [self.layer removeAllAnimations];
    
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0];
    rotationAnimation.duration = _circleDuration;
    rotationAnimation.cumulative = NO;
    rotationAnimation.repeatCount = INFINITY;
    rotationAnimation.removedOnCompletion = NO;
    
    [self.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}



@end
