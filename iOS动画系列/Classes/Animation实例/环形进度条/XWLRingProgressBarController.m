//
//  XWLRingProgressBarController.m
//  iOS动画系列
//
//  Created by WenlangChu on 2017/5/5.
//  Copyright © 2017年 WenlangChu. All rights reserved.
//

#import "XWLRingProgressBarController.h"
#import "XWLRingProgressView.h"

@interface XWLRingProgressBarController ()

@property (nonatomic, strong) XWLRingProgressView *custom;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UISlider *mySlider;

@end

@implementation XWLRingProgressBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"环形进度条";
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"添加进度条" forState:UIControlStateNormal];
    button.frame = CGRectMake(SCREEN_WIDTH/2, SCREEN_HEIGHT - 200, 100, 40);
    button.backgroundColor = [UIColor orangeColor];
    [button addTarget:self action:@selector(addView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    self.button = button;
    
    
    _mySlider = [ [ UISlider alloc ] initWithFrame:CGRectMake(110, 400, 200, 40)];//高度设为40就好,高度代表手指触摸的高度.这个一定要注意
    _mySlider.minimumValue = 0.0;   //下限
    _mySlider.maximumValue = 1.0;  //上限
    _mySlider.value = 0.0;          //开始默认值
    //_mySlider.backgroundColor =[UIColor redColor];//测试用,
    [_mySlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    _mySlider.continuous = NO;//当放开手., 值才确定下来
    [ self.view addSubview:_mySlider ];
}

- (void)addView {
    
    self.button.backgroundColor = [UIColor lightGrayColor];
    self.button.userInteractionEnabled = NO;
    
    XWLRingProgressView *custom = [[XWLRingProgressView alloc] initWithFrame:CGRectMake(150, 200, 100, 100)];
    custom.progress = 0.44;
    [self.view addSubview:custom];
    self.custom = custom;
}

- (void)sliderValueChanged:(UISlider *)paramSender{
    
    if ([paramSender isEqual:self.mySlider]) {
        NSLog(@"New value=%f", paramSender.value);
    }
    self.custom.progress = 0.4;
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
