//
//  PageViewController.m
//  ContainerVCDemo
//
//  Created by FakeCoder on 2020/10/21.
//

#import "PageViewController.h"
#import "ContentViewController.h"

@interface PageViewController() <UIPageViewControllerDelegate, UIPageViewControllerDataSource>

@property (nonatomic, strong) UIPageViewController *pageViewVC;
@property (nonatomic, strong) NSMutableArray *pageContentArray;

@end

@implementation PageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)initView {
    // 数据源设置
    _pageContentArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 5; i++) {
        NSString *content = [[NSString alloc] initWithFormat:@"we are now at page %d", i];
        [_pageContentArray addObject:content];
    }
    
    // PageViewController设置
    _pageViewVC = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl
                                                  navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                                                                options:nil];
    _pageViewVC.delegate = self;
    _pageViewVC.dataSource = self;
    _pageViewVC.view.frame = self.view.bounds;
    
    // 添加子视图控制器和子视图控制器的view
    [self addChildViewController:_pageViewVC];
    [self.view addSubview:_pageViewVC.view];
    
    // 设置第一个页面
    ContentViewController *firstvc = [self contentViewControllerAtIndex:0];
    [_pageViewVC setViewControllers:[NSArray arrayWithObject:firstvc]
                          direction:UIPageViewControllerNavigationDirectionReverse
                           animated:YES
                         completion:nil];
}

// 根据index获取ContentViewController
- (ContentViewController *)contentViewControllerAtIndex:(NSUInteger)index {
    if (_pageContentArray.count == 0 || index >= _pageContentArray.count) {
        return nil;
    }
    ContentViewController *contentvc = [[ContentViewController alloc] init];
    contentvc.content = [_pageContentArray objectAtIndex:index];
    return contentvc;
}

// 根据content获取当前vc的序号
- (NSUInteger)indexOfContentViewController:(ContentViewController *)viewController {
    return [_pageContentArray indexOfObject:viewController.content];
}

#pragma mark - DataSource Delegate

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSUInteger index = [self indexOfContentViewController:(ContentViewController *)viewController];
    if (index == 0) {
        return nil;
    }
    index--;
    return [self contentViewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSUInteger index = [self indexOfContentViewController:(ContentViewController *)viewController];
    index++;
    if (index == _pageContentArray.count) {
        return nil;
    }
    return [self contentViewControllerAtIndex:index];
}

@end
