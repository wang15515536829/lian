//
//  Recreation.h
//  LianMeng
//
//  Created by lanouhn on 15/6/26.
//  Copyright (c) 2015年 lanouhn3g - 23 .com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Recreation : UIView<UITableViewDataSource, UITableViewDelegate, NetworkEngineDelegate>

@property (nonatomic, retain) UITableView *tableView1;

@property (nonatomic, retain) NSMutableArray *array;


@end
