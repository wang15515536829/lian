//
//  OpinionViewController.m
//  项目A设置界面
//
//  Created by lanouhn on 15/6/25.
//  Copyright (c) 2015年 lanou3G.com. All rights reserved.
//

#import "OpinionViewController.h"

@interface OpinionViewController ()

@end

@implementation OpinionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"感谢您的意见";
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 50, 335, 200)];
    label.text = @"请详细描述您的意见和遇到的问题，发送到123456789@mutouren.com。谢谢！";
    label.font = [UIFont systemFontOfSize:24];
    label.numberOfLines = 0;
    
    
    [self.view addSubview:label];
    [label release];
    
}


@end
