//
//  HeroViewController.m
//  项目A
//
//  Created by lanouhn on 15/6/25.
//  Copyright (c) 2015年 lanou3G.com. All rights reserved.
//

#import "HeroViewController.h"

#import "AllHeroViewController.h"
#import "HeroInfoViewController.h"


@interface HeroViewController ()<UITableViewDataSource , UITableViewDelegate , NetworkEngineDelegate>

//@property (nonatomic , retain)UISegmentedControl *segmented;

@property (nonatomic , retain)UITableView *tableView;

@property (nonatomic , retain)NSDictionary *dicData;
@property (nonatomic , retain)NSArray *mHeroArray;
@property (nonatomic, retain) NetworkEngine *engine1;


@end

@implementation HeroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.segmented = [[UISegmentedControl alloc] initWithItems:@[@"周免" , @"全部"]];
//    self.segmented.frame = CGRectMake(0, 50, 375, 50);
//    [self.segmented addTarget:self action:@selector(segmentedAction:) forControlEvents:UIControlEventValueChanged];
//    self.navigationItem.titleView = self.segmented;
////    [self.view addSubview:self.segmented];
//    [self.segmented release];
    
    self.navigationItem.title = @"本周周免";
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"全部英雄" style:UIBarButtonItemStylePlain target:self action:@selector(pushToAllHeroVC)];
    self.navigationItem.rightBarButtonItem = rightItem;
    [rightItem release];
    
    
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    [self.tableView release];
    
    
    [self getDataFromURL];
    
    // 获取所有英雄详细信息的方法
    [self getAllHerosDataFromURL];
    
    // 设置导航控制器上面的渲染颜色（navigationBar上面的按钮的title的颜色）
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
}

#pragma mark - 请求数据
- (void)getDataFromURL
{
    NetworkEngine *engine = [NetworkEngine netWorhEngineWithURL:[NSURL URLWithString:kMHeroURL] params:nil delegate:self];
    [engine start];
}

#pragma mark - 请求全部英雄详细数据
- (void)getAllHerosDataFromURL
{
    self.engine1 = [NetworkEngine netWorhEngineWithURL:[NSURL URLWithString:kAllHeroURL] params:nil delegate:self];
    [self.engine1 start];
}

#pragma mark - 数据请求成功的代理方法
- (void)netWorkDidFinishLoading:(NetworkEngine *)engine withInfo:(NSData *)data
{
    if ([engine isEqual:self.engine1]) {
        NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        HeroData *heros = [HeroData shareHeroData];
        heros.array = (NSMutableArray *)array;
        NSLog(@"!%@", heros.array);
    } else {
        NSString *strData = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSString *str = [strData stringByReplacingOccurrencesOfString:@"if(!LOLherojs)var LOLherojs={};LOLherojs.free={" withString:@"{"];
        NSLog(@"%ld" , str.length);
        NSString *newStr = [str substringToIndex:str.length - 1];
        //    NSLog(@"%@" , newStr);
        NSData *data1 = [newStr dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data1 options:NSJSONReadingMutableContainers error:nil];
        
        self.mHeroArray = [dic[@"keys"] allValues];
        self.dicData = dic[@"data"];
        
        [self.tableView reloadData];
        
    }
    
}


#pragma mark - 跳转到全部英雄界面
- (void)pushToAllHeroVC
{
    AllHeroViewController *allVC = [[AllHeroViewController alloc] init];
    [self.navigationController pushViewController:allVC animated:YES];
    [allVC release];
}

#pragma mark - tableView代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.mHeroArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = @"id";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    NSDictionary *dic = self.dicData[self.mHeroArray[indexPath.row]];
    cell.textLabel.text = dic[@"name"];
    cell.detailTextLabel.text = dic[@"title"];
    cell.imageView.image = [UIImage imageNamed:self.mHeroArray[indexPath.row]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 375, 20)];
    label.text = @"每周五10点更新";
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:15];
    return label;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

#pragma mark - cell点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HeroInfoViewController *heroInfo = [[HeroInfoViewController alloc] init];
    [self.navigationController pushViewController:heroInfo animated:YES];
    heroInfo.dic = self.dicData[self.mHeroArray[indexPath.row]];
    [heroInfo release];
}


- (void)dealloc
{
    [_tableView release];
    [_engine1 release];
    [super dealloc];
}






@end
