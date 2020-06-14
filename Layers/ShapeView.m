//
//  ShapeView.m
//  Layers
//
//  Created by Venu on 01/02/13.
//  Copyright (c) 2013 Venu. All rights reserved.
//

#import "ShapeView.h"

@implementation ShapeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)drawShape
{
    CAShapeLayer * heartMarkerLayer = [CAShapeLayer layer];
    [heartMarkerLayer setFillColor:[[UIColor colorWithRed:1.0
                                                    green:0.3
                                                     blue:0.3
                                                    alpha:1.0] CGColor]];
    [heartMarkerLayer setStrokeColor:[[UIColor colorWithRed:0.7
                                                      green:0.0
                                                       blue:0.0
                                                      alpha:1.0] CGColor]];
    UIBezierPath * heartPath = [UIBezierPath bezierPath];
    
    float centerX = CGRectGetWidth(self.frame)/2.0;
    float centerY = CGRectGetHeight(self.frame)/2.0;
    
    [heartPath moveToPoint:CGPointMake(centerX, 0+(CGRectGetHeight(self.frame)))];
    [heartPath addCurveToPoint:CGPointMake(centerX, centerY-(15+20))
                 controlPoint1:CGPointMake(centerX-(CGRectGetWidth(self.frame))/1.0, centerY-(15+(CGRectGetHeight(self.frame))/3.0))
                 controlPoint2:CGPointMake(centerX-(CGRectGetWidth(self.frame))/12.0, centerY-(15+(CGRectGetHeight(self.frame))/1.0))];
    [heartPath addCurveToPoint:CGPointMake(centerX, 0+(CGRectGetHeight(self.frame)))
                 controlPoint1:CGPointMake(centerX+(CGRectGetWidth(self.frame))/12.0, centerY-(15+(CGRectGetHeight(self.frame))/1.0))
                 controlPoint2:CGPointMake(centerX+(CGRectGetWidth(self.frame))/1.0, centerY-(15+(CGRectGetHeight(self.frame))/3.0))];
    [heartMarkerLayer setPath:[heartPath CGPath]];

    [heartMarkerLayer setLineWidth:1.0];
    [heartMarkerLayer setLineJoin:kCALineCapSquare];
//    heartMarkerLayer.position = self.center;//CGPointMake(CGRectGetWidth(self.bounds)/2.0, CGRectGetHeight(self.bounds)/2.0);
    [[self layer] addSublayer:heartMarkerLayer];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
