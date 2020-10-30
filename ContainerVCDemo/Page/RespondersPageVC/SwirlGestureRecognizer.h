//
//  SwirlGestureRecognizer.h
//  ContainerVCDemo
//
//  Created by FakeCoder on 2020/10/30.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <UIKit/UIGestureRecognizerSubclass.h>

@interface SwirlGestureRecognizer : UIGestureRecognizer

@property (nonatomic, assign) CGFloat currentAngle;
@property (nonatomic, assign) CGFloat previousAngle;

@end
