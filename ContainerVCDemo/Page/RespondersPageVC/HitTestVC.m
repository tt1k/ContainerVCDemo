//
//  HitTestVC.m
//  ContainerVCDemo
//
//  Created by 哔哩哔哩 on 2020/10/30.
//

#import "HitTestVC.h"
#import "ViewA.h"
#import "ViewB.h"
#import "ViewC.h"

#define WIDTH self.view.bounds.size.width
#define HEIGHT self.view.bounds.size.height

@interface HitTestVC()

@property (nonatomic, strong) ViewA *viewa;
@property (nonatomic, strong) ViewB *viewb;
@property (nonatomic, strong) ViewC *viewc;

@end

@implementation HitTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initView];
}

- (void)initView {
    _viewa = [[ViewA alloc] initWithFrame:CGRectMake(WIDTH * 0.1, 100, WIDTH * 0.8, 500)];
    _viewa.backgroundColor = UIColor.redColor;
    [self.view addSubview:_viewa];
    
    _viewb = [[ViewB alloc] initWithFrame:CGRectMake(0, 0, WIDTH * 0.6, 300)];
    _viewb.backgroundColor = UIColor.yellowColor;
    [_viewa addSubview:_viewb];
    
    _viewc = [[ViewC alloc] initWithFrame:CGRectMake(0, 0, WIDTH * 0.4, 100)];
    _viewc.backgroundColor = UIColor.greenColor;
    [_viewb addSubview:_viewc];
}

@end
