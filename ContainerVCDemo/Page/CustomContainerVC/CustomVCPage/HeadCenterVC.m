//
//  HeadCenterVC.m
//  ContainerVCDemo
//
//  Created by FakeCoder on 2020/10/22.
//

#import "HeadCenterVC.h"

@implementation HeadCenterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)initView {
    self.view.backgroundColor = [UIColor grayColor];
    // 添加展示label
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 100)];
    label.text = @"关注页面";
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
}

- (void)willMoveToParentViewController:(UIViewController *)parent {
//    [super willMoveToParentViewController:parent];
    NSLog(@"HeadCenterVC willMoveToParentViewController");
}

- (void)didMoveToParentViewController:(UIViewController *)parent {
//    [super didMoveToParentViewController:parent];
    NSLog(@"HeadCenterVC didMoveToParentViewController");
}

- (void)dealloc {
    NSLog(@"HeadCenterVC dealloc");
}

@end
