//
//  ViewController.m
//  AppMadeObjc
//
//  Created by Fabio Lindemberg on 31/07/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchPresenter.h"
#import "YoutubeItemCell.h"

@interface SearchViewController () <SearchPresenterDelegate,
                                    UITableViewDelegate,
                                    UITableViewDataSource>
@end

@implementation SearchViewController

SearchPresenter *_presenter;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configUI];
    _presenter = [[SearchPresenter alloc] initWithDelegate: self];
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

- (void) configUI {
    self.tbResults.dataSource = self;
    self.tbResults.delegate = self;
}

- (IBAction)search:(id)sender {
    
    NSString *searchParameters = @"HDFIT";
    [_presenter fetchListWithSearchParameter: searchParameters];
}

#pragma mark - SearchPresenterDelegate

- (void)loading:(BOOL)isLoading {
    // code goes here
    NSLog(@"%@", isLoading ? @"Start loagind" : @"Stop loading");
}

- (void)dataLoaded {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tbResults reloadData];
    });
}

- (void)showMessage:(NSString *)message andType:(NSString *)type {
    // code goes here
    
    NSLog(@"%@: %@", type, message);

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

#pragma mark - TableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_presenter getNumberOfItems];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YoutubeItemCell *cell = [tableView dequeueReusableCellWithIdentifier: @"itemCell"];
    
    [cell loadCell: [_presenter getItemAtIndex: indexPath.row]];
    
    return cell;
}

@end
