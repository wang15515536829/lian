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
#import "AppDelegate.h"
#import "WebViewController.h"

@interface MessageView : UIView<UITableViewDelegate, UITableViewDataSource, NetworkEngineDelegate, NetworkDelegate>



@property (nonatomic, retain) UIScrollView *myscrollView;
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *array;
@property (nonatomic, retain) NSMutableDictionary *dic;

@property (nonatomic, retain) EGOImageView *imageView;

@property (nonatomic, retain) Competition *competition;
@property (nonatomic, retain) Video *video;
@property (nonatomic, retain) Recreation *recreation;

@property (nonatomic , retain) NSMutableArray *imageurls;

@property (nonatomic, retain) UIView *vi;

@property (nonatomic, retain) NetworkEngine1 *engin1;
@property (nonatomic, retain) NetworkEngine1 *en;
@property (nonatomic, retain) NSMutableArray *enArray;

// web
@property (nonatomic, retain) UIWebView *webView;

@end
