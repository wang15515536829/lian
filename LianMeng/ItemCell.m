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

#define kHeadImageHeidght 70
#define kHeadImageWidgth 80

#define kNameLableH 30
#define kNameLabelW 240

#define kContentLabelH 40
#define kContentLabelW 240

#define kPudlishLabelX 195
#define kPudlishLabelH 20
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
    self.contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(kInspace * 2 + kHeadImageWidgth, kInspace + kNameLableH, kContentLabelW, kContentLabelH)];
    self.publishedLabel = [[UILabel alloc] initWithFrame:CGRectMake(kPudlishLabelX , self.contentLabel.frame.size.height + kContentLabelH + kInspace, kPudlishLabelW, kPudlishLabelH)];
    
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
