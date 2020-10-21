//
//  SplitViewController.m
//  ContainerVCDemo
//
//  Created by FakeCoder on 2020/10/22.
//

#import "SplitViewController.h"
#import "LeftViewController.h"
#import "RightViewController.h"

@interface SplitViewController() <UISplitViewControllerDelegate>

@property (nonatomic, strong) UISplitViewController *splitViewVC;
@property (nonatomic, strong) NSMutableArray *contentArray;

@end

@implementation SplitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)initView {
    // 数据源设置
    _contentArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 5; i++) {
        NSString *content = [[NSString alloc] initWithFormat:@"split view at %d", i];
        [_contentArray addObject:content];
    }
    
    LeftViewController *leftvc = [[LeftViewController alloc] init];
    RightViewController *rightvc = [[RightViewController alloc] init];
    leftvc.delegate = rightvc;
    
    _splitViewVC = [[UISplitViewController alloc] initWithStyle:UISplitViewControllerStyleDoubleColumn];
    _splitViewVC.preferredDisplayMode = UISplitViewControllerDisplayModeOneBesideSecondary;
    _splitViewVC.viewControllers = @[
        [[UINavigationController alloc] initWithRootViewController:leftvc],
        [[UINavigationController alloc] initWithRootViewController:rightvc]
    ];

    [self.view addSubview:_splitViewVC.view];
}

@end
