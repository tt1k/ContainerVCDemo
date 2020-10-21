//
//  LeftViewController.m
//  ContainerVCDemo
//
//  Created by FakeCoder on 2020/10/22.
//

#import "LeftViewController.h"

@interface LeftViewController() <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *leftContentArray;

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)initView {
    self.title = @"Left";
    
    _leftContentArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 20; i++) {
        NSString *content = [[NSString alloc] initWithFormat:@"left %d", i];
        [_leftContentArray addObject:content];
    }
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"leftCell"];
    [self.view addSubview:_tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _leftContentArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"leftCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"leftCell"];
    }
    cell.textLabel.text = _leftContentArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *content = _leftContentArray[indexPath.row];
    if ([_delegate respondsToSelector:@selector(userClickItem:)]) {
        [_delegate userClickItem:content];
    }
}

@end
