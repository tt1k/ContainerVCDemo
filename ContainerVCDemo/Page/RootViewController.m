//
//  RootViewController.m
//  ContainerVCDemo
//
//  Created by FakeCoder on 2020/10/21.
//

#import "RootViewController.h"
#import "NavigationViewController.h"
#import "NavigationRootVC.h"
#import "TabbarViewController.h"
#import "PageViewController.h"
#import "SplitViewController.h"
#import "CustomViewController.h"

@interface RootViewController() <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *rootTableView;
@property (nonatomic, strong) NSMutableArray<NSArray *> *tableViewGroup;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initRootTableView];
}

- (void)initRootTableView {
    // tableView的设置
    _rootTableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    _rootTableView.dataSource = self;
    _rootTableView.delegate = self;
    [_rootTableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_rootTableView];
    
    // 作为tableView的数据源
    _tableViewGroup = [[NSMutableArray alloc] init];
    [_tableViewGroup addObject:@[@"UINavigationViewController",
                                 @"UITabBarViewController",
                                 @"UIPageViewController",
                                 @"UISpiltViewController"]];
    [_tableViewGroup addObject:@[@"模仿抖音"]];
    [_tableViewGroup addObject:@[@"待定"]];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _tableViewGroup.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _tableViewGroup[section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = _tableViewGroup[indexPath.section][indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        NavigationRootVC *rootvc = [[NavigationRootVC alloc] init];
        NavigationViewController *vc = [[NavigationViewController alloc] initWithRootViewController:rootvc];
        vc.modalPresentationStyle = UIModalPresentationFullScreen;
        vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self.navigationController presentViewController:vc animated:YES completion:nil];
    }
    if (indexPath.section == 0 && indexPath.row == 1) {
        TabbarViewController *vc = [[TabbarViewController alloc] init];
        vc.modalPresentationStyle = UIModalPresentationFullScreen;
        vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self.navigationController presentViewController:vc animated:YES completion:nil];
    }
    if (indexPath.section == 0 && indexPath.row == 2) {
        PageViewController *vc = [[PageViewController alloc] init];
        vc.modalPresentationStyle = UIModalPresentationFullScreen;
        vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self.navigationController presentViewController:vc animated:YES completion:nil];
    }
    if (indexPath.section == 0 && indexPath.row == 3) {
        SplitViewController *vc = [[SplitViewController alloc] init];
        vc.modalPresentationStyle = UIModalPresentationFullScreen;
        vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self.navigationController presentViewController:vc animated:YES completion:nil];
    }
    if (indexPath.section == 1 && indexPath.row == 0) {
        CustomViewController *vc = [[CustomViewController alloc] init];
        vc.modalPresentationStyle = UIModalPresentationFullScreen;
        vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self.navigationController presentViewController:vc animated:YES completion:nil];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) return @"系统自带的容器视图控制器";
    if (section == 1) return @"自定义的容器视图控制器";
    if (section == 2) return @"视图控制器的嵌套";
    return @"Unknown";
}

@end
