//
//  FreeHeroViewController.m
//  项目A
//
//  Created by lanouhn on 15/6/25.
//  Copyright (c) 2015年 lanou3G.com. All rights reserved.
//

#import "AllHeroViewController.h"

#import "HeroInfoViewController.h"

@interface AllHeroViewController ()<NetworkEngineDelegate , UITableViewDelegate , UITableViewDataSource , UISearchResultsUpdating>

@property (nonatomic , retain)UITableView *tableView;
@property (nonatomic , retain)NSArray *searchArray;

@property (nonatomic , retain)NSArray *allArray;

@property (nonatomic , retain)UITableView *searchTable;

@end

@implementation AllHeroViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationItem.title = @"全部英雄";
    
//    self.searchTable = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
//    self.searchTable.dataSource = self;
//    self.searchTable.delegate = self;
//    [self.view addSubview:self.searchTable];
//    [self.searchTable release];
    
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    [self.tableView release];
    
    [self searchHero];
    
    [self getDataFromURL];
    
}

#pragma mark - 搜索英雄
- (void)searchHero
{
    UISearchController *searchVC =[[UISearchController alloc] initWithSearchResultsController:nil];
    //设置开始搜索时背景显示与否(很重要)
    searchVC.dimsBackgroundDuringPresentation = NO;
    //适应整个屏幕
    [searchVC.searchBar sizeToFit];
    //设置显示搜索结果的控制器
    searchVC.searchResultsUpdater = self; //协议(UISearchResultsUpdating)
    //将搜索控制器的搜索条设置为页眉视图
    self.tableView.tableHeaderView = searchVC.searchBar;
}
//更新搜索结果
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self contains [cd] %@", searchController.searchBar.text];
    self.searchArray = [NSArray arrayWithArray:[self.allArray filteredArrayUsingPredicate:predicate]];
    
    [self.tableView reloadData];
    
}

#pragma mark - 请求数据
- (void)getDataFromURL
{
    NetworkEngine *engine = [NetworkEngine netWorhEngineWithURL:[NSURL URLWithString:kAllHeroURL] params:nil delegate:self];
    [engine start];
}

#pragma mark - 数据请求成功
- (void)netWorkDidFinishLoading:(NetworkEngine *)engine withInfo:(NSData *)data
{
    self.allArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
//    NSMutableArray *nameArray = [[NSMutableArray alloc] init];
//    for (NSDictionary *dic in self.allArray) {
//        //抓到大数组里每个英雄的名字
//        [nameArray addObject:dic[@"nick"]];
//    }
//    //把英雄名字排序
//    NSArray *newArr = [NSArray arrayWithArray:nameArray];
//    
//    self.sortArray = [[NSArray alloc] init];
//    self.sortArray = [newArr sortedArrayUsingSelector:@selector(compare:)];
    self.searchArray = [[NSArray alloc] init];
    if (self.searchArray.count == 0) {
        self.searchArray = self.allArray;
    }

    [self.tableView reloadData];
}





#pragma mark - tableView代理方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.searchArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = @"id";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    cell.textLabel.text = self.searchArray[indexPath.row][@"nick"];
    cell.detailTextLabel.text = self.searchArray[indexPath.row][@"name"];
    cell.imageView.image = [UIImage imageNamed:self.searchArray[indexPath.row][@"en_name"]];
    
    return cell;
}

//cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

//头文字
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    return @"A";
//}

//索引值
//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
//{
//    return @[@"a" ,@"b"];
//}


#pragma mark - cell点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HeroInfoViewController *heroInfo = [[HeroInfoViewController alloc] init];
    [self.navigationController pushViewController:heroInfo animated:YES];
    heroInfo.dic = self.allArray[indexPath.row];
    heroInfo.allArray = self.allArray;
    heroInfo.isAll = YES;
    [heroInfo release];
}


- (void)dealloc
{
    [_tableView release];
    [super dealloc];
}





@end
