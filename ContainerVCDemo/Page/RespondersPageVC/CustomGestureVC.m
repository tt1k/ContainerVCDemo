//
//  CustomGestureVC.m
//  ContainerVCDemo
//
//  Created by FakeCoder on 2020/10/30.
//

#import "CustomGestureVC.h"

#define WIDTH self.view.bounds.size.width
#define HEIGHT self.view.bounds.size.height

@interface CustomGestureVC() <UIGestureRecognizerDelegate>

@property (nonatomic, strong) SwirlGestureRecognizer *swirlGestureRecognizer;
@property (nonatomic, assign) float bearing;

@end


@implementation CustomGestureVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSetting];
}

- (void)initSetting {
    _bearing = 0.0;
    
    _position = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH * 0.1, 100, WIDTH * 0.8, 50)];
    _position.text = @"0º";
    _position.textAlignment = NSTextAlignmentCenter;
    _position.font = [UIFont systemFontOfSize:32];
    [self.view addSubview:_position];
    
    _knob = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"knob"]];
    _knob.frame = CGRectMake(WIDTH * 0.1, 400, WIDTH * 0.8, WIDTH * 0.8);
    [self.view addSubview:_knob];
    
    _swirlGestureRecognizer = [[SwirlGestureRecognizer alloc] initWithTarget:self action:@selector(rotationAction:)];
    _swirlGestureRecognizer.delegate = self;
    [_knob addGestureRecognizer:_swirlGestureRecognizer];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resetToZero:)];
    tapGestureRecognizer.delegate = self;
    tapGestureRecognizer.numberOfTapsRequired = 2;
    [_knob addGestureRecognizer:tapGestureRecognizer];
    
    [_swirlGestureRecognizer requireGestureRecognizerToFail:tapGestureRecognizer];
}

- (void)rotationAction:(id)sender {
    if ([(SwirlGestureRecognizer*)sender state] == UIGestureRecognizerStateEnded) {
        return;
    }
    
    CGFloat direction = ((SwirlGestureRecognizer*)sender).currentAngle - ((SwirlGestureRecognizer*)sender).previousAngle;
    
    _bearing += 180 * direction / M_PI;
    if (_bearing < -0.5) {
        _bearing += 360;
    } else if (_bearing > 359.5) {
        _bearing -= 360;
    }
    
    CGAffineTransform knobTransform = _knob.transform;
    CGAffineTransform newKnobTransform = CGAffineTransformRotate(knobTransform, direction);
    _knob.transform = newKnobTransform;
    
    _position.text = [NSString stringWithFormat:@"%dº", (int)lroundf(_bearing)];
}

- (void)resetToZero:(id)sender {
    [_knob setTransform:CGAffineTransformMakeRotation(0)];
    _bearing = 0.0;
    _position.text = @"0º";
}

@end
