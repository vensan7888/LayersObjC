//
//  TransformView.m
//  Layers
//
//  Created by Venu on 01/02/13.
//  Copyright (c) 2013 Venu. All rights reserved.
//

#import "TransformView.h"
#import "ReplicationView.h"
#import "ShapeView.h"
//CGFloat DegreesToRadians(CGFloat degrees) {return degrees * M_PI / 180;};
//CGFloat RadiansToDegrees(CGFloat radians) {return radians * 180 / M_PI;};

@implementation TransformView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIButton *stopAnimation = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        stopAnimation.frame = CGRectMake(0, 0, 70, 30);
        [stopAnimation addTarget:self action:@selector(toggleAnimation) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:stopAnimation];
        [stopAnimation setTitle:@"Toggle" forState:UIControlStateNormal];
        [stopAnimation.titleLabel setTextColor:[UIColor blackColor]];
    }
    return self;
}
-(void)toggleAnimation
{
    if (!isTransformStarted) {
        [self animate];
        isTransformStarted = YES;
        return;
   }
    
    if (isAnimating) {
        [self stopAnimation];
    }
    else
    {
        [self startAnimation];
    }
}
-(void)stopAnimation
{
    [self pauseLayer:transformLayer];
/*    CALayer *pLayer = [transformLayer presentationLayer];
    transformLayer.transform = pLayer.transform;
    [transformLayer removeAnimationForKey:@"animationKey"];
*/    isAnimating = NO;
}
-(void)startAnimation
{
    [self resumeLayer:transformLayer];
//    [self animate];
}
-(void)pauseLayer:(CALayer*)layer
{
    pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    layer.speed = 0.0;
    layer.timeOffset = pausedTime;
}

-(void)resumeLayer:(CALayer*)layer
{
    pausedTime = [layer timeOffset];
    layer.speed = 1.0;
    layer.timeOffset = pausedTime;
    layer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    layer.beginTime = timeSincePause;
    isAnimating = YES;
}

-(void)transformOne
{
    [self startTransform];
}
-(void)transformTwo
{
    [self additionalTransform];
}
-(void)startTransform
{
    // Do any additional setup after loading the view, typically from a nib.
    rootLayer = [CALayer layer];
    S_W = 200;
    S_H = 200;
    S_X = self.center.x-(S_W/2.0);
    S_Y = self.center.y-(S_H/2.0);
    
	rootLayer.frame = CGRectMake(S_X, S_Y, S_W, S_H);
	[self.layer addSublayer:rootLayer];
    transformLayer = [CATransformLayer layer];
    transformLayer.frame = rootLayer.bounds;
    transformLayer.anchorPoint = CGPointMake(.5, .5);
    
    transformLayer.anchorPointZ = -S_W/2;
    
    
    
    frontLayer = [CALayer layer];
    frontLayer.frame = transformLayer.bounds;
    frontLayer.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:.5].CGColor;
    frontLayer.borderColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1].CGColor;
    frontLayer.borderWidth = 1.0;
    [self addText:@"Front" layer:frontLayer];
    ////    frontLayer.contents = (id)[UIImage imageNamed:@"about.jpeg"].CGImage;
    
    
    leftLayer = [CALayer layer];
    leftLayer.frame = transformLayer.bounds;
    leftLayer.backgroundColor = [UIColor colorWithRed:1 green:1 blue:0 alpha:.5].CGColor;
    leftLayer.borderColor = [UIColor colorWithRed:1 green:1 blue:0 alpha:1].CGColor;
    leftLayer.borderWidth = 1.0;
    [self addText:@"Left" layer:leftLayer];
    //    leftLayer.contents = (id)[UIImage imageNamed:@"about.jpeg"].CGImage;
    //    leftLayer.anchorPoint = CGPointMake(1, .5);
    
    rightLayer = [CALayer layer];
    rightLayer.frame = transformLayer.bounds;
    rightLayer.backgroundColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:.5].CGColor;
    rightLayer.borderColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:1].CGColor;
    rightLayer.borderWidth = 1.0;
    [self addText:@"Right" layer:rightLayer];
    //    rightLayer.contents = (id)[UIImage imageNamed:@"about.jpeg"].CGImage;
    //    rightLayer.anchorPoint = CGPointMake(0, .5);
    
    
    backLayer = [CALayer layer];
    backLayer.frame = transformLayer.bounds;
    backLayer.backgroundColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:.5].CGColor;
    backLayer.borderColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:1].CGColor;
    backLayer.borderWidth = 1.0;
    [self addText:@"Back" layer:backLayer];
    //    backLayer.contents = (id)[UIImage imageNamed:@"about.jpeg"].CGImage;

    [transformLayer addSublayer:frontLayer];
    [transformLayer addSublayer:leftLayer];
    [transformLayer addSublayer:rightLayer];
    [transformLayer addSublayer:backLayer];
    
    
    NSLog(@"Anchor == %f , %f",frontLayer.anchorPoint.x,frontLayer.anchorPoint.y);
    
    CATransform3D rotation = CATransform3DMakeRotation(DegreesToRadians(-90), 0.0, 1.0, 0.0);
	CATransform3D translation = CATransform3DMakeTranslation(-((S_W)/2), 0.0, (S_W/-2));
	CATransform3D position = CATransform3DConcat(rotation, translation);
    leftLayer.transform = position;
    
    rotation = CATransform3DMakeRotation(DegreesToRadians(90), 0.0, 1.0, 0.0);
	translation = CATransform3DMakeTranslation(((S_W)/2), 0.0, (S_W/-2));
	position = CATransform3DConcat(rotation, translation);
    rightLayer.transform = position;
    
    rotation = CATransform3DMakeRotation(DegreesToRadians(180), 0.0, 1.0, 0.0);
	translation = CATransform3DMakeTranslation(0, 0.0, -(S_W));
	position = CATransform3DConcat(rotation, translation);
    backLayer.transform = position;
    
    CALayer *xLayer = [CALayer layer];
    xLayer.frame = CGRectMake(0, 0, 3, 2*S_H);
    xLayer.position = CGPointMake(S_W/2.0, S_H/2.0);
    [transformLayer addSublayer:xLayer];
    xLayer.zPosition = -S_W/2.0;
    [xLayer setBackgroundColor:[UIColor redColor].CGColor];
    
    
    CALayer *yLayer = [CALayer layer];
    yLayer.frame = CGRectMake(0, 0, 2*S_W, 3);
    yLayer.position = CGPointMake(S_W/2.0, S_H/2.0);
    [transformLayer addSublayer:yLayer];
    yLayer.zPosition = -S_H/2.0;
    [yLayer setBackgroundColor:[UIColor greenColor].CGColor];
    
    CALayer *zLayer = [CALayer layer];
    zLayer.frame = CGRectMake(0, 0, 2*S_W, 3);
    zLayer.position = CGPointMake(S_W/2.0, S_H/2.0);
    [transformLayer addSublayer:zLayer];
    zLayer.zPosition = -S_H/2.0;
    
    rotation = CATransform3DMakeRotation(DegreesToRadians(90), 0.0, 1.0, 0.0);
    zLayer.transform = rotation;
    [zLayer setBackgroundColor:[UIColor blueColor].CGColor];
    
    float distance = -500;
    
    CATransform3D basicTrans = CATransform3DIdentity;
    basicTrans.m34 = 1.0/distance;
    rootLayer.sublayerTransform = CATransform3DRotate(basicTrans, DegreesToRadians(5), 0.0f, 0.0f, 1.0f);
    [rootLayer addSublayer:transformLayer];
