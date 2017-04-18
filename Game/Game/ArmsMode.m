//
//  ArmsMode.m
//  Game
//
//  Created by ledu on 17/4/12.
//  Copyright © 2017年 xzh. All rights reserved.
//

#import "ArmsMode.h"

@implementation ArmsMode

-(instancetype)initWithLevel:(NSInteger)level name:(NSString *)name{
    if (self = [super init]) {
        _level = level;
        _attack = level*1;
        _name = name;
    }
    return self;
}

-(instancetype)init{
    if (self = [super init]) {
        
    }
    return self;
}

@end
