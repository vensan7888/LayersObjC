//
//  TransformView.h
//  Layers
//
//  Created by Venu on 01/02/13.
//  Copyright (c) 2013 Venu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@interface TransformView : UIView
{
    CALayer	*rootLayer;
    CALayer *frontLayer,*leftLayer;
    CALayer *rightLayer;
    CALayer *backLayer;
    CATransformLayer *transformLayer;
    int degreeCount;
    float S_X,S_Y,S_W,S_H;
    BOOL isAnimating,isTransformStarted;
    CFTimeInterval pausedTime;
}
-(void)transformOne;
-(void)transformTwo;
@end
