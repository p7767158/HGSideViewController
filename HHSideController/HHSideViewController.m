//
//  HHSideViewController.m
//  HHSideController
//
//  Created by zhh on 16/1/15.
//  Copyright © 2016年 zhh. All rights reserved.
//

#import "HHSideViewController.h"

@interface HHSideViewController ()<UIGestureRecognizerDelegate>
@property (nonatomic, strong) UIPanGestureRecognizer *pan;
@property (nonatomic, strong) UISwipeGestureRecognizer *rightSwipe;
@property (nonatomic, strong) UISwipeGestureRecognizer *leftSwipe;
@end

@implementation HHSideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (instancetype)initWithLeftViewController:(UIViewController *)leftViewController rootViewController:(UIViewController *)rootViewController
{
    if (self = [super init]) {
        self.leftViewController = leftViewController;
        self.rootViewController = rootViewController;
        [self addGestureWithLeftViewController];
        
        self.leftViewController.view.frame = CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width * (1 - kEdgeRate), self.leftViewController.view.frame.size.height);
        self.leftViewController.view.center = CGPointMake(self.leftViewController.view.center.x - UIScreen.mainScreen.bounds.size.width * kEdgeRate * 2, self.leftViewController.view.center.y);
        [self.view addSubview:self.leftViewController.view];
        [self.view addSubview:self.rootViewController.view];
    }
    return self;
}

- (void)addGestureWithLeftViewController
{
    self.pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.rootViewController.view addGestureRecognizer:self.pan];
    [self.pan setCancelsTouchesInView:YES];
    self.pan.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)pan:(UIPanGestureRecognizer *)pan
{
    if (!self.panEnabled) {
        return;
    }
    CGPoint p = [pan translationInView:self.view];
    
    CGFloat newRootCenterX;
    CGFloat newLeftCenterX;
    if (p.x > 0) {
        newRootCenterX = MIN(p.x + self.rootViewController.view.center.x, (1 - kEdgeRate + 0.5) * UIScreen.mainScreen.bounds.size.width);
        newLeftCenterX = MIN(p.x / ((1-kEdgeRate) * 3.3) + self.leftViewController.view.center.x, (1 - kEdgeRate) * 0.5 * UIScreen.mainScreen.bounds.size.width);
    } else {
        newRootCenterX = MAX(p.x + self.rootViewController.view.center.x, UIScreen.mainScreen.bounds.size.width / 2);
        newLeftCenterX = MAX(p.x / ((1-kEdgeRate) * 3.3) + self.leftViewController.view.center.x, (0.5 - kEdgeRate*2) * UIScreen.mainScreen.bounds.size.width);
    }
    
    self.rootViewController.view.center = CGPointMake(newRootCenterX, self.rootViewController.view.center.y);
    self.leftViewController.view.center = CGPointMake(newLeftCenterX, self.leftViewController.view.center.y);
    NSLog(@"%@", NSStringFromCGPoint(self.leftViewController.view.center));
    
    [pan setTranslation:CGPointMake(0, 0) inView:self.view];
    
    if (pan.state == UIGestureRecognizerStateEnded) {
        if (self.rootViewController.view.frame.origin.x > UIScreen.mainScreen.bounds.size.width * 0.4) {
            [self sideToRight];
        } else {
            [self sideToLeft];
        }
    }
}

- (void)sideToRight {
    [UIView animateWithDuration:0.2 animations:^{
        self.rootViewController.view.center = CGPointMake((1 - kEdgeRate + 0.5) * UIScreen.mainScreen.bounds.size.width, self.rootViewController.view.center.y);
        self.leftViewController.view.center = CGPointMake((1 - kEdgeRate) * 0.5 * UIScreen.mainScreen.bounds.size.width, self.rootViewController.view.center.y);
    }];
}

- (void)sideToLeft {
    [UIView animateWithDuration:0.2 animations:^{
        self.rootViewController.view.center = CGPointMake(UIScreen.mainScreen.bounds.size.width / 2, self.rootViewController.view.center.y);
        self.leftViewController.view.center = CGPointMake((0.5 - kEdgeRate * 2) * UIScreen.mainScreen.bounds.size.width, self.rootViewController.view.center.y);
    }];
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}
@end



















