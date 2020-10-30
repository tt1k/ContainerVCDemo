//
//  RespondersVC.m
//  ContainerVCDemo
//
//  Created by FakeCoder on 2020/10/29.
//

#import "RespondersVC.h"

#define WIDTH self.view.bounds.size.width
#define HEIGHT self.view.bounds.size.height

@interface RespondersVC() <UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIView *view1;
@property (nonatomic, strong) UIView *view2;
@property (nonatomic, strong) UIButton *button;

@end

@implementation RespondersVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initView1];
    [self initView2];
    [self initButton];
    [self initGesture];
}

- (void)initView1 {
    _view1 = [[UIView alloc] initWithFrame:CGRectMake(WIDTH * 0.1, 100, WIDTH * 0.8, 100)];
    _view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:_view1];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, WIDTH * 0.8, 30)];
    label.text = @"label of view1";
    label.textAlignment = NSTextAlignmentCenter;
    [_view1 addSubview:label];
}

- (void)initView2 {
    _view2 = [[UIView alloc] initWithFrame:CGRectMake(WIDTH * 0.1, 240, WIDTH * 0.8, 100)];
    _view2.backgroundColor = [UIColor greenColor];
    _view2.userInteractionEnabled = YES;
    [_view2 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapFunc)]];
    [self.view addSubview:_view2];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, WIDTH * 0.8, 30)];
    label.text = @"label of view2";
    label.textAlignment = NSTextAlignmentCenter;
    [_view2 addSubview:label];
}

- (void)initButton {
    _button = [[UIButton alloc] initWithFrame:CGRectMake(WIDTH * 0.1, 360, WIDTH * 0.8, 50)];
    _button.backgroundColor = [UIColor blueColor];
    [_button setTitle:@"BUTTON" forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(buttonTapFunc) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
}

- (void)viewTapFunc {
    NSLog(@"view did tap");
}

- (void)buttonTapFunc {
    NSLog(@"button did tap");
}

- (void)initGesture {
    /*单指单击*/
    UITapGestureRecognizer *singleFingerOne = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleFingerEvent:)];
    singleFingerOne.numberOfTouchesRequired = 1;
    singleFingerOne.numberOfTapsRequired = 1;
    singleFingerOne.delegate = self;

    /*单指双击*/
    UITapGestureRecognizer *singleFingerTwo = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleFingerEvent:)];
    singleFingerTwo.numberOfTouchesRequired = 1;
    singleFingerTwo.numberOfTapsRequired = 2;
    singleFingerTwo.delegate = self;

    /*双指单击*/
    UITapGestureRecognizer *doubleFingerOne = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleFingerEvent:)];
    doubleFingerOne.numberOfTouchesRequired = 2;
    doubleFingerOne.numberOfTapsRequired = 1;
    doubleFingerOne.delegate = self;

    /*双指双击*/
    UITapGestureRecognizer *doubleFingerTwo = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleFingerEvent:)];
    doubleFingerTwo.numberOfTouchesRequired = 2;
    doubleFingerTwo.numberOfTapsRequired = 2;
    doubleFingerTwo.delegate = self;

    //如果不加下面的话 当单指双击时 会先调用单指单击中的处理 再调用单指双击中的处理 双指同理
    [singleFingerOne requireGestureRecognizerToFail:singleFingerTwo];
    [doubleFingerOne requireGestureRecognizerToFail:doubleFingerTwo];

    [_view1 addGestureRecognizer:singleFingerOne];
    [_view1 addGestureRecognizer:singleFingerTwo];
    [_view1 addGestureRecognizer:doubleFingerOne];
    [_view1 addGestureRecognizer:doubleFingerTwo];
}

-(void)handleSingleFingerEvent:(UITapGestureRecognizer *)sender {
    if(sender.numberOfTapsRequired == 1) {
        NSLog(@"单指单击");
    } else if (sender.numberOfTapsRequired == 2) {
        NSLog(@"单指双击");
    }
}

-(void)handleDoubleFingerEvent:(UITapGestureRecognizer *)sender {
    if(sender.numberOfTapsRequired == 1) {
        NSLog(@"双指单击");
    } else if (sender.numberOfTapsRequired == 2) {
        NSLog(@"双指双击");
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesBegan:withEvent:");
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesMoved:withEvent:");
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesEnded:withEvent:");
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesCancelled:withEvent:");
}

@end
