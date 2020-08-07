//
//  UIApplication+TopViewController.m
//  MeetFlix
//
//  Created by Fabio Lindemberg on 23/07/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

#import "UIApplication+TopViewController.h"

@implementation UIApplication (TopViewController)

- (UIViewController*) topViewController {
    
    UIViewController *controller = [[[[UIApplication sharedApplication] windows] firstObject] rootViewController];
    
    UINavigationController *navigationController;
    
    if (navigationController == controller) {
        controller = navigationController.visibleViewController;
        return controller;
    }
    
    UITabBarController *tabController;
    
    if (tabController == controller) {
        controller = tabController.selectedViewController;
        return controller;
    }
    
    return controller;
}
@end
