//
//  CustomViewController.m
//  ContainerVCDemo
//
//  Created by FakeCoder on 2020/10/22.
//

#import "CustomViewController.h"
#import "HeadCenterVC.h"
#import "HeadLeftVC.h"
#import "HeadRightVC.h"
#import "UserVC.h"

#define WIDTH self.view.frame.size.width
#define HEIGHT self.view.frame.size.height

@interface CustomViewController()

@property (nonatomic, assign) float statusBarHeight;
@property (nonatomic, strong) UIViewController *currentVC;

@property (nonatomic, strong) UIView *headSection;
@property (nonatomic, strong) UIButton *headLeft;
@property (nonatomic, strong) UIButton *headCenter;
@property (nonatomic, strong) UIButton *headRight;

@property (nonatomic, strong) UIView *bottomSection;
@property (nonatomic, strong) UIImageView *bottomCenter;
@property (nonatomic, strong) UIButton *bottom1;
@property (nonatomic, strong) UIButton *bottom2;
@property (nonatomic, strong) UIButton *bottom3;
@property (nonatomic, strong) UIButton *bottom4;

@end

@implementation CustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)initView {
    self.view.backgroundColor = [UIColor blackColor];
    
    [self initHeadSection];
    [self initBottomSection];
    
    HeadCenterVC *headcenter = [[HeadCenterVC alloc] init];
    headcenter.view.frame = CGRectMake(0, _headSection.frame.origin.y + 50, WIDTH, HEIGHT - 130 - _statusBarHeight);
    _currentVC = headcenter;
    
    [self addChildViewController:_currentVC];
    [self.view addSubview:_currentVC.view];
    [_currentVC didMoveToParentViewController:self];
}

// 设置屏幕上方的同城 关注 推荐
- (void)initHeadSection {
    for (UIWindow *window in [UIApplication sharedApplication].windows) {
        if (window.isKeyWindow) {
            _statusBarHeight = window.windowScene.statusBarManager.statusBarFrame.size.height;
            break;
        }
    }
    
    _headSection = [[UIView alloc] initWithFrame:CGRectMake(0, _statusBarHeight, WIDTH, 50)];
    _headSection.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_headSection];
    
    float headTitleWidth = 60;
    
    _headCenter = [self buttonWithFrame:CGRectMake(WIDTH / 2 - headTitleWidth / 2, 0, headTitleWidth, 50) andTitle:@"关注"];
    [_headCenter addTarget:self action:@selector(goHeadCenter) forControlEvents:UIControlEventTouchUpInside];
    [_headSection addSubview:_headCenter];

    _headLeft = [self buttonWithFrame:CGRectMake(WIDTH / 2 - headTitleWidth * 2, 0, headTitleWidth, 50) andTitle:@"同城"];
    [_headLeft addTarget:self action:@selector(goHeadLeft) forControlEvents:UIControlEventTouchUpInside];
    [_headSection addSubview:_headLeft];
    
    _headRight = [self buttonWithFrame:CGRectMake(WIDTH / 2 + headTitleWidth, 0, headTitleWidth, 50) andTitle:@"推荐"];
    [_headRight addTarget:self action:@selector(goHeadRight) forControlEvents:UIControlEventTouchUpInside];
    [_headSection addSubview:_headRight];
}

