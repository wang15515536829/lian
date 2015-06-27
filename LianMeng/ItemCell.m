//
//  ItemCell.m
//  LianMeng
//
//  Created by lanouhn on 15/6/26.
//  Copyright (c) 2015年 lanouhn3g - 23 .com. All rights reserved.
//

#import "ItemCell.h"

// 间距
#define kInspace 5

#define kHeadImageHeidght 50
#define kHeadImageWidgth 75

#define kNameLableH 22
#define kNameLabelW 240

#define kContentLabelH 30
#define kContentLabelW 230

#define kPudlishLabelY 43
#define kPudlishLabelX 290
#define kPudlishLabelH 17
#define kPudlishLabelW 40

@implementation ItemCell

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
    // 依次创建 headimageView 、nameLael 、contentLabel、publishedLabel
    self.headimageView =[[EGOImageView alloc] initWithFrame:CGRectMake(kInspace, kInspace, kHeadImageWidgth, kHeadImageHeidght)];
    self.nameLael = [[UILabel alloc] initWithFrame:CGRectMake(kInspace * 2 + kHeadImageWidgth, kInspace, kNameLabelW, kNameLableH)];
    self.nameLael.font = [UIFont systemFontOfSize:16];
    self.contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(kInspace * 2 + kHeadImageWidgth, kNameLableH + 3, kContentLabelW, kContentLabelH)];
    self.contentLabel.font = [UIFont systemFontOfSize:12];
//    self.contentLabel.textAlignment = UIControlContentVerticalAlignmentTop;
    self.contentLabel.numberOfLines = 0;
    self.publishedLabel = [[UILabel alloc] initWithFrame:CGRectMake(kPudlishLabelX ,  + kPudlishLabelY, kPudlishLabelW , kPudlishLabelH)];
    self.publishedLabel.font = [UIFont systemFontOfSize:11];
//    self.publishedLabel.backgroundColor = [UIColor purpleColor];
    
    
    [self addSubview:self.headimageView];
    [self addSubview:self.nameLael];
    [self addSubview:self.contentLabel];
    [self addSubview:self.publishedLabel];
    
    [self.headimageView release];
    [self.nameLael release];
    [self.contentLabel release];
    [self.publishedLabel release];
    
}

- (void)calculateHeight
{
    ;
}



- (void)dealloc
{
    [_headimageView release];
    [_nameLael release];
    [_publishedLabel release];
    [_contentLabel release];
    [super dealloc];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
