//
//  HGViewController.m
//  HHSideController
//
//  Created by zhh on 16/1/15.
//  Copyright © 2016年 zhh. All rights reserved.
//

#import "HGViewController.h"
#import "AppDelegate.h"
@interface HGViewController ()

@end

@implementation HGViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
    self.navigationItem.title = @"浩哥侧滑";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    tempAppDelegate.sideViewController.panEnabled = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    tempAppDelegate.sideViewController.panEnabled = NO;
}

@end
