//
//  ItemModel.m
//  LianMeng
//
//  Created by lanouhn on 15/6/26.
//  Copyright (c) 2015年 lanouhn3g - 23 .com. All rights reserved.
//

#import "ItemModel.h"

@implementation ItemModel

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        if (![dic isKindOfClass:[NSNull class]]) {
            self.image = dic[@"image_url_big"];
            self.title = dic[@"title"];
            self.summary = dic[@"summary"];
            self.insert = dic[@"insert_date"];
        }
    }
    return self;
    
}

- (void)dealloc
{
    _image = nil;
    _title = nil;
    _summary = nil;
    _insert = nil;
    [super dealloc];
}


@end
