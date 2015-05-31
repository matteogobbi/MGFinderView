//
//  ViewController.m
//  MGFinderView
//
//  Created by Matteo Gobbi on 31/05/2015.
//  Copyright (c) 2015 Matteo Gobbi. All rights reserved.
//

#import "ViewController.h"
#import "MGFinderView.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet MGFinderView *finderView;
@property (weak, nonatomic) IBOutlet UIView *targetView;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // View by code
    MGFinderView *finderView = [[MGFinderView alloc] initWithSquareSide:150 color:[UIColor greenColor]];
    finderView.center = CGPointMake(150.0, 150.0);
    [self.view addSubview:finderView];
    [finderView startAnimating];
    
    // View from IB
    [_finderView startAnimating];
    
    // TargetView example
    _targetView.layer.cornerRadius = _targetView.frame.size.width/2.0;
    MGFinderView *instance = [MGFinderView showAnimatedFinderViewForTargetView:_targetView color:[UIColor darkGrayColor] bounce:YES];
    NSLog(@"%@", instance);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
