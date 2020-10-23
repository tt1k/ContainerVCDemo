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

- (void)initView {
    self.view.backgroundColor = [UIColor whiteColor];
    // 添加展示label
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 100)];
    label.text = @"同城页面";
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
}

- (void)willMoveToParentViewController:(UIViewController *)parent {
//    [super willMoveToParentViewController:parent];
    NSLog(@"HeadLeftVC willMoveToParentViewController");
}

- (void)didMoveToParentViewController:(UIViewController *)parent {
//    [super didMoveToParentViewController:parent];
    NSLog(@"HeadLeftVC didMoveToParentViewController");
}

- (void)dealloc {
    NSLog(@"HeadLeftVC dealloc");
}

@end
