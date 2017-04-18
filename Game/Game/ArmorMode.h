//
//  ArmorMode.h
//  Game
//
//  Created by ledu on 17/4/12.
//  Copyright © 2017年 xzh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArmorMode : NSObject

///护甲的名字
@property (nonatomic,strong,readonly) NSString *name;

///护甲的等级
@property (nonatomic,assign,readonly) NSInteger level;

///护甲加成的血量
@property (nonatomic,assign,readonly) NSInteger hp;

///创建一个有等级的护甲
-(instancetype)initWithLevel:(NSInteger)level name:(NSString *)name;
@end
