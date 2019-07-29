//
//  ViewController2.m
//  osksi
//
//  Created by fls on 2019/7/12.
//  Copyright © 2019年 fls. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()<UIGestureRecognizerDelegate>
@property(nonatomic,strong)  id  interactivePopDelegate ;
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
}

// 在页面将要出现时，记录原始侧滑手势代理对象，并将手势代理设置为当前页面
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.interactivePopDelegate = self.navigationController.interactivePopGestureRecognizer.delegate;
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

// 在页面消失时，还原侧滑手势代理对象
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    self.navigationController.interactivePopGestureRecognizer.delegate = self.interactivePopDelegate;
    self.interactivePopDelegate = nil;
}

// 实现手势代理，为了防止影响其他手势，可以判断一下手势类型
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if ([gestureRecognizer isKindOfClass:[UIScreenEdgePanGestureRecognizer class]]) {
        return YES;
    }
//    ...... 其他手势的处理
    
    
    return NO;
}


@end
