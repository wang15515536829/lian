//
//  Video.m
//  LianMeng
//
//  Created by lanouhn on 15/6/26.
//  Copyright (c) 2015年 lanouhn3g - 23 .com. All rights reserved.
//

#import "Video.h"

@implementation Video

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubviews];
    }
    return self;
}
- (void)addSubviews
{
    self.tableView1 = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height- 49) style:UITableViewStylePlain];
    [self addSubview:self.tableView1];
    self.tableView1.delegate = self;
    self.tableView1.dataSource = self;
    
    // 请求数据
    [self getDataFromUrl];
    
    
}

#pragma mark - 请求数据
- (void)getDataFromUrl{
    NetworkEngine1 *engine = [NetworkEngine1 netWorkEngineWithURL:[NSURL URLWithString:kShiping] params:nil delegate:self];
    [engine start];
    
}
#pragma  mark - 请求数据成功的方法
- (void)netWorkDidFinishLoading:(NetworkEngine1 *)engine withInfo:(NSData *)data
{
    // 解析
    NSError *error = nil;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    NSLog(@"error%@" , error);
    
    NSArray *listArray = [dic objectForKey:@"list"];
    
    for (NSDictionary *listDic in listArray) {
        NSLog(@"*********");
        ItemModel *list = [[ItemModel alloc] initWithDictionary:listDic];
        [self.array addObject:list];
    }
    NSLog(@"------------");
    [self.tableView1 reloadData];
}
//array的懒加载
- (NSMutableArray *)array
{
    if (!_array) {
        self.array = [NSMutableArray array];
        
    }
    return _array;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID1 = @"cellID1";
    ItemCell *cell1 = [tableView dequeueReusableCellWithIdentifier:cellID1];
    if (nil == cell1) {
        cell1 = [[ItemCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID1];
    }
    ItemModel *model = [self.array objectAtIndex:indexPath.row];
    cell1.nameLael.text = model.title;
    cell1.contentLabel.text = model.summary;
    cell1.headimageView.imageURL = [NSURL URLWithString:model.image];
    NSString *str = [model.insert substringWithRange:NSMakeRange(6, 5)];
    cell1.publishedLabel.text = str;
    
    
    
    //    cell1.textLabel.text = @"测试2";
    return cell1;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
