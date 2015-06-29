//
//  AboutUsViewController.m
//  项目A设置界面
//
//  Created by lanouhn on 15/6/25.
//  Copyright (c) 2015年 lanou3G.com. All rights reserved.
//

#import "AboutUsViewController.h"

@interface AboutUsViewController ()

@end

@implementation AboutUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"关于我们";
    
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(147, 110, 80, 80)];
    image.image = [UIImage imageNamed:@"111.jpg"];
    [self.view addSubview:image];
    [image release];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, 375, 50)];
    label.text = @"掌上联盟";
    label.font = [UIFont boldSystemFontOfSize:24];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    [label release];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 250, 375, 30)];
    label1.text = @"V1.0.0";
//    label1.font = [UIFont systemFontOfSize:24];
    label1.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label1];
    [label1 release];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 330, 260, 50)];
    label2.text = @"设计团队：";
    label2.font = [UIFont systemFontOfSize:24];
    label2.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label2];
    [label2 release];
    
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(0, 380, 375, 50)];
    label3.text = @"zzzzz";
    label3.font = [UIFont systemFontOfSize:24];
    label3.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label3];
    [label3 release];
    
    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(0, 430, 375, 50)];
    label4.text = @"zzzzz";
    label4.font = [UIFont systemFontOfSize:24];
    label4.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label4];
    [label4 release];
    
}












@end
