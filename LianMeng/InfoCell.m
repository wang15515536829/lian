//
//  InfoCell.m
//  LianMeng
//
//  Created by lanouhn on 15/6/27.
//  Copyright (c) 2015年 lanouhn3g - 23 .com. All rights reserved.
//

#import "InfoCell.h"

#define kLabelB 30
#define kLabelWeight 320

CGFloat a, b, c;

@implementation InfoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubviews];
    }
    return self;
}

- (void)addSubviews
{
    a = 0;
    b = 0;
    c = 0;
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 375, 363)];
    [self addSubview: self.scrollView];
    [self.scrollView release];
    
    self.rootView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375 * 3, 1000)];
    [self.scrollView addSubview:self.rootView];
    [self.rootView release];
    
    self.scrollView.contentSize = self.rootView.frame.size;
    self.scrollView.bounces = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
//    self.scrollView.pagingEnabled = YES;
    
    
    //技巧************
    //操作
    self.infoView0 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, self.rootView.frame.size.height)];
    self.infoView0.backgroundColor = [UIColor grayColor];
    
    UILabel *tLabel = [[UILabel alloc] initWithFrame:CGRectMake(kLabelB, 10, kLabelWeight, 20)];
    tLabel.text = @"操作技巧";
    tLabel.font = [UIFont boldSystemFontOfSize:20];
    [self.infoView0 addSubview:tLabel];
    
    self.caoZuoLabel = [[UILabel alloc] initWithFrame:CGRectMake(kLabelB, tLabel.frame.origin.y + tLabel.frame.size.height + 10, kLabelWeight, 100)];
    self.caoZuoLabel.numberOfLines = 0;
    [self.infoView0 addSubview:self.caoZuoLabel];
    
    //团战
    UILabel *tLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(kLabelB, self.caoZuoLabel.frame.origin.y + self.caoZuoLabel.frame.size.height, kLabelWeight, 20)];
    tLabel1.text = @"团战思路";
    tLabel1.font = [UIFont boldSystemFontOfSize:20];
    [self.infoView0 addSubview:tLabel1];
    
    self.tuanZhanLabel = [[UILabel alloc] initWithFrame:CGRectMake(kLabelB, tLabel1.frame.origin.y + tLabel1.frame.size.height, kLabelWeight, 100)];
    self.tuanZhanLabel.numberOfLines = 0;
    [self.infoView0 addSubview:self.tuanZhanLabel];

    // 使用
    UILabel *tLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(kLabelB, self.tuanZhanLabel.frame.origin.y + self.tuanZhanLabel.frame.size.height + 10, kLabelWeight, 20)];
    tLabel2.text = @"使用技巧";
    tLabel2.font = [UIFont boldSystemFontOfSize:20];
    [self.infoView0 addSubview:tLabel2];
    
    self.shiYongLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(kLabelB, tLabel2.frame.origin.y + tLabel2.frame.size.height + 10, kLabelWeight, 100)];
    self.shiYongLabel1.numberOfLines = 0;
    [self.infoView0 addSubview:self.shiYongLabel1];
    
    self.shiYongLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(kLabelB, self.shiYongLabel1.frame.origin.y + self.shiYongLabel1.frame.size.height, kLabelWeight, 100)];
    self.shiYongLabel2.numberOfLines = 0;
    [self.infoView0 addSubview:self.shiYongLabel2];

    self.shiYongLabel3 = [[UILabel alloc] initWithFrame:CGRectMake(kLabelB, self.shiYongLabel2.frame.origin.y + self.shiYongLabel2.frame.size.height, kLabelWeight, 100)];
    self.shiYongLabel3.numberOfLines = 0;
    [self.infoView0 addSubview:self.shiYongLabel3];

    //对抗
    UILabel *tLabel3 = [[UILabel alloc] initWithFrame:CGRectMake(kLabelB, self.shiYongLabel3.frame.origin.y + self.shiYongLabel3.frame.size.height + 10, kLabelWeight, 20)];
    tLabel3.text = @"对抗技巧";
    tLabel3.font = [UIFont boldSystemFontOfSize:20];
    [self.infoView0 addSubview:tLabel3];
    
    self.duiKangLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(kLabelB, tLabel3.frame.origin.y + tLabel3.frame.size.height + 10, kLabelWeight, 100)];
    self.duiKangLabel1.numberOfLines = 0;
    [self.infoView0 addSubview:self.duiKangLabel1];
    
    self.duiKangLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(kLabelB, self.duiKangLabel1.frame.origin.y + self.duiKangLabel1.frame.size.height, kLabelWeight, 100)];
    self.duiKangLabel2.numberOfLines = 0;
    [self.infoView0 addSubview:self.duiKangLabel2];
    
    self.duiKangLabel3 = [[UILabel alloc] initWithFrame:CGRectMake(kLabelB, self.duiKangLabel2.frame.origin.y + self.duiKangLabel2.frame.size.height, kLabelWeight, 100)];
    self.duiKangLabel3.numberOfLines = 0;
    [self.infoView0 addSubview:self.duiKangLabel3];

    [self.rootView addSubview:self.infoView0];
    [self.infoView0 release];
    
    //搭档*******
    self.infoView1 = [[UIView alloc] initWithFrame:CGRectMake(375, 0, 375, 600)];
    self.infoView1.backgroundColor = [UIColor greenColor];
    
    UILabel *dLabel = [[UILabel alloc] initWithFrame:CGRectMake(kLabelB, 10, kLabelWeight, 20)];
    dLabel.text = @"最佳拍档";
    dLabel.font = [UIFont boldSystemFontOfSize:20];
    [self.infoView1 addSubview:dLabel];
    
    self.partner1 = [[UIImageView alloc] initWithFrame:CGRectMake(kLabelB, dLabel.frame.origin.y + dLabel.frame.size.height + 10, 40, 40)];
    [self.infoView1 addSubview:self.partner1];
    [self.partner1 release];
    
    self.partnerLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(self.partner1.frame.origin.x + self.partner1.frame.size.width + 20, self.partner1.frame.origin.y + self.partner1.frame.size.height + 10, 280, 40)];
    self.partnerLabel1.numberOfLines = 0;
    [self.infoView1 addSubview:self.partnerLabel1];
    [self.partnerLabel1 release];
    
    self.partner2 = [[UIImageView alloc] initWithFrame:CGRectMake(kLabelB, self.partner1.frame.origin.y + self.partner1.frame.size.height + 10, 40, 40)];
    [self.infoView1 addSubview:self.partner2];
    [self.partner2 release];
    
    self.opponent1 = [[UIImageView alloc] initWithFrame:CGRectMake(kLabelB, self.partner2.frame.origin.y + self.partner2.frame.size.height + 10, 40, 40)];
    [self.infoView1 addSubview:self.opponent1];
    [self.opponent1 release];
    
    self.opponent2 = [[UIImageView alloc] initWithFrame:CGRectMake(kLabelB, self.opponent1.frame.origin.y + self.opponent1.frame.size.height + 10, 40, 40)];
    [self.infoView1 addSubview:self.opponent2];
    [self.opponent2 release];
    
 
    
    
    [self.rootView addSubview:self.infoView1];
    [self.infoView1 release];
    
    //故事**********
    self.infoView2 = [[UIView alloc] initWithFrame:CGRectMake(750, 0, 375, 600)];
    self.infoView2.backgroundColor = [UIColor blueColor];
    
    UILabel *gLabel = [[UILabel alloc] initWithFrame:CGRectMake(kLabelB, 10, kLabelWeight, 20)];
    gLabel.text = @"背景故事";
    gLabel.font = [UIFont boldSystemFontOfSize:20];
    [self.infoView2 addSubview:gLabel];
    
    self.storyLabel = [[UILabel alloc] initWithFrame:CGRectMake(kLabelB, 30, kLabelWeight, 1500)];
    self.storyLabel.numberOfLines = 0;
    [self.infoView2 addSubview:self.storyLabel];
    [self.storyLabel release];

    
    [self.rootView addSubview:self.infoView2];
    [self.infoView2 release];
    

    //    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    

    
}

