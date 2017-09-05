//
//  XWLNavigationTransparencyController.m
//  iOS动画系列
//
//  Created by WenlangChu on 2017/5/9.
//  Copyright © 2017年 WenlangChu. All rights reserved.
//

#import "XWLNavigationTransparencyController.h"

@interface XWLNavigationTransparencyController () <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *barImageView;
@property (nonatomic, strong) UIImage *image;

@end

/** 透明 变 不透明 */

@implementation XWLNavigationTransparencyController

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        [self.view addSubview:_tableView];
        
        _tableView.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0);
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tableHeaderView"]];
        _tableView.tableHeaderView = imageView;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [[self.navigationController.navigationBar subviews] objectAtIndex:0].alpha = 0;
}

- (void)viewWillDisappear:(BOOL)animated {
    [[self.navigationController.navigationBar subviews] objectAtIndex:0].alpha = 1;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = @"text";
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%li", indexPath.row];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"header";
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat offsetY = scrollView.contentOffset.y;
    
//    NSLog(@"offsetY= %f", offsetY);
//    NSLog(@"((NAVBAR_CHANGE_POINT + 64 - offsetY) / 64)=%f", ((200 + 64 - offsetY) / 64));
//    CGFloat alpha = 1- ((200 + 64 - offsetY) / 64);
    
    CGFloat offsetToShow = 200.0;//滑动多少就完全显示
    
    CGFloat alpha = 1 - (offsetToShow - offsetY) / offsetToShow;
    
    [[self.navigationController.navigationBar subviews] objectAtIndex:0].alpha = alpha;
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
