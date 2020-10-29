//
//  HeadRightVC.m
//  ContainerVCDemo
//
//  Created by FakeCoder on 2020/10/22.
//

#import "HeadRightVC.h"

@implementation HeadRightVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"HeadRightVC viewWillAppear");
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"HeadRightVC viewWillDisappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"HeadRightVC viewDidDisappear");
}

- (void)initView {
    self.view.backgroundColor = [UIColor lightGrayColor];
    // 添加展示label
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 100)];
    label.text = @"推荐页面";
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
}

- (void)willMoveToParentViewController:(UIViewController *)parent {
    [super willMoveToParentViewController:parent];
    NSLog(@"HeadRightVC willMoveToParentViewController");
}

- (void)didMoveToParentViewController:(UIViewController *)parent {
    [super didMoveToParentViewController:parent];
    NSLog(@"HeadRightVC didMoveToParentViewController");
}

- (void)dealloc {
    NSLog(@"HeadRightVC dealloc");
}

@end
