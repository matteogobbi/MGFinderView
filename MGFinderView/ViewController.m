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
    
//    MGFinderView *finderView = [[MGFinderView alloc] initWithSquareSide:300 color:[UIColor greenColor]];
//    [self.view addSubview:finderView];
    
    [_finderView startAnimating];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
