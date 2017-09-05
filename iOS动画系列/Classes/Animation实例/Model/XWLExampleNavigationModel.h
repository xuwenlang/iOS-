//
//  XWLExampleNavigationModel.h
//  iOS动画系列
//
//  Created by WenlangChu on 2017/5/5.
//  Copyright © 2017年 WenlangChu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XWLExampleNavigationModel : NSObject

+ (instancetype)shareInstance;

- (void)viewController:(UIViewController *)contorller pushWithIndexPath:(NSIndexPath *)indexPath;

@end
