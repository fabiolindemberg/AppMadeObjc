//
//  ViewController.h
//  AppMadeObjc
//
//  Created by Fabio Lindemberg on 31/07/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tbResults;
@property (weak, nonatomic) IBOutlet UIImageView *imgLogo;
@property (weak, nonatomic) IBOutlet UITextField *tfSearchText;
@property (weak, nonatomic) IBOutlet UIButton *btnSearch;

@property (weak, nonatomic) IBOutlet UIStackView *rootStackView;
@property (weak, nonatomic) IBOutlet UIStackView *searchStackView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *madeInWebLogoHeight;
@end