// 计算各控件高度
- (void)calculateHeight
{
    [self changLabelFrame:self.caoZuoLabel with:self.caoZuoLabel.text];
//    //团战
//    self.tLabel = [[UILabel alloc] initWithFrame:CGRectMake(kLabelB, self.caoZuoLabel.frame.origin.y + self.caoZuoLabel.frame.size.height + 10, kLabelWeight, 20)];
//    self.tLabel.text = @"团战思路1";
//    self.tLabel.font = [UIFont boldSystemFontOfSize:20];
//    [self.infoView0 addSubview:self.tLabel];
    
//    UILabel *tLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(kLabelB, self.caoZuoLabel.frame.origin.y + self.caoZuoLabel.frame.size.height, kLabelWeight, 20)];
//    tLabel1.text = @"团战思路";
//    tLabel1.font = [UIFont boldSystemFontOfSize:20];
//    [self.infoView0 addSubview:tLabel1];
//    
//    self.tuanZhanLabel = [[UILabel alloc] initWithFrame:CGRectMake(kLabelB, tLabel1.frame.origin.y + tLabel1.frame.size.height, kLabelWeight, 100)];
//    self.tuanZhanLabel.numberOfLines = 0;
//    [self.infoView0 addSubview:self.tuanZhanLabel];
//    [self changLabelFrame:self.tuanZhanLabel with:self.tuanZhanLabel.text];
//
//    
//    // 使用
//    UILabel *tLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(kLabelB, self.tuanZhanLabel.frame.origin.y + self.tuanZhanLabel.frame.size.height + 10, kLabelWeight, 20)];
//    tLabel2.text = @"使用技巧";
//    tLabel2.font = [UIFont boldSystemFontOfSize:20];
//    [self.infoView0 addSubview:tLabel2];
//    
//    self.shiYongLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(kLabelB, tLabel2.frame.origin.y + tLabel2.frame.size.height + 10, kLabelWeight, 100)];
//    self.shiYongLabel1.numberOfLines = 0;
//    [self.infoView0 addSubview:self.shiYongLabel1];
//    [self changLabelFrame:self.shiYongLabel1 with:self.shiYongLabel1.text];
//
//    
//    self.shiYongLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(kLabelB, self.shiYongLabel1.frame.origin.y + self.shiYongLabel1.frame.size.height, kLabelWeight, 100)];
//    self.shiYongLabel2.numberOfLines = 0;
//    [self.infoView0 addSubview:self.shiYongLabel2];
//    [self changLabelFrame:self.shiYongLabel2 with:self.shiYongLabel2.text];
//
//    
//    self.shiYongLabel3 = [[UILabel alloc] initWithFrame:CGRectMake(kLabelB, self.shiYongLabel2.frame.origin.y + self.shiYongLabel2.frame.size.height, kLabelWeight, 100)];
//    self.shiYongLabel3.numberOfLines = 0;
//    [self.infoView0 addSubview:self.shiYongLabel3];
//    [self changLabelFrame:self.shiYongLabel3 with:self.shiYongLabel3.text];
//
//    
//    //对抗
//    UILabel *tLabel3 = [[UILabel alloc] initWithFrame:CGRectMake(kLabelB, self.shiYongLabel3.frame.origin.y + self.shiYongLabel3.frame.size.height + 10, kLabelWeight, 20)];
//    tLabel3.text = @"对抗技巧";
//    tLabel3.font = [UIFont boldSystemFontOfSize:20];
//    [self.infoView0 addSubview:tLabel3];
//    
//    self.duiKangLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(kLabelB, tLabel3.frame.origin.y + tLabel3.frame.size.height + 10, kLabelWeight, 100)];
//    self.duiKangLabel1.numberOfLines = 0;
//    [self.infoView0 addSubview:self.duiKangLabel1];
//    [self changLabelFrame:self.duiKangLabel1 with:self.duiKangLabel1.text];
//
//    
//    self.duiKangLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(kLabelB, self.duiKangLabel1.frame.origin.y + self.duiKangLabel1.frame.size.height, kLabelWeight, 100)];
//    self.duiKangLabel2.numberOfLines = 0;
//    [self.infoView0 addSubview:self.duiKangLabel2];
//    [self changLabelFrame:self.duiKangLabel2 with:self.duiKangLabel2.text];
//
//    
//    self.duiKangLabel3 = [[UILabel alloc] initWithFrame:CGRectMake(kLabelB, self.duiKangLabel2.frame.origin.y + self.duiKangLabel2.frame.size.height, kLabelWeight, 100)];
//    self.duiKangLabel3.numberOfLines = 0;
//    [self.infoView0 addSubview:self.duiKangLabel3];
//    [self changLabelFrame:self.duiKangLabel3 with:self.duiKangLabel3.text];
//
//    
//    [self.rootView addSubview:self.infoView0];
//    [self.infoView0 release];
//    
//    //搭档*******
//    self.infoView1 = [[UIView alloc] initWithFrame:CGRectMake(375, 0, 375, 600)];
//    self.infoView1.backgroundColor = [UIColor greenColor];
//    
//    UILabel *dLabel = [[UILabel alloc] initWithFrame:CGRectMake(kLabelB, 10, kLabelWeight, 20)];
//    dLabel.text = @"最佳拍档";
//    dLabel.font = [UIFont boldSystemFontOfSize:20];
//    [self.infoView1 addSubview:dLabel];
//    
//    self.partner1 = [[UIImageView alloc] initWithFrame:CGRectMake(kLabelB, dLabel.frame.origin.y + dLabel.frame.size.height + 10, 40, 40)];
//    [self.infoView1 addSubview:self.partner1];
//    [self.partner1 release];
//    
//    self.partnerLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(self.partner1.frame.origin.x + self.partner1.frame.size.width + 20, self.partner1.frame.origin.y + self.partner1.frame.size.height + 10, 280, 40)];
//    self.partnerLabel1.numberOfLines = 0;
//    [self.infoView1 addSubview:self.partnerLabel1];
//    [self.partnerLabel1 release];
//    
//    
//    
//    
//    [self.rootView addSubview:self.infoView1];
//    [self.infoView1 release];
//    
//    //故事**********
//    self.infoView2 = [[UIView alloc] initWithFrame:CGRectMake(750, 0, 375, 600)];
//    self.infoView2.backgroundColor = [UIColor blueColor];
//    
//    UILabel *gLabel = [[UILabel alloc] initWithFrame:CGRectMake(kLabelB, 10, kLabelWeight, 20)];
//    gLabel.text = @"背景故事";
//    gLabel.font = [UIFont boldSystemFontOfSize:20];
//    [self.infoView2 addSubview:gLabel];
//    
//    self.storyLabel = [[UILabel alloc] initWithFrame:CGRectMake(kLabelB, 30, kLabelWeight, 1500)];
//    self.storyLabel.numberOfLines = 0;
//    [self.infoView2 addSubview:self.storyLabel];
//    [self.storyLabel release];
//    
//    
//    
//    
//    [self.rootView addSubview:self.infoView2];
//    [self.infoView2 release];


    [self changLabelFrame:self.tuanZhanLabel with:self.tuanZhanLabel.text];
    [self changLabelFrame:self.shiYongLabel1 with:self.shiYongLabel1.text];
    [self changLabelFrame:self.shiYongLabel2 with:self.shiYongLabel2.text];
    [self changLabelFrame:self.shiYongLabel3 with:self.shiYongLabel3.text];
    [self changLabelFrame:self.duiKangLabel1 with:self.duiKangLabel1.text];
    [self changLabelFrame:self.duiKangLabel2 with:self.duiKangLabel2.text];
    [self changLabelFrame:self.duiKangLabel3 with:self.duiKangLabel3.text];
    
    NSLog(@"%@" , self.storyLabel.text);
}


- (void)changLabelFrame:(UILabel *)label with:(NSString *)sender
{
    CGSize maxSize = CGSizeMake(label.frame.size.width, 10000);
    CGRect aRect = [sender boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
    label.frame = CGRectMake(label.frame.origin.x, label.frame.origin.y, label.frame.size.width, aRect.size.height);
    a = a + aRect.size.height;
    self.rootView.frame = CGRectMake(self.rootView.frame.origin.x, self.rootView.frame.origin.y, self.rootView.frame.size.width, a);
    
}







@end
