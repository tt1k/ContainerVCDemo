//
//  HeadLeftVC.m
//  ContainerVCDemo
//
//  Created by FakeCoder on 2020/10/22.
//

#import "HeadLeftVC.h"

@implementation HeadLeftVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"HeadLeftVC viewWillAppear");
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"HeadLeftVC viewWillDisappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"HeadLeftVC viewDidDisappear");
}

- (void)initView {
    self.view.backgroundColor = [UIColor whiteColor];
    // 添加展示label
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 100)];
    label.text = @"同城页面";
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
}

- (void)willMoveToParentViewController:(UIViewController *)parent {
    [super willMoveToParentViewController:parent];
    NSLog(@"HeadLeftVC willMoveToParentViewController");
}

- (void)didMoveToParentViewController:(UIViewController *)parent {
    [super didMoveToParentViewController:parent];
    NSLog(@"HeadLeftVC didMoveToParentViewController");
}

- (void)dealloc {
    NSLog(@"HeadLeftVC dealloc");
}

@end