////    [rootLayer setBackgroundColor:[UIColor colorWithRed:1 green:0 blue:1 alpha:.6].CGColor];
}

- (void)animate {
    
    CABasicAnimation *rotationY = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    rotationY.toValue = [NSNumber numberWithFloat:DegreesToRadians(360)];
    [rotationY setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    
    rotationY.removedOnCompletion = NO;
    
    CABasicAnimation *rotationX = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    rotationX.toValue = [NSNumber numberWithFloat:DegreesToRadians(360)];
    [rotationX setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    rotationX.removedOnCompletion = NO;
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:[NSArray arrayWithObjects:rotationX,rotationY, nil]];
    [group setRepeatCount:HUGE_VALF];
    [group setDuration:6];
    group.removedOnCompletion = NO;
    [transformLayer addAnimation:group forKey:@"animationKey"];
    isAnimating = YES;
}

-(CALayer*)getReplicationView:(CGRect)frame
{
    ReplicationView *replicater = [[ReplicationView alloc]initWithFrame:frame];
 //   [replicater setCenter:self.center];
    [replicater startAnimating];
    return replicater.layer;
}
-(CALayer*)getShapeLayer:(CGRect)frame
{
    ShapeView *sampleShape = [[ShapeView alloc]initWithFrame:frame];
    [sampleShape drawShape];
    return sampleShape.layer;
}
-(CALayer*)getShapeReplicater:(CGRect)frame
{
    ReplicationView *replicater = [[ReplicationView alloc]initWithFrame:frame];
    //   [replicater setCenter:self.center];
    [replicater setReplicantLayer:[self getShapeLayer:CGRectMake(0, 0, 10, 10)]];
    [replicater startAnimating];
    return replicater.layer;
}

-(void)additionalTransform
{
    [self startTransform];
    [frontLayer addSublayer:[self getReplicationView:CGRectMake(0, 0, 200, 200)]];
    CALayer *shapeLayer = [self getShapeLayer:CGRectMake(0, 0, 200, 200)];
    shapeLayer.opacity = .5;
    [leftLayer addSublayer: shapeLayer];
    [rightLayer addSublayer:[self getShapeReplicater:CGRectMake(0, 0, 200, 200)]];
}

-(void)addText:(NSString*)title layer:(CALayer*)layer
{
    CATextLayer *textLayer = [CATextLayer layer];
    [textLayer setString:title];
    [textLayer setForegroundColor:[UIColor blackColor].CGColor];
    textLayer.frame = layer.bounds;
    [layer addSublayer:textLayer];
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
