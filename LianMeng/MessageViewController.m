//
//  MessageViewController.m
//  LianMeng
//
//  Created by lanouhn on 15/6/26.
//  Copyright (c) 2015年 lanouhn3g - 23 .com. All rights reserved.
//

#import "MessageViewController.h"

@interface MessageViewController ()<UIScrollViewDelegate>


@property (nonatomic, retain) UIView *vi;
@end

@implementation MessageViewController


- (void)loadView
{
    [super loadView];
    self.messageView = [[MessageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = self.messageView;
    self.messageView.backgroundColor = [UIColor lightGrayColor];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    //创建一个小的View放button
    UIView *vi1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.messageView.frame.size.width, 30)];
    vi1.backgroundColor = [UIColor lightGrayColor];
    
    
    // 创建button贴到View上
    NSArray *array = @[@"最新", @"赛事", @"视频", @"娱乐"];
    
    
    for (int i = 0 ; i < array.count ; i++) {
        UIButton *newButton = [UIButton buttonWithType:UIButtonTypeSystem];
        
        
        [newButton setTitle:array[i] forState:UIControlStateNormal];
        
        [newButton setFrame:CGRectMake(self.messageView.frame.size.width / (array.count)*(i),0, 75, 30)];
        // button的Tag值
        newButton.tag = 100 + i;
        [newButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        
        [vi1 addSubview:newButton];
    }
    
    
    // 创建一个小的View
    self.vi = [[UIView alloc] initWithFrame:CGRectMake(self.messageView.frame.size.width / 4 - 45 , 28, 40, 2)];
    
    
    
    [vi1 addSubview:self.vi];
    
    
    //    把vi1贴到RootView上
    [self.messageView addSubview:vi1];
    
    self.messageView.myscrollView.delegate = self;
    
    
    
}
#pragma mark - button点击事件
- (void)buttonAction:(UIButton *)sender
{
    
    // 小滑块以及偏移效果
    [self ViewSAnimation:(sender.tag - 100)];
    
    // 小滑块以及偏移效果
    //    [self ViewSanimation:(sender.tag - 100)];
    self.messageView.myscrollView.contentOffset = CGPointMake((sender.tag - 100) * self.messageView.myscrollView.frame.size.width, 0);
    
}
#pragma mark - 小滑块的动画效果以及偏移效果
- (void)ViewSAnimation:(NSInteger)num
{
    // 开始动画
    [UIView beginAnimations:@"Maple" context:nil];
    // 设置动画时间
    [UIView setAnimationDuration:0.2];
    
    // 根据button的偏移量来改变小的View条
    if (num == 0) {
        self.vi.center = CGPointMake(self.messageView.frame.size.width / 4 - 43, 28);
        self.vi.backgroundColor = [UIColor orangeColor];
    } else if (num == 1 ){
        self.vi.center = CGPointMake(self.messageView.frame.size.width / 2 - 43, 28);
        self.vi.backgroundColor = [UIColor orangeColor];
    } else if (num == 2 ){
        self.vi.center = CGPointMake(self.messageView.frame.size.width / 4 * 3 - 43, 28);
        self.vi.backgroundColor = [UIColor orangeColor];
    } else  if (num == 3 ){
        self.vi.center = CGPointMake(self.messageView.frame.size.width - 43, 28);
        self.vi.backgroundColor = [UIColor orangeColor];
    } else {
        self.vi.backgroundColor = [UIColor orangeColor];
    }
    
    
    
    // 小滑块以及偏移效果
    
    self.messageView.myscrollView.contentOffset = CGPointMake(num * self.messageView.myscrollView.frame.size.width, 0);
    
    //     动画结束
    [UIView commitAnimations];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self ViewSAnimation:(self.messageView.myscrollView.contentOffset.x / self.messageView.myscrollView.frame.size.width)];
    self.vi.backgroundColor = [UIColor orangeColor];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
