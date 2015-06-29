//
//  NetWork.h
//  啊；额合计拉客户呢；LKN
//
//  Created by lanouhn on 15/6/29.
//  Copyright (c) 2015年 lanouhn3g - 23 .com. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NetWork;

@protocol NetworkDelegate <NSObject>

@optional
// 请求成功时的代理协议
- (void)netWorkDid2FinishLoading:(NetWork *)engine withInfo:(NSData *)data;

// 开始请求时的代理协议
- (void)netWorkDid2StartLoading:(NetWork *)engine;

@end

@interface NetWork : NSObject

// 外界初始化网络请求的方法
+ (id)netWork2EngineWithURL:(NSURL *)url params:(NSDictionary *)params delegate:(id<NetworkDelegate>)delegate;

// 设置请求方式
- (void)setHTTPType:(NSString *)method;

// 启动网络请求
- (void)start;

@end
