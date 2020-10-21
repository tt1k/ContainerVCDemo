//
//  SceneDelegate.m
//  ContainerVCDemo
//
//  Created by FakeCoder on 2020/10/21.
//

#import "SceneDelegate.h"
#import "RootViewController.h"
#import "NavigationRootVC.h"

@implementation SceneDelegate

- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    RootViewController *rootvc = [[RootViewController alloc] init];
    rootvc.title = @"ContainerVC Demo";
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:rootvc];
}

@end
