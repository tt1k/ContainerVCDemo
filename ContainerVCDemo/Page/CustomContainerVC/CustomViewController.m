//
//  CustomViewController.m
//  ContainerVCDemo
//
//  Created by FakeCoder on 2020/10/22.
//

#import "CustomViewController.h"

#define WIDTH self.view.frame.size.width
#define HEIGHT self.view.frame.size.height

@interface CustomViewController()

@property (nonatomic, strong) UIView *headSection;
@property (nonatomic, strong) UILabel *headLeft;
@property (nonatomic, strong) UILabel *headCenter;
@property (nonatomic, strong) UILabel *headRight;

@property (nonatomic, strong) UIView *bottomSection;
@property (nonatomic, strong) UILabel *bottom1;
@property (nonatomic, strong) UILabel *bottom2;
@property (nonatomic, strong) UILabel *bottom3;
@property (nonatomic, strong) UILabel *bottom4;

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
}

- (void)initHeadSection {
    float statusBarHeight = 0;
    for (UIWindow *window in [UIApplication sharedApplication].windows) {
        if (window.isKeyWindow) {
            statusBarHeight = window.windowScene.statusBarManager.statusBarFrame.size.height;
            break;
        }
    }
    
    _headSection = [[UIView alloc] initWithFrame:CGRectMake(0, statusBarHeight, WIDTH, 50)];
    _headSection.translatesAutoresizingMaskIntoConstraints = NO;
    _headSection.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_headSection];
    
    float headTitleWidth = 60;
    
    _headCenter = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH / 2 - headTitleWidth / 2, 0, headTitleWidth, 50)];
    _headCenter.backgroundColor = [UIColor redColor];
    _headCenter.textAlignment = NSTextAlignmentCenter;
    _headCenter.translatesAutoresizingMaskIntoConstraints = NO;
    _headCenter.text = @"关注";
    _headCenter.textColor = [UIColor whiteColor];
    _headCenter.font = [UIFont boldSystemFontOfSize:18];
    [_headSection addSubview:_headCenter];
    
    _headLeft = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH / 2 - headTitleWidth * 2, 0, headTitleWidth, 50)];
    _headLeft.backgroundColor = [UIColor redColor];
    _headLeft.textAlignment = NSTextAlignmentCenter;
    _headLeft.translatesAutoresizingMaskIntoConstraints = NO;
    _headLeft.text = @"同城";
    _headLeft.textColor = [UIColor whiteColor];
    _headLeft.font = [UIFont boldSystemFontOfSize:18];
    [_headSection addSubview:_headLeft];
    
    _headRight = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH / 2 + headTitleWidth, 0, headTitleWidth, 50)];
    _headRight.backgroundColor = [UIColor redColor];
    _headRight.textAlignment = NSTextAlignmentCenter;
    _headRight.translatesAutoresizingMaskIntoConstraints = NO;
    _headRight.text = @"推荐";
    _headRight.textColor = [UIColor whiteColor];
    _headRight.font = [UIFont boldSystemFontOfSize:18];
    [_headSection addSubview:_headRight];
}

- (void)initBottomSection {
    _bottomSection = [[UIView alloc] initWithFrame:CGRectMake(0, HEIGHT - 50, WIDTH, 50)];
    _bottomSection.translatesAutoresizingMaskIntoConstraints = NO;
    _bottomSection.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_bottomSection];
}

@end
