//
//  CustomGestureVC.h
//  ContainerVCDemo
//
//  Created by FakeCoder on 2020/10/30.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#include "SwirlGestureRecognizer.h"

@interface CustomGestureVC : UIViewController

@property (nonatomic, strong) UIView *controlsView;
@property (nonatomic, strong) UIImageView *knob;
@property (nonatomic, strong) UILabel *position;

@end

