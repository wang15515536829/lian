//
//  HeroData.h
//  LianMeng
//
//  Created by lanouhn on 15/6/29.
//  Copyright (c) 2015年 lanouhn3g - 23 .com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HeroData : NSObject

@property (nonatomic, retain) NSMutableArray *array;// 保存从网上获取的数据

+ (HeroData *)shareHeroData;// 类方法创建实例对象

// 根据key值获取数据
- (NSArray *)getData;

// 清空字典
- (void)removeAllObjectes;

@end
