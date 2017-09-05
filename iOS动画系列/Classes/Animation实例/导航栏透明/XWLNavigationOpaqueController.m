//
//  XWLNavigationOpaqueController.m
//  iOS动画系列
//
//  Created by WenlangChu on 2017/5/9.
//  Copyright © 2017年 WenlangChu. All rights reserved.
//

#import "XWLNavigationOpaqueController.h"

@interface XWLNavigationOpaqueController () <UIScrollViewDelegate>

@end

/** 不透明 变 透明*/

@implementation XWLNavigationOpaqueController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[self.navigationController.navigationBar subviews] objectAtIndex:0].alpha = 1;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    //    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:(UIBarMetricsDefault)];
    ////    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    //    self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    
    [[self.navigationController.navigationBar subviews] objectAtIndex:0].alpha = 1;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    
    scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT * 2);
    scrollView.backgroundColor = [UIColor orangeColor];
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
//    [self scrollViewDidScroll:_tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat offsetY = scrollView.contentOffset.y;
    NSLog(@"offsetY = %f", offsetY);
    
    
    CGFloat minAlphaOffset = -64;
    CGFloat maxAlphaOffset = 200;    // 200开始变透明
    
    if (offsetY >= maxAlphaOffset) {
        
        CGFloat alpha = 1 - ((offsetY - maxAlphaOffset) / maxAlphaOffset);
        NSLog(@"alpha=%f", alpha);
        
        [[self.navigationController.navigationBar subviews] objectAtIndex:0].alpha = alpha;
        
    } else {
        [[self.navigationController.navigationBar subviews] objectAtIndex:0].alpha = 1;
    }
}

@end
