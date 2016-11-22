//
//  ShowViewController.m
//  full-selectedCollection
//
//  Created by 谢鹏翔 on 16/3/8.
//  Copyright © 2016年 谢鹏翔. All rights reserved.
//

#import "ShowViewController.h"

@implementation ShowViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"展示";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = _text;
    label.frame = CGRectMake(0, 0, 80, 80);
    label.font = [UIFont systemFontOfSize:40];
    label.center = self.view.center;
    label.textColor = [UIColor orangeColor];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
}

@end
