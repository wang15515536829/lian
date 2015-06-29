//
//  InfoCell.h
//  LianMeng
//
//  Created by lanouhn on 15/6/27.
//  Copyright (c) 2015年 lanouhn3g - 23 .com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoCell : UITableViewCell

@property (nonatomic , retain)UIScrollView *scrollView;

@property (nonatomic , retain)UIView *infoView0;
@property (nonatomic , retain)UIView *infoView1;
@property (nonatomic , retain)UIView *infoView2;
@property (nonatomic , retain)UIView *rootView;

@property (nonatomic , retain)UILabel *caoZuoLabel;
@property (nonatomic , retain)UILabel *tuanZhanLabel;
@property (nonatomic , retain)UILabel *shiYongLabel1;
@property (nonatomic , retain)UILabel *shiYongLabel2;
@property (nonatomic , retain)UILabel *shiYongLabel3;
@property (nonatomic , retain)UILabel *duiKangLabel1;
@property (nonatomic , retain)UILabel *duiKangLabel2;
@property (nonatomic , retain)UILabel *duiKangLabel3;
@property (nonatomic , retain)UILabel *tLabel;
@property (nonatomic , retain)UILabel *sLabel;
@property (nonatomic , retain)UILabel *dLabel;


@property (nonatomic , retain)UIImageView *partner1;
@property (nonatomic , retain)UILabel *partnerLabel1;
@property (nonatomic , retain)UIImageView *partner2;
@property (nonatomic , retain)UILabel *partnerLabel2;
@property (nonatomic , retain)UIImageView *opponent1;
@property (nonatomic , retain)UILabel *opponentLabel1;
@property (nonatomic , retain)UIImageView *opponent2;
@property (nonatomic , retain)UILabel *opponentLabel2;

@property (nonatomic , retain)UILabel *storyLabel;

//计算高度
- (void)calculateHeight;


@end
