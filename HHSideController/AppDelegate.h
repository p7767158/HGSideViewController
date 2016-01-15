//
//  AppDelegate.h
//  HHSideController
//
//  Created by zhh on 16/1/15.
//  Copyright © 2016年 zhh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HHSideViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) UINavigationController *mainNavController;
@property (nonatomic, strong) HHSideViewController *sideViewController;
@end

