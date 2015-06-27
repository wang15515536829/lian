//
//  ItemModel.h
//  LianMeng
//
//  Created by lanouhn on 15/6/26.
//  Copyright (c) 2015年 lanouhn3g - 23 .com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemModel : NSObject

@property (nonatomic, retain) NSString *image;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *summary;
@property (nonatomic, retain) NSString *insert;
@property (nonatomic, retain) NSString *article_id;
@property (nonatomic, retain) NSString *channel_desc;

- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end
