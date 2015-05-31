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

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //View by code
    MGFinderView *finderView = [[MGFinderView alloc] initWithSquareSide:150 color:[UIColor greenColor]];
    finderView.backgroundColor = [UIColor clearColor];
    finderView.center = CGPointMake(150.0, 150.0);
    [self.view addSubview:finderView];
    [finderView startAnimating];
    
    // View from IB
    [_finderView startAnimating];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
