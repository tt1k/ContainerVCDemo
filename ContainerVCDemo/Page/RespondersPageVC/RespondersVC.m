//
//  RespondersVC.m
//  ContainerVCDemo
//
//  Created by FakeCoder on 2020/10/29.
//

#import "RespondersVC.h"

@interface RespondersVC() <UIGestureRecognizerDelegate>

@end

@implementation RespondersVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    [self initGesture];
}

- (void)initView {
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 100)];
    label.text = @"ResponderVC";
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
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

- (void)initGesture {
    /*单指单击*/
    UITapGestureRecognizer *singleFingerOne = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleSingleFingerEvent:)];
    singleFingerOne.numberOfTouchesRequired = 1; //手指
    singleFingerOne.numberOfTapsRequired = 1;    //tap次数
    singleFingerOne.delegate = self;

    /*单指双击*/
    UITapGestureRecognizer *singleFingerTwo = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleSingleFingerEvent:)];
    singleFingerTwo.numberOfTouchesRequired = 1;
    singleFingerTwo.numberOfTapsRequired = 2;
    singleFingerTwo.delegate = self;

    /*双指单击*/
    UITapGestureRecognizer *doubleFingerOne = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleDoubleFingerEvent:)];
    doubleFingerOne.numberOfTouchesRequired = 2;
    doubleFingerOne.numberOfTapsRequired = 1;
    doubleFingerOne.delegate = self;

    /*双指双击*/
    UITapGestureRecognizer *doubleFingerTwo = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleDoubleFingerEvent:)];
    doubleFingerTwo.numberOfTouchesRequired = 2;
    doubleFingerTwo.numberOfTapsRequired = 2;
    doubleFingerTwo.delegate = self;

    //如果不加下面的话，当单指双击时，会先调用单指单击中的处理，再调用单指双击中的处理
    [singleFingerOne requireGestureRecognizerToFail:singleFingerTwo];
    //双指也是如此
    [doubleFingerOne requireGestureRecognizerToFail:doubleFingerTwo];

    [self.view addGestureRecognizer:singleFingerOne];
    [self.view addGestureRecognizer:singleFingerTwo];
    [self.view addGestureRecognizer:doubleFingerOne];
    [self.view addGestureRecognizer:doubleFingerTwo];
}

-(void)handleSingleFingerEvent:(UITapGestureRecognizer *)sender{
    if(sender.numberOfTapsRequired == 1){
        NSLog(@"单指单击");
    } else if (sender.numberOfTapsRequired == 2){
        NSLog(@"单指双击");
    }
}

-(void)handleDoubleFingerEvent:(UITapGestureRecognizer *)sender{
    if(sender.numberOfTapsRequired == 1){
        NSLog(@"双指单击");
    } else if (sender.numberOfTapsRequired == 2){
        NSLog(@"双指双击");
    }
}

@end
