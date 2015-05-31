//
//  MGFinderView.m
//  MGFinderView
//
//  Created by Matteo Gobbi on 31/05/2015.
//  Copyright (c) 2015 Matteo Gobbi. All rights reserved.
//

#import "MGFinderView.h"

static const CGFloat degreeToRadianFactor = 0.0174532925;

// For automatic calcualation
static const CGFloat radiusToLineWidthFactor = 0.2;


@implementation MGFinderView

- (instancetype)initWithFrame:(CGRect)frame
{
    return [self initWithSquareSide:frame.size.width color:[UIColor blueColor]];
}

- (instancetype)initWithSquareSide:(CGFloat)side color:(UIColor *)color
{
    if (self = [super initWithFrame:CGRectMake(0, 0, side, side)]) {
        // Set an automatic line
        _lineWidth = self.frame.size.width * radiusToLineWidthFactor;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGFloat side = self.frame.size.width;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [_color setStroke];
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGMutablePathRef path2 = CGPathCreateMutable();
    CGMutablePathRef path3 = CGPathCreateMutable();
    
    CGPathAddArc(path, NULL, self.center.x, self.center.y, (side-_lineWidth)/2.0, 180.0*degreeToRadianFactor, 280.0*degreeToRadianFactor, 0);
    CGPathAddArc(path2, NULL, self.center.x, self.center.y, (side-_lineWidth)/2.0, 300.0*degreeToRadianFactor, 40.0*degreeToRadianFactor, 0);
    CGPathAddArc(path3, NULL, self.center.x, self.center.y, (side-_lineWidth)/2.0, 60.0*degreeToRadianFactor, 160.0*degreeToRadianFactor, 0);
    
    CGContextAddPath(context, path);
    CGContextAddPath(context, path2);
    CGContextAddPath(context, path3);
    
    CGContextSetLineWidth(context, _lineWidth);
    CGContextStrokePath(context);
}

@end
