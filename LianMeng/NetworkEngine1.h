//
//  NetworkEngine1.h
//  LianMeng
//
//  Created by lanouhn on 15/6/26.
//  Copyright (c) 2015年 lanouhn3g - 23 .com. All rights reserved.
//

#import <Foundation/Foundation.h>
@class NetworkEngine1;
@protocol NetworkEngineDelegate <NSObject>

@optional
// 请求成功时的代理协议
- (void)netWorkDidFinishLoading:(NetworkEngine1 *)engine withInfo:(NSData *)data;

// 开始请求时的代理协议
- (void)netWorkDidStartLoading:(NetworkEngine1 *)engine;

@end



@interface NetworkEngine1 : NSObject

// 外界初始化网络请求的方法
+ (id)netWorkEngineWithURL:(NSURL *)url params:(NSDictionary *)params delegate:(id<NetworkEngineDelegate>)delegate;

// 设置请求方式
- (void)setHTTPType:(NSString *)method;

// 启动网络请求
- (void)start;

@end
