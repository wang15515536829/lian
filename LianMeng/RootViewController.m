//
//  RootViewController.m
//  项目A攻略界面
//
//  Created by lanouhn on 15/6/25.
//  Copyright (c) 2015年 lanou3G.com. All rights reserved.
//

#import "RootViewController.h"

#import "InfoViewController.h"

@interface RootViewController ()<UISearchResultsUpdating , UITableViewDataSource , UITableViewDelegate>

@property (nonatomic , retain) UITableView *tableView;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"攻略";
    
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView release];
    
    UISearchController *searchVC = [[UISearchController alloc] initWithSearchResultsController:nil];
    searchVC.dimsBackgroundDuringPresentation = YES;
    [searchVC.searchBar sizeToFit];
    searchVC.searchResultsUpdater = self;
    self.tableView.tableHeaderView = searchVC.searchBar;

}


//更新搜索结果
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    
}


#pragma mark - tableView代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = @"ddd";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    cell.textLabel.text = @"攻略";
    return cell;
}

#pragma mark - cell点击方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    InfoViewController *infoVC = [[InfoViewController alloc] init];
    [self.navigationController pushViewController:infoVC animated:YES];
    [infoVC release];
}



@end
