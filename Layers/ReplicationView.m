//
//  ReplicationView.m
//  Layers
//
//  Created by Venu on 01/02/13.
//  Copyright (c) 2013 Venu. All rights reserved.
//

#import "ReplicationView.h"

@implementation ReplicationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
#define kDefaultNumberOfReplicants 12
#define kDefaultSpread 35.0
#define kDefaultColor ([UIColor whiteColor])
#define kDefaultThickness 8.0
#define kDefaultLength 25.0
#define kDefaultSpeed 1.0

// HUD defaults
#define kDefaultHUDSide 160.0
#define kDefaultHUDColor ([UIColor colorWithWhite:0.0 alpha:0.5])

#define kMarkerAnimationKey @"MarkerAnimationKey"
- (void)startAnimating {
    
    if (![self replicantLayer]) {
        // There was no set spinner marker
        // Create one from the other properties
        [self setReplicantLayer:[self _newReplicant]];
    }
    [[self replicantLayer] setPosition:CGPointMake(kDefaultHUDSide*0.5, kDefaultHUDSide*0.5+kDefaultSpread)];
    
    // Create a replicator layer that is centered in the activity indicator view
    CAReplicatorLayer * spinnerReplicator = [CAReplicatorLayer layer];
    [spinnerReplicator setBounds:CGRectMake(0, 0, kDefaultHUDSide, kDefaultHUDSide)];
    [spinnerReplicator setCornerRadius:10.0];
    [spinnerReplicator setBackgroundColor:[kDefaultHUDColor CGColor]];
    [spinnerReplicator setPosition:CGPointMake((CGRectGetWidth([self frame])/2.0),
                                               (CGRectGetHeight([self frame])/2.0))];
    
    
    CGFloat angle = -(2.0*M_PI)/(kDefaultNumberOfReplicants);
    CATransform3D instanceRotation = CATransform3DMakeRotation(angle, 0.0, 0.0, 1.0);
    [spinnerReplicator setInstanceCount:kDefaultNumberOfReplicants];
    [spinnerReplicator setInstanceTransform:instanceRotation];
    
    CGFloat markerAnimationDuration = kDefaultSpeed/kDefaultNumberOfReplicants;
    [spinnerReplicator setInstanceDelay:markerAnimationDuration];
    [spinnerReplicator setInstanceColor:[UIColor colorWithRed:(.2) green:(.5) blue:(.2) alpha:1].CGColor];
    spinnerReplicator.instanceRedOffset = .1;
    spinnerReplicator.instanceBlueOffset = .07;
    spinnerReplicator.instanceGreenOffset = .04;
    // Add the spinner marker to the replicator
    [spinnerReplicator addSublayer:[self replicantLayer]];
    [[self layer] addSublayer:spinnerReplicator];
    

    [[self replicantLayer] setOpacity:0.0];
    CABasicAnimation * fade = [CABasicAnimation animationWithKeyPath:@"opacity"];
    [fade setToValue:[NSNumber numberWithFloat:0.0]];
    [fade setFromValue:[NSNumber numberWithFloat:1.0]];
    [fade setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    [fade setRepeatCount:HUGE_VALF];
    [fade setDuration:kDefaultSpeed];
    
    
    [[self replicantLayer] addAnimation:fade forKey:kMarkerAnimationKey];
}

- (CALayer *)_newReplicant {
    CALayer * marker = [CALayer layer];
    [marker setBounds:CGRectMake(0, 0, kDefaultThickness, kDefaultLength)];
    [marker setCornerRadius:kDefaultThickness*0.5];
    [marker setBackgroundColor:[kDefaultColor CGColor]];
    [marker setPosition:CGPointMake(kDefaultHUDSide*0.5, kDefaultHUDSide*0.5+kDefaultSpread)];
    
    
    return marker;
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
