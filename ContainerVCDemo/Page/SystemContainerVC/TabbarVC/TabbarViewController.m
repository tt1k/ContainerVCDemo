//
//  TabbarViewController.m
//  ContainerVCDemo
//
//  Created by FakeCoder on 2020/10/21.
//

#import "TabbarViewController.h"
#import "TabbarHomeVC.h"
#import "TabbarShopVC.h"
#import "TabbarUserVC.h"

@implementation TabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTabbar];
}

- (void)initTabbar {
    // home
    TabbarHomeVC *homevc = [[TabbarHomeVC alloc] init];
    [self addUITabBarItemWithController:homevc andNormalImage:@"bottom_tabbar_home_off" andSelectedImage:@"bottom_tabbar_home_on" andBarTitle:@"Home"];
    
    // shop
    TabbarShopVC *shopvc = [[TabbarShopVC alloc] init];
    [self addUITabBarItemWithController:shopvc andNormalImage:@"bottom_tabbar_shop_off" andSelectedImage:@"bottom_tabbar_shop_on" andBarTitle:@"Shop"];

    // user
    TabbarUserVC *uservc = [[TabbarUserVC alloc] init];
    [self addUITabBarItemWithController:uservc andNormalImage:@"bottom_tabbar_user_off" andSelectedImage:@"bottom_tabbar_user_on" andBarTitle:@"User"];
}

// 统一设置tabbar的icon样式
- (void)addUITabBarItemWithController:(UIViewController *)vc andNormalImage:(NSString *)normalImage andSelectedImage:(NSString *)selectedImage andBarTitle:(NSString *)barTitle {
    vc.title = barTitle;
    vc.tabBarItem.image = [[UIImage imageNamed:normalImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [vc.tabBarItem setTitleTextAttributes:@{
        NSForegroundColorAttributeName:[UIColor blackColor],
        NSFontAttributeName:[UIFont systemFontOfSize:12.0]
    } forState:UIControlStateNormal];
    [vc.tabBarItem setTitleTextAttributes:@{
        NSForegroundColorAttributeName:[UIColor colorWithRed:0xFB/255.f green:0x72/255.f blue:0x99/255.f alpha:1.0],
        NSFontAttributeName:[UIFont systemFontOfSize:12.0]
    } forState:UIControlStateSelected];
    
    [self addChildViewController:vc];
}

@end
