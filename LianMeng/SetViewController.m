//
//  SetViewController.m
//  项目A设置界面
//
//  Created by lanouhn on 15/6/25.
//  Copyright (c) 2015年 lanou3G.com. All rights reserved.
//

#import "SetViewController.h"

#import "OpinionViewController.h"
#import "AboutUsViewController.h"



@interface SetViewController ()<UITableViewDataSource , UITableViewDelegate>

@property (nonatomic , retain)UITableView *tableView;

@end

@implementation SetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"设置";
    
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
//    self.tableView.sectionHeaderHeight = 0;
    [self.tableView release];
    
    
    
  
    
    
}


#pragma mark - tableView代理方法
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 0;
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = @"id";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    if (indexPath.row == 0) {
        cell.textLabel.text = @"意见反馈";
    }else if (indexPath.row == 1)
    {
        cell.textLabel.text = @"关于我们";
    }else if (indexPath.row == 2)
    {
        cell.textLabel.text = @"清空缓存？";
    }else if (indexPath.row == 3)
    {
        cell.textLabel.text = @"退出程序";
    }
    
    return cell;
}

#pragma mark - cell点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        OpinionViewController *opinionVC = [[OpinionViewController alloc] init];
        [self.navigationController pushViewController:opinionVC animated:YES];
    }else if (indexPath.row == 1)
    {
        AboutUsViewController *aboutUsVC = [[AboutUsViewController alloc] init];
        [self.navigationController pushViewController:aboutUsVC animated:YES];
    }else if (indexPath.row == 2)
    {
        
    }else if (indexPath.row == 3)
    {
        
    }

}



- (void)dealloc
{
    [_tableView release];
    [super dealloc];
}

@end
