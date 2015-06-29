//
//  InfoViewController.m
//  项目A攻略界面
//
//  Created by lanouhn on 15/6/25.
//  Copyright (c) 2015年 lanou3G.com. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()

@property (nonatomic , retain)UIWebView *webView;

@end

@implementation InfoViewController

//webView懒加载
- (UIWebView *)webView
{
    if (!_webView) {
        _webView = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [self.view addSubview:_webView];
        [_webView release];
    }
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"攻略详情";
   
    self.webView.backgroundColor = [UIColor blueColor];
    UIView *view = [[UIView alloc] initWithFrame:self.view.frame];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];

}








@end
