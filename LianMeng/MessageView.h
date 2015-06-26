//
//  MessageView.h
//  LianMeng
//
//  Created by lanouhn on 15/6/26.
//  Copyright (c) 2015年 lanouhn3g - 23 .com. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Competition.h"
#import "Video.h"
#import "Recreation.h"

@interface MessageView : UIView<UITableViewDelegate, UITableViewDataSource>



@property (nonatomic, retain) UIScrollView *myscrollView;
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *array;
@property (nonatomic, retain) NSMutableDictionary *dic;

@property (nonatomic, retain) Competition *competition;
@property (nonatomic, retain) Video *video;
@property (nonatomic, retain) Recreation *recreation;

@end
