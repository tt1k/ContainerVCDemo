//
//  UserVC.m
//  ContainerVCDemo
//
//  Created by FakeCoder on 2020/10/23.
//

#import "UserVC.h"

@implementation UserVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)initView {
    self.view.backgroundColor = [UIColor blackColor];
    // 添加展示label
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 100)];
    label.text = @"我的";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:32];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
}

- (void)willMoveToParentViewController:(UIViewController *)parent {
//    [super willMoveToParentViewController:parent];
    NSLog(@"UserVC willMoveToParentViewController");
}

- (void)didMoveToParentViewController:(UIViewController *)parent {
//    [super didMoveToParentViewController:parent];
    NSLog(@"UserVC didMoveToParentViewController");
}

- (void)dealloc {
    NSLog(@"UserVC dealloc");
}

@end
