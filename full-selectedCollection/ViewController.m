//
//  ViewController.m
//  full-selectedCollection
//
//  Created by 谢鹏翔 on 16/2/29.
//  Copyright © 2016年 谢鹏翔. All rights reserved.
//

#import "ViewController.h"
#import "XieCollectionViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = @"1111";
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 50, 50);
    [button setTitle:@"多选" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor purpleColor];
    [button addTarget:self action:@selector(clickToNextVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    
    
    // 新建分支
    UILabel *label = [[UILabel alloc] init];
    label.text = @"要死就111111哎呀呀---branch";
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:15];
    label.frame = CGRectMake(0, 200, self.view.bounds.size.width, 50);
    [self changeLabel:label textColor:[UIColor redColor]];
    [self.view addSubview:label];
}

// 将字符串中的数字 变成红色
- (void)changeLabel:(UILabel *)label textColor:(UIColor *)color
{
    NSString *string = label.text;
    
    NSCharacterSet* nonDigits =[[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    
    NSInteger remainSecond =[[string stringByTrimmingCharactersInSet:nonDigits] intValue];
    
    NSString *rangeStr = [NSString stringWithFormat:@"%ld",remainSecond];
    
    NSRange range = [string rangeOfString:rangeStr];
    
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc]initWithString:label.text];
    
    [attrString addAttribute:NSForegroundColorAttributeName value:color range:range];
    
    label.attributedText = attrString;
}

- (void)clickToNextVC
{
    XieCollectionViewController *nextVC = [[XieCollectionViewController alloc] init];
    [self.navigationController pushViewController:nextVC animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
