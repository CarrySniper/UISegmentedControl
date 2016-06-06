//
//  ViewController.m
//  UISegmentedControl
//
//  Created by 思久科技 on 16/6/6.
//  Copyright © 2016年 Seejoys. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //导航栏半透明设置与否
    [self.navigationController.navigationBar setTranslucent:NO];
    //导航栏背景颜色
    [self.navigationController.navigationBar setBarTintColor:[UIColor purpleColor]];
    //导航栏图标颜色
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    //导航栏样式 状态栏字体图标白色
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    //分段控制
    NSArray *itemsArray = [[NSArray alloc]initWithObjects:
                               @"分段1",
                               @"分段2",
                               @"分段3",
                               @"分段4",
                               nil];
    UISegmentedControl *segmentedControl = [self createSegmentedControlWithItems:itemsArray];
    
    //在navigationBar上添加 —— navigationBar高44
    CGFloat width = self.view.frame.size.width - 120;
    CGFloat height = 35;
    CGFloat x = (self.view.frame.size.width - width) / 2;   //根据宽算出x
    CGFloat y = (44 - height) / 2;                          //根据高算出y
    
    //设置Frame
    segmentedControl.frame = CGRectMake(x, y, width, height);
    //将segmentedControl添加到navigationBar上。
    //navigationItem.titleView
    self.navigationItem.titleView = segmentedControl;
}

#pragma mark - 创建/初始化UI控件
- (UISegmentedControl *)createSegmentedControlWithItems:(NSArray *)items
{
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]initWithItems:items];
    //设置默认选择项索引
    segmentedControl.selectedSegmentIndex = 0;
    //设置痕迹颜色
    segmentedControl.tintColor = [UIColor whiteColor];
    //设置在点击后是否恢复原样
    segmentedControl.momentary = NO;
    //在指定索引插入一个分段并设置标题
    [segmentedControl insertSegmentWithTitle:@"插入分段" atIndex:2 animated:NO];
    //在指定索引插入一个分段并设置图标
    UIImage *image = [[UIImage imageNamed:@"mortgage"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [segmentedControl insertSegmentWithImage:image atIndex:3 animated:NO];
    //移除指定索引的分段
    [segmentedControl removeSegmentAtIndex:4 animated:NO];
    //设置指定索引分段的宽度
    [segmentedControl setWidth:100.0 forSegmentAtIndex:2];
    //设置分段内容偏移量
    [segmentedControl setContentOffset:CGSizeMake(0.0, 5.0) forSegmentAtIndex:2];
    
    //设置监听事件
    //UIControlEventValueChanged——值改变时响应
    [segmentedControl addTarget:self action:@selector(segmentedControlAction:) forControlEvents:UIControlEventValueChanged];
    return segmentedControl;
}

#pragma mark - UISegmentedControl 值改变时响应
- (void)segmentedControlAction:(UISegmentedControl *)segmentedControl
{
    NSInteger Index = segmentedControl.selectedSegmentIndex;
    NSLog(@"当前分段选择为： %li", (long)Index);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
