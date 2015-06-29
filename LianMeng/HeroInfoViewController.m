//
//  HeroInfoViewController.m
//  项目A
//
//  Created by lanouhn on 15/6/25.
//  Copyright (c) 2015年 lanou3G.com. All rights reserved.
//

#import "HeroInfoViewController.h"

#import "InfoCell.h"

#define kViewWeight 375

#define kLabelHeiht 30
#define kLabelBegin 70

@interface HeroInfoViewController ()<UITableViewDataSource , UITableViewDelegate , NetworkEngineDelegate>
@property (nonatomic , retain)UITableView *tableView;
//@property (nonatomic , retain)UIScrollView *scrollView;

//@property (nonatomic , retain)UIView *heardView;
@property (nonatomic , retain)UISegmentedControl *segment;
@property (nonatomic , retain)UIView *infoView0;
@property (nonatomic , retain)UIView *infoView1;
@property (nonatomic , retain)UIView *infoView2;

@property (nonatomic , retain)NSDictionary *dicData;

@property (nonatomic , retain)EGOImageView *heroImageView;

@end

@implementation HeroInfoViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.isAll) {
        self.navigationItem.title = self.dic[@"nick"];
    }else{
        self.navigationItem.title = self.dic[@"name"];
    }
    
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kViewWeight, 1000) style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    [self.tableView release];
    
    [self getDataFromURL];

    
}


#pragma mark - 请求数据
- (void)getDataFromURL
{
    if (self.isAll) {
        NetworkEngine *engine = [NetworkEngine netWorhEngineWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://ossweb-img.qq.com/upload/qqtalk/lol_hero/hero_%@.js" , self.dic[@"id"]]] params:nil delegate:self];
        [engine start];
    }else{
        NetworkEngine *engine = [NetworkEngine netWorhEngineWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://ossweb-img.qq.com/upload/qqtalk/lol_hero/hero_%@.js" , self.dic[@"key"]]] params:nil delegate:self];
        [engine start];

    }
    
    
}

#pragma mark - 数据请求成功
- (void)netWorkDidFinishLoading:(NetworkEngine *)engine withInfo:(NSData *)data
{
    self.dicData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    
    [self.tableView reloadData];
}

#pragma mark - tableView代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = @"abc";
    InfoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (nil == cell) {
        cell = [[InfoCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    cell.caoZuoLabel.text = self.dicData[@"op_skill"];
    cell.tuanZhanLabel.text = self.dicData[@"teamwork"];
    cell.shiYongLabel1.text = self.dicData[@"use_skill1"];
    cell.shiYongLabel2.text = self.dicData[@"use_skill2"];
    cell.shiYongLabel3.text = self.dicData[@"use_skill3"];
    cell.duiKangLabel1.text = self.dicData[@"ag_skill1"];
    cell.duiKangLabel2.text = self.dicData[@"ag_skill2"];
    cell.duiKangLabel3.text = self.dicData[@"ag_skill3"];
    
//    NSString *str1 = [NSString string];
//    if (self.dicData != nil) {
//        for (NSDictionary *smallDic in self.allArray) {
//        if ([(NSString *)smallDic[@"id"] isEqualToString:self.dicData[@"best_partner1"]]) {
//                str1 = smallDic[@"en_name"];
//            }
//        }
//    }
//    cell.partner1.image = [UIImage imageNamed:str1];
    cell.partnerLabel1.text = self.dicData[@"partner_reason1"];
    
    cell.storyLabel.text = self.dicData[@"story"];
    if (self.dicData != nil) {
        [cell calculateHeight];
    }
    
    return cell;
}

#pragma mark - 英雄详情方法
//给分区头设置view
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kViewWeight, 240)];
    self.heroImageView = [[EGOImageView alloc] initWithFrame:CGRectMake(0, 0, kViewWeight, 200)];
    self.heroImageView.imageURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://ossweb-img.qq.com/images/lol/web201310/skin/big%@000.jpg" , self.dicData[@"hero_id"]]];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(20, kLabelBegin, 100, kLabelHeiht)];
    label1.text = self.dicData[@"name"];
    label1.textColor = [UIColor whiteColor];
    [self.heroImageView addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(20, kLabelBegin + kLabelHeiht, 300, kLabelHeiht)];
    NSString *str1 = self.dicData[@"tag1"];
    str1 = [str1 stringByAppendingString:@" "];
    str1 = [str1 stringByAppendingString:self.dicData[@"tag2"]];
    str1 = [str1 stringByAppendingString:@" "];
    str1 = [str1 stringByAppendingString:self.dicData[@"tag3"]];
    label2.text = str1;
    label2.textColor = [UIColor whiteColor];
    [self.heroImageView addSubview:label2];
    
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(20, kLabelBegin + kLabelHeiht * 2, 300, kLabelHeiht)];
    NSString *str2 = [NSString stringWithFormat:@"攻：%@ 防：%@ 法：%@ 操作：%@" , self.dicData[@"attack"] , self.dicData[@"defense"] , self.dicData[@"magic"] , self.dicData[@"difficulty"]];
    label3.text = str2;
    label3.textColor = [UIColor whiteColor];
    [self.heroImageView addSubview:label3];

    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(20, kLabelBegin + kLabelHeiht *3, 300, kLabelHeiht)];
    label4.text = [NSString stringWithFormat:@"点券：%@ 金币：%@" , self.dicData[@"money"] , self.dicData[@"coin"]];
    label4.textColor = [UIColor whiteColor];
    [self.heroImageView addSubview:label4];

    
    self.segment = [[UISegmentedControl alloc] initWithItems:@[@"技能" , @"搭配" , @"故事"]];
    self.segment.frame = CGRectMake(0, 200, kViewWeight, 40);
    [self.segment addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    
    [view addSubview:self.heroImageView];
    [view addSubview:self.segment];
    [self.segment release];
    [self.heroImageView release];
    
    self.segment.selectedSegmentIndex = 0;
    
    return view;
}

//改变cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 363;
}

//改变区头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 240;
}

#pragma mark - segment点击事件
- (void)segmentAction:(UISegmentedControl *)sender
{
    NSInteger a = sender.selectedSegmentIndex;
    switch (a) {
        case 0:
            self.infoView0.hidden = NO;
            self.infoView1.hidden = YES;
            self.infoView2.hidden = YES;

            break;
        case 1:
            self.infoView0.hidden = YES;
            self.infoView1.hidden = NO;
            self.infoView2.hidden = YES;
            
            break;
        case 2:
            self.infoView0.hidden = YES;
            self.infoView1.hidden = YES;
            self.infoView2.hidden = NO;
            
            break;
            
        default:
            break;
    }
}



@end
