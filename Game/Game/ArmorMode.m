//
//  ArmorMode.m
//  Game
//
//  Created by ledu on 17/4/12.
//  Copyright © 2017年 xzh. All rights reserved.
//

#import "ArmorMode.h"

@implementation ArmorMode

-(instancetype)initWithLevel:(NSInteger)level name:(NSString *)name{
    if (self = [super init]) {
        _name = name;
        _level = level;
        _hp = level*1;
    }
    return self;
}

@end
