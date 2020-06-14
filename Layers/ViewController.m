//
//  ViewController.m
//  Layers
//
//  Created by Venu on 29/01/13.
//  Copyright (c) 2013 Venu. All rights reserved.
//

#import "ViewController.h"
#import "ResultViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)simpleLayerAction:(id)sender {
    
    ResultViewController *resultView = [[ResultViewController alloc]initWithNibName:@"ResultViewController" bundle:nil];
    [resultView showLayer];
    [self presentViewController:resultView animated:YES completion:^{
        
    }];
    
}

- (IBAction)shapeLayerAction:(id)sender {
    ResultViewController *resultView = [[ResultViewController alloc]initWithNibName:@"ResultViewController" bundle:nil];
    [resultView showShapeLayer];
    [self presentViewController:resultView animated:YES completion:^{
        
    }];
}

- (IBAction)replicaterAction:(id)sender {
    ResultViewController *resultView = [[ResultViewController alloc]initWithNibName:@"ResultViewController" bundle:nil];
    [resultView showReplicatorLayer];
    [self presentViewController:resultView animated:YES completion:^{
        
    }];
}

- (IBAction)transformAction:(id)sender {
    ResultViewController *resultView = [[ResultViewController alloc]initWithNibName:@"ResultViewController" bundle:nil];
    [resultView showTransformLayer];
    [self presentViewController:resultView animated:YES completion:^{
        
    }];
}

- (IBAction)transformAction2:(id)sender {
    ResultViewController *resultView = [[ResultViewController alloc]initWithNibName:@"ResultViewController" bundle:nil];
    [resultView showTransformLayer2];
    [self presentViewController:resultView animated:YES completion:^{
        
    }];
}
@end
