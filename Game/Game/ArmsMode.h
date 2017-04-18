//
//  ArmsMode.h
//  Game
//
//  Created by ledu on 17/4/12.
//  Copyright © 2017年 xzh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArmsMode : NSObject

///武器的名称
@property (nonatomic,strong,readonly) NSString *name;

///武器的等级
@property (nonatomic,assign,readonly) NSInteger level;

///武器的加成攻击值
@property (nonatomic,assign,readonly) NSInteger attack;

///创建一个有等级的武器
-(instancetype)initWithLevel:(NSInteger)level name:(NSString *)name;
@end
