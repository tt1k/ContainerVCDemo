//
//  SwirlGestureRecognizer.m
//  ContainerVCDemo
//
//  Created by FakeCoder on 2020/10/30.
//

#import "SwirlGestureRecognizer.h"

@interface SwirlGestureRecognizer()

@property (strong, nonatomic) id target;
@property (nonatomic) SEL action;

@end

@implementation SwirlGestureRecognizer

- (id)initWithTarget:(id)target action:(SEL)action {
    if (self = [super initWithTarget:target action:action]) {
        self.target = target;
        self.action = action;
    }
    return self;
}

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    if (touches.count > 1) {
        self.state = UIGestureRecognizerStateFailed;
        NSLog(@"touch > 1");
        return;
    }
    NSLog(@"%ld", (long)self.state);
}

- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
//    self.state = UIGestureRecognizerStateChanged;

    UITouch *touch = [touches anyObject];
    
    self.currentAngle = [self getTouchAngle:[touch locationInView:touch.view]];
    self.previousAngle = [self getTouchAngle:[touch previousLocationInView:touch.view]];
    
    if ([self.target respondsToSelector:self.action]) {
        [self.target performSelector:self.action withObject:self];
    }
    NSLog(@"%ld", (long)self.state);
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    self.state = UIGestureRecognizerStateEnded;
    NSLog(@"%ld", (long)self.state);
}

- (void)touchesCancelled:(NSSet*)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
    self.state = UIGestureRecognizerStateCancelled;
    NSLog(@"%ld", (long)self.state);
}

- (float)getTouchAngle:(CGPoint)touch {
    
    // Translate into cartesian space with origin at the center of a 320-pixel square
    float x = touch.x - 160;
    float y = -(touch.y - 160);
    
    // Take care not to divide by zero!
    if (y == 0) {
        if (x > 0) {
            return M_PI_2;
        }
        else {
            return 3 * M_PI_2;
        }
    }
    
    float arctan = atanf(x/y);
    
    // Figure out which quadrant we're in
    
    // Quadrant I
    if ((x >= 0) && (y > 0)) {
        return arctan;
    }
    // Quadrant II
    else if ((x < 0) && (y > 0)) {
        return arctan + 2 * M_PI;
    }
    // Quadrant III
    else if ((x <= 0) && (y < 0)) {
        return arctan + M_PI;
    }
    // Quadrant IV
    else if ((x > 0) && (y < 0)) {
        return arctan + M_PI;
    }
    
    return -1;
}

@end
