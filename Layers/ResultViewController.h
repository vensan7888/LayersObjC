//
//  ResultViewController.h
//  Layers
//
//  Created by Venu on 01/02/13.
//  Copyright (c) 2013 Venu. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ResultViewController : UIViewController
-(void)showLayer;
-(void)showShapeLayer;
-(void)showReplicatorLayer;
-(void)showTransformLayer;
-(void)showTransformLayer2;
- (IBAction)backToMenu:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *closeBtn;
@end