// 设置屏幕下方的首页 朋友 消息 我的
// 暂时对屏幕下方的自定义tabbar不做页面切换 页面切换同理屏幕上方的切换原理
- (void)initBottomSection {
    _bottomSection = [[UIView alloc] initWithFrame:CGRectMake(0, HEIGHT - 80, WIDTH, 50)];
    _bottomSection.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_bottomSection];

    float bottomTitleWidth = 60;

    _bottomCenter = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"douyin_add"]];
    _bottomCenter.frame = CGRectMake(WIDTH / 2 - bottomTitleWidth / 2, 5, bottomTitleWidth, 40);
    [_bottomSection addSubview:_bottomCenter];

    _bottom1 = [self buttonWithFrame:CGRectMake(WIDTH / 2 - bottomTitleWidth * 3, 0, bottomTitleWidth, 50) andTitle:@"首页"];
    [_bottomSection addSubview:_bottom1];

    _bottom2 = [self buttonWithFrame:CGRectMake(WIDTH / 2 - bottomTitleWidth * 1.8, 0, bottomTitleWidth, 50) andTitle:@"朋友"];
    [_bottomSection addSubview:_bottom2];

    _bottom3 = [self buttonWithFrame:CGRectMake(WIDTH / 2 + bottomTitleWidth * 0.8, 0, bottomTitleWidth, 50) andTitle:@"消息"];
    [_bottomSection addSubview:_bottom3];

    _bottom4 = [self buttonWithFrame:CGRectMake(WIDTH / 2 + bottomTitleWidth * 2, 0, bottomTitleWidth, 50) andTitle:@"我的"];
    [_bottom4 addTarget:self action:@selector(goUser) forControlEvents:UIControlEventTouchUpInside];
    [_bottomSection addSubview:_bottom4];
}

- (UIButton *)buttonWithFrame:(CGRect)frame andTitle:(NSString *)title {
    UIButton *btn = [[UIButton alloc] initWithFrame:frame];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont boldSystemFontOfSize:18]];
    return btn;
}

// 切换到关注页面
- (void)goHeadCenter {
    NSLog(@"切换到关注页面");
    [_currentVC willMoveToParentViewController:nil];
    [_currentVC.view removeFromSuperview];
    [_currentVC removeFromParentViewController];
    
    HeadCenterVC *newvc = [[HeadCenterVC alloc] init];
    newvc.view.frame = CGRectMake(0, _headSection.frame.origin.y + 50, WIDTH, HEIGHT - 130 - _statusBarHeight);
    _currentVC = newvc;
    
    [self addChildViewController:_currentVC];
    [self.view addSubview:_currentVC.view];
    [_currentVC didMoveToParentViewController:self];
}

// 切换到同城页面
- (void)goHeadLeft {
    NSLog(@"切换到同城页面");
    [_currentVC willMoveToParentViewController:nil];
    [_currentVC.view removeFromSuperview];
    [_currentVC removeFromParentViewController];
    
    HeadLeftVC *newvc = [[HeadLeftVC alloc] init];
    newvc.view.frame = CGRectMake(0, _headSection.frame.origin.y + 50, WIDTH, HEIGHT - 130 - _statusBarHeight);
    _currentVC = newvc;
    
    [self addChildViewController:_currentVC];
    [self.view addSubview:_currentVC.view];
    [_currentVC didMoveToParentViewController:self];
}

// 切换到推荐页面
- (void)goHeadRight {
    NSLog(@"切换到推荐页面");
    [_currentVC willMoveToParentViewController:nil];
    [_currentVC.view removeFromSuperview];
    [_currentVC removeFromParentViewController];
    
    HeadRightVC *newvc = [[HeadRightVC alloc] init];
    newvc.view.frame = CGRectMake(0, _headSection.frame.origin.y + 50, WIDTH, HEIGHT - 130 - _statusBarHeight);
    _currentVC = newvc;
    
    [self addChildViewController:_currentVC];
    [self.view addSubview:_currentVC.view];
    [_currentVC didMoveToParentViewController:self];
}

// 切换到我的页面
- (void)goUser {
    NSLog(@"切换到用户页面");
    [_currentVC willMoveToParentViewController:nil];
    [_currentVC.view removeFromSuperview];
    [_currentVC removeFromParentViewController];
    
    UserVC *newvc = [[UserVC alloc] init];
    newvc.view.frame = CGRectMake(0, _headSection.frame.origin.y + 50, WIDTH, HEIGHT - 130 - _statusBarHeight);
    _currentVC = newvc;
    
    [self addChildViewController:_currentVC];
    [self.view addSubview:_currentVC.view];
    [_currentVC didMoveToParentViewController:self];
}

@end
