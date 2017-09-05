//
//  XWLVisualEffecController.m
//  iOS动画系列
//
//  Created by WenlangChu on 2017/5/5.
//  Copyright © 2017年 WenlangChu. All rights reserved.
//

#import "XWLVisualEffecController.h"

@interface XWLVisualEffecController ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation XWLVisualEffecController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, NAVIGATIONBAR_HEIGHT, VIEW_WIDTH, VIEW_HEIGHT - NAVIGATIONBAR_HEIGHT)];
    _imageView.image = [UIImage imageNamed:@"maoBoLiImage"];
    [self.view addSubview:_imageView];
    
    
    UIButton *changeBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    changeBtn.frame = CGRectMake(0, 0, 50, 50);
    [changeBtn setTitle:@"添加" forState:UIControlStateNormal];
    [changeBtn addTarget:self action:@selector(change) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *itemButton = [[UIBarButtonItem alloc] initWithCustomView:changeBtn];
    self.navigationItem.rightBarButtonItem = itemButton;
    
    NSLog(@"----%li", [self.view subviews].count);
}

- (void)change {
    
    /** UIBlurEffect 【设定模糊类型】*/
    
    //定义个白色的模糊效果
    UIBlurEffect *light = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    /*
     ExtraLight,    极亮的白色模糊效果
     Light,         白色的模糊效果
     Dark,          暗色的模糊效果
     */
    
    /** UIVisualEffectView 【把对象加上去】*/
    
    //模糊效果的View视图
    UIVisualEffectView *lightView = [[UIVisualEffectView alloc] initWithEffect:light];
    lightView.frame = self.view.bounds;
    //添加上去
    [self.view addSubview:lightView];
    //模糊透明度 0-1    1，特别模糊
#//加上它后，按钮也会变暗
    lightView.alpha = 0.6f;
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(30, 200, 200, 50);
    [btn setTitle:@"我是一个按钮" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [lightView addSubview:btn];
}

- (void)click {
    
}

@end
