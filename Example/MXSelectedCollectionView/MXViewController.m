//
//  MXViewController.m
//  MXSelectedCollectionView
//
//  Created by xiepengxiang on 11/22/2016.
//  Copyright (c) 2016 xiepengxiang. All rights reserved.
//

#import "MXViewController.h"
#import "ShowViewController.h"
#import <MXSelectedCollectionView/XieCollectionViewController.h>

@interface MXViewController ()

@end

@implementation MXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor purpleColor];
    self.navigationItem.title = @"1111";
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 50, 50);
    [button setTitle:@"多选" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor purpleColor];
    [button addTarget:self action:@selector(clickToNextVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void)clickToNextVC
{
    XieCollectionViewController *nextVC = [[XieCollectionViewController alloc] init];
    nextVC.clickHandler = ^(NSString *text){
        ShowViewController *showVC = [[ShowViewController alloc] init];
        
        showVC.text = text;
        
        [self.navigationController pushViewController:showVC animated:YES];
    };
    [self.navigationController pushViewController:nextVC animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
