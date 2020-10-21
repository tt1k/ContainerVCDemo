//
//  NavigationRootVC.m
//  ContainerVCDemo
//
//  Created by FakeCoder on 2020/10/21.
//

#import "NavigationRootVC.h"

@implementation NavigationRootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)initView {
    // 配置导航栏
    self.title = @"NavigationRootVC";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(leftBarButtonDidTap)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(rightBarButtonDidTap)];
    
    // 添加展示label
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 100)];
    label.text = @"This is NavigationRootVC";
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
}

- (void)leftBarButtonDidTap {
    NSLog(@"leftBarButtonDidTap");
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)rightBarButtonDidTap {
    NSLog(@"rightBarButtonDidTap");
}

@end
