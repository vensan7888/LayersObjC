//
//  LayerView.m
//  Layers
//
//  Created by Venu on 02/02/13.
//  Copyright (c) 2013 Venu. All rights reserved.
//

#import "LayerView.h"
#import "ShapeView.h"
@implementation LayerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)showLayers
{
    CALayer *commonLayer = [self getShapeLayer:CGRectMake(-50+CGRectGetWidth(self.frame)/2.0, 10, 100, 100)];
    [self.layer addSublayer:commonLayer];
    
    float rotationAngle = 45;
    
    CALayer *xPLayer = [self getShapeLayer:CGRectMake(10, 10+(110), 100, 100)];
    xPLayer.transform = CATransform3DMakeRotation(DegreesToRadians(rotationAngle), 1.0, 0, 0);
    [self.layer addSublayer:xPLayer];
    
    CALayer *xNLayer = [self getShapeLayer:CGRectMake(95+(110), 10+(110), 100, 100)];
    xNLayer.transform = CATransform3DMakeRotation(DegreesToRadians(-rotationAngle), 1.0, 0, 0);
    [self.layer addSublayer:xNLayer];
    
    CALayer *yPLayer = [self getShapeLayer:CGRectMake(10, 10+(220), 100, 100)];
    yPLayer.transform = CATransform3DMakeRotation(DegreesToRadians(rotationAngle), 0, 1.0, 0);
    [self.layer addSublayer:yPLayer];
    
    CALayer *yNLayer = [self getShapeLayer:CGRectMake(95+(110), 10+(220), 100, 100)];
    yNLayer.transform = CATransform3DMakeRotation(DegreesToRadians(-rotationAngle), 0, 1.0, 0);
    [self.layer addSublayer:yNLayer];
    
    CALayer *zPLayer = [self getShapeLayer:CGRectMake(10, 10+(330), 100, 100)];
    zPLayer.transform = CATransform3DMakeRotation(DegreesToRadians(rotationAngle), 0, 0, 1.0);
    [self.layer addSublayer:zPLayer];
    
    CALayer *zNLayer = [self getShapeLayer:CGRectMake(95+(110), 10+(330), 100, 100)];
    zNLayer.transform = CATransform3DMakeRotation(DegreesToRadians(-rotationAngle), 0, 0, 1.0);
    [self.layer addSublayer:zNLayer];
    
//    perspective
    float distance = -500;
    CATransform3D basicTrans = CATransform3DIdentity;
    basicTrans.m34 = 1.0/distance;
    xPLayer.transform = CATransform3DRotate(basicTrans, DegreesToRadians(rotationAngle), 1.0f, 0,0);
    xNLayer.transform = CATransform3DRotate(basicTrans,DegreesToRadians(-rotationAngle), 1.0, 0, 0);
    yPLayer.transform = CATransform3DRotate(basicTrans,DegreesToRadians(rotationAngle), 0, 1.0, 0);
    yNLayer.transform = CATransform3DRotate(basicTrans,DegreesToRadians(-rotationAngle), 0, 1.0, 0);
    zPLayer.transform = CATransform3DRotate(basicTrans,DegreesToRadians(rotationAngle), 0, 0, 1.0);
    zNLayer.transform = CATransform3DRotate(basicTrans,DegreesToRadians(-rotationAngle), 0, 0, 1.0);
    
//  displaye labels
    [self displayLabelAt:CGRectMake(10, 70, 100, 50) title:@"'+ve' Rotation"];
    [self displayLabelAt:CGRectMake(220, 70, 100, 50) title:@"'-ve' Rotation"];
    
    [self displayLabelAt:CGRectMake(-45+CGRectGetWidth(self.frame)/2.0, 165, 100, 50) title:@"Around 'X'"];
    [self displayLabelAt:CGRectMake(-45+CGRectGetWidth(self.frame)/2.0, 275, 100, 50) title:@"Around 'Y'"];
    [self displayLabelAt:CGRectMake(-45+CGRectGetWidth(self.frame)/2.0, 385, 100, 50) title:@"Around 'Z'"];
}
-(CALayer*)getShapeLayer:(CGRect)layerFrame
{
    CALayer *layer = [CALayer layer];
    layer.contents = (id)[UIImage imageNamed:@"Lion.png"].CGImage;
    layer.frame = layerFrame;
    return layer;
    ShapeView *sampleShape = [[ShapeView alloc]initWithFrame:layerFrame];
    [sampleShape drawShape];
    [sampleShape setBackgroundColor:[UIColor colorWithRed:0 green:.1 blue:.1 alpha:.5]];
    return sampleShape.layer;
}

-(void)displayLabelAt:(CGRect)frame title:(NSString*)title
{
    UILabel *tempLabel = [[UILabel alloc]initWithFrame:frame];
    [tempLabel setText:title];
    [tempLabel setBackgroundColor:[UIColor clearColor]];
    [tempLabel setTextColor:[UIColor colorWithRed:.5 green:.2 blue:.1 alpha:1]];
    [self addSubview:tempLabel];
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
