//
//  DetailRouter.m
//  AppMadeObjc
//
//  Created by Fabio Lindemberg on 06/08/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

#import "DetailRouter.h"
#import "DetailPresenter.h"
#import "DetailViewController.h"
#import "UIApplication+TopViewController.h"
#import <UIKit/UIKit.h>

@implementation DetailRouter

+ (void)pushWithIdentifier: (NSString *) identidier {

    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName: @"Main" bundle: nil];
    
    DetailViewController *detailViewController = [storyBoard instantiateViewControllerWithIdentifier: @"DetailView"];

    DetailPresenter *presenter = [[DetailPresenter alloc] initWithDelegate: detailViewController
                                                             andIdentifier: identidier];
        
    detailViewController.presenter = presenter;
   
    UIViewController *topViewController = [[UIApplication sharedApplication] topViewController];

    [topViewController presentViewController: detailViewController animated: YES completion: nil];
}

@end
