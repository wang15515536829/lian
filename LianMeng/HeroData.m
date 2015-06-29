//
//  HeroData.m
//  LianMeng
//
//  Created by lanouhn on 15/6/29.
//  Copyright (c) 2015年 lanouhn3g - 23 .com. All rights reserved.
//

#import "HeroData.h"

// 该类单例对象的唯一指针
static HeroData *instance = nil;

@implementation HeroData

+ (HeroData *)shareHeroData
{
    if (nil == instance) {
        instance = [[HeroData alloc]init];
    }
    return instance;
}

- (instancetype)init
{
    if (self = [super init]) {
        self.array = [NSMutableArray array];
    }
    return self;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    if (nil == instance) {
        instance = [super allocWithZone:zone];
    }
    return instance;// 不管是第几次用这个方法，只会返回第一次生成的空间地址
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (id)copy
{
    return self;
}
- (instancetype)retain
{
    return self;
}

- (oneway void)release
{
    
}

- (instancetype)autorelease
{
    return self;
}

- (NSUInteger)retainCount
{
    return NSUIntegerMax;
}

- (NSArray *)getData
{
    return self.array;
}

- (void)removeAllObjectes
{
    [self.array removeAllObjects];
}

- (void)dealloc
{
    [_array release];
    [super dealloc];
}

@end
