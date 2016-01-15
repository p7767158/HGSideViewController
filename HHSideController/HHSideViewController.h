//
//  HHSideViewController.h
//  HHSideController
//
//  Created by zhh on 16/1/15.
//  Copyright © 2016年 zhh. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kEdgeRate 0.2
@interface HHSideViewController : UIViewController
- (instancetype)initWithLeftViewController:(UIViewController *)leftViewController rootViewController:(UIViewController *)rootViewController;
@property (nonatomic, strong) UIViewController *leftViewController;
@property (nonatomic, strong) UIViewController *rootViewController;
@property (nonatomic, assign) BOOL panEnabled;
- (void)sideToLeft;
- (void)sideToRight;
@end
