//
//  ViewController.m
//  HHSideController
//
//  Created by zhh on 16/1/15.
//  Copyright © 2016年 zhh. All rights reserved.
//

#import "ViewController.h"
#import "otherViewController.h"
#import "AppDelegate.h"
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) NSArray *array;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    UITableView *tableview = [[UITableView alloc] init];
//    self.tableview = tableview;
//    tableview.frame = self.view.bounds;
//    tableview.dataSource = self;
//    tableview.delegate  = self;
//    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
//    [self.view addSubview:tableview];
}
- (void)viewWillLayoutSubviews
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"1.jpg"];
    [self.view addSubview:imageView];
    NSLog(@"%@",NSStringFromCGRect(self.view.bounds));
    self.tableview = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    self.tableview.backgroundColor = [UIColor clearColor];
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.array = @[@"开通会员", @"QQ钱包", @"网上营业厅", @"个性装扮", @"我的收藏", @"我的相册",@"我的文件"];
    [self.view addSubview:self.tableview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Identifier = @"Identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.font = [UIFont systemFontOfSize:20.0f];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.text = self.array[indexPath.row];
//    if (indexPath.row == 0) {
//        cell.textLabel.text = @"开通会员";
//    } else if (indexPath.row == 1) {
//        cell.textLabel.text = @"QQ钱包";
//    } else if (indexPath.row == 2) {
//        cell.textLabel.text = @"网上营业厅";
//    } else if (indexPath.row == 3) {
//        cell.textLabel.text = @"个性装扮";
//    } else if (indexPath.row == 4) {
//        cell.textLabel.text = @"我的收藏";
//    } else if (indexPath.row == 5) {
//        cell.textLabel.text = @"我的相册";
//    } else if (indexPath.row == 6) {
//        cell.textLabel.text = @"我的文件";
//    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    otherViewController *vc = [[otherViewController alloc] init];
    vc.title = self.array[indexPath.row];
    [tempAppDelegate.sideViewController sideToLeft];//关闭左侧抽屉
    
    [tempAppDelegate.mainNavController pushViewController:vc animated:NO];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 180;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableview.bounds.size.width, 180)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}
@end
