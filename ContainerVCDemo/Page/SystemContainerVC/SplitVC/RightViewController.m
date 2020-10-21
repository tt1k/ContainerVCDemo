//
//  RightViewController.m
//  ContainerVCDemo
//
//  Created by FakeCoder on 2020/10/22.
//

#import "RightViewController.h"
#import "LeftViewController.h"

@interface RightViewController() <LeftViewDelegate>

@property (nonatomic, strong) UILabel *label;

@end

@implementation RightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)initView {
    self.title = @"Right";
    
    // 添加展示label
    _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 100)];
    _label.text = _content;
    _label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_label];
}

// 使用delegate通信
- (void)userClickItem:(NSString *)content {
    _label.text = content;
}

@end
