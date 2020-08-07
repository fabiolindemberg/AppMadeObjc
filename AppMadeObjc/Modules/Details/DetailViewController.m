//
//  DetailViewController.m
//  AppMadeObjc
//
//  Created by Fabio Lindemberg on 06/08/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

#import "DetailViewController.h"
#import <SDWebImage/SDWebImage.h>

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear: animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear: animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear: animated];
}

#pragma mark - Custom Methods

- (void) laodUI {
    
    NSURL *url = [[NSURL alloc] initWithString: self.presenter.youtubeItem.snippet.thumbnails.high.url];
    [self.imgVideo sd_setImageWithURL: url];
    
    self.lblTitle.text = self.presenter.youtubeItem.snippet.title;
    self.lblDescription.text = self.presenter.youtubeItem.snippet.desc;
}

#pragma mark - DetailPresenterDelegate Methods

- (void)dataLoaded {
    [self laodUI];
}

- (void)loading:(BOOL)isLoading {
    // code goes here
}

- (void)showMessage:(nonnull NSString *)message andType:(nonnull NSString *)type {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        if ([type isEqualToString: @"error"]) {
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle: message message: @"" preferredStyle: UIAlertControllerStyleAlert];
            
            UIAlertAction *defaultAction = [UIAlertAction actionWithTitle: @"Ok" style: UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                //
            }];
            
            [alert addAction: defaultAction];
            
            [self presentViewController:alert animated:YES completion:nil];
        }
    });
}

@end
