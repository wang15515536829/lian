//
//  ItemCell.h
//  LianMeng
//
//  Created by lanouhn on 15/6/26.
//  Copyright (c) 2015年 lanouhn3g - 23 .com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemCell : UITableViewCell

@property (nonatomic, retain) EGOImageView *headimageView;


@property (nonatomic, retain) UILabel *nameLael;
@property (nonatomic, retain) UILabel *contentLabel;
@property (nonatomic, retain) UILabel *publishedLabel;





// 计算cell高度
- (void)calculateHeight;


@end
