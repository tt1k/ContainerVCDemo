//
//  CustomView.m
//  ContainerVCDemo
//
//  Created by 哔哩哔哩 on 2020/10/30.
//

#import "CustomView.h"

@implementation CustomView

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    BOOL inside = [super pointInside:point withEvent:event];
    NSLog(@"%@ inside:%@", NSStringFromClass(self.class), @(inside));
    return inside;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *view = [super hitTest:point withEvent:event];
    NSLog(@"%@ hittest view:%@", NSStringFromClass(self.class), view);
    return view;
}

@end
