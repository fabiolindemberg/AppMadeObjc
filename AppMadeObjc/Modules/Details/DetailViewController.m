//
//  DetailViewController.m
//  AppMadeObjc
//
//  Created by Fabio Lindemberg on 06/08/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - DetailPresenterDelegate Methods

- (void)dataLoaded {
    // code goes here
}

- (void)loading:(BOOL)isLoading {
        // code goes here
}

- (void)showMessage:(nonnull NSString *)message andType:(nonnull NSString *)type {
    // code goes here
}

@end
