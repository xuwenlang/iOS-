//
//  XWLExampleNavigationModel.m
//  iOS动画系列
//
//  Created by WenlangChu on 2017/5/5.
//  Copyright © 2017年 WenlangChu. All rights reserved.
//

#import "XWLExampleNavigationModel.h"

#import "XWLVisualEffecController.h"
#import "XWLRingProgressBarController.h"

#import "XWLNavigationTransparencyController.h"
#import "XWLNavigationOpaqueController.h"

#import "XWLCellAnimationController.h"

@implementation XWLExampleNavigationModel

static XWLExampleNavigationModel *instance = nil;

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[[self class] alloc] init];
    });
    return instance;
}

- (void)viewController:(UIViewController *)contorller pushWithIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
        {
            if (indexPath.row == 0) // 毛玻璃
            {
                XWLVisualEffecController *vc = [[XWLVisualEffecController alloc] init];
                vc.hidesBottomBarWhenPushed = YES;
                [contorller.navigationController pushViewController:vc animated:YES];
            }
            else if (indexPath.row == 1) // 环形进度条
            {
                XWLRingProgressBarController *vc = [[XWLRingProgressBarController alloc] init];
                vc.hidesBottomBarWhenPushed = YES;
                [contorller.navigationController pushViewController:vc animated:YES];
            }
        }
            break;
        case 1:
        {
            if (indexPath.row == 0)
            {
                XWLNavigationTransparencyController *vc = [[XWLNavigationTransparencyController alloc] init];
                vc.hidesBottomBarWhenPushed = YES;
                [contorller.navigationController pushViewController:vc animated:YES];
            }
            else if (indexPath.row == 1)
            {
                XWLNavigationOpaqueController *vc = [[XWLNavigationOpaqueController alloc] init];
                vc.hidesBottomBarWhenPushed = YES;
                [contorller.navigationController pushViewController:vc animated:YES];
            }
        }
            break;
        case 2:
        {
            NSInteger i = 0;
            if (indexPath.row == 0) {
                i = 0;
            } else if (indexPath.row == 1) {
                i = 1;
            } else if (indexPath.row == 2) {
                i = 2;
            }
            
            XWLCellAnimationController *vc = [[XWLCellAnimationController alloc] init];
            vc.type = i;
            vc.hidesBottomBarWhenPushed = YES;
            [contorller.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
}

@end
