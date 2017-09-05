//
//  XWLTabBarController.m
//  iOS动画系列
//
//  Created by WenlangChu on 2017/4/27.
//  Copyright © 2017年 WenlangChu. All rights reserved.
//

#import "XWLTabBarController.h"
#import "XWLNavigationController.h"
#import "XWLBasisTableViewController.h"
#import "XWLExampleTableViewController.h"

@interface XWLTabBarController ()

@end

@implementation XWLTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /** 文字和图片颜色 */
    //self.tabBar.tintColor = [UIColor redColor];
    /** tabBar背景颜色 */
    //self.tabBar.barTintColor = [UIColor greenColor];
    
    [self addViewController];
}

- (void)addViewController {
    XWLBasisTableViewController *vcOne = [[XWLBasisTableViewController alloc] init];
    XWLNavigationController *navOne = [[XWLNavigationController alloc] initWithRootViewController:vcOne];
    vcOne.tabBarItem.title = @"基础";
    vcOne.tabBarItem.image = [UIImage imageNamed:@"X"];
    vcOne.tabBarItem.selectedImage = [UIImage imageNamed:@"X_selected"];
    
    XWLExampleTableViewController *vcTwo = [[XWLExampleTableViewController alloc] init];
    XWLNavigationController *navTwo = [[XWLNavigationController alloc] initWithRootViewController:vcTwo];
    vcTwo.tabBarItem.title = @"实例";
    vcTwo.tabBarItem.image = [UIImage imageNamed:@"O"];
    vcTwo.tabBarItem.selectedImage = [UIImage imageNamed:@"O_selected"];
    
    [self setViewControllers:@[navOne, navTwo]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
