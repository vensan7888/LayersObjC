//
//  ResultViewController.m
//  Layers
//
//  Created by Venu on 01/02/13.
//  Copyright (c) 2013 Venu. All rights reserved.
//

#import "ResultViewController.h"
#import "ReplicationView.h"
#import "ShapeView.h"
#import "TransformView.h"
#import "LayerView.h"
@interface ResultViewController ()

@end

@implementation ResultViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)showLayer
{
    LayerView *layers = [[LayerView alloc]initWithFrame:self.view.bounds];
    [layers showLayers];
    [self.view addSubview:layers];
    [self.view bringSubviewToFront:self.closeBtn];
}

-(void)showShapeLayer
{
    ShapeView *sampleShape = [[ShapeView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    [sampleShape drawShape];
    sampleShape.center = self.view.center;
    [self.view addSubview:sampleShape];
    [self.view bringSubviewToFront:self.closeBtn];
}

-(void)showReplicatorLayer
{
    ReplicationView *replicater = [[ReplicationView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    [replicater setCenter:self.view.center];
    [replicater startAnimating];
    [self.view addSubview:replicater];
    [self.view bringSubviewToFront:self.closeBtn];
}

-(void)showTransformLayer
{
    TransformView *transform = [[TransformView alloc]initWithFrame:self.view.bounds];
    [transform transformOne];
    [self.view addSubview:transform];
    [self.view bringSubviewToFront:self.closeBtn];
}
-(void)showTransformLayer2
{
    TransformView *transform = [[TransformView alloc]initWithFrame:self.view.bounds];
    [transform transformTwo];
    [self.view addSubview:transform];
    [self.view bringSubviewToFront:self.closeBtn];
}

- (IBAction)backToMenu:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
