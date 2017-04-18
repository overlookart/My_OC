//
//  EnemyMode.h
//  Game
//
//  Created by ledu on 17/4/12.
//  Copyright © 2017年 xzh. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ArmsMode.h"
#import "ArmorMode.h"

@interface EnemyMode : NSObject

/**
 * 敌人的名称
 */
@property (nonatomic,strong) NSString *name;

/**
 * 敌人的等级
 */
@property (nonatomic,assign) NSInteger level;

/**
 * 敌人的血量
 */
@property (nonatomic,assign,readonly) NSInteger hp;

/**
 * 敌人的攻击
 */
@property (nonatomic,assign,readonly) NSInteger attack;

/**
 * 是否为BOSS
 */
@property (nonatomic,assign,readonly) BOOL isBOSS;

/**
 * 是否用钱炸的敌人
 */
@property (nonatomic,assign,readonly) BOOL haveMoney;

/**
 * 掉落的武器
 */
@property (nonatomic,strong,readonly) ArmsMode *fallArms;

/**
 * 掉落的护甲
 */
@property (nonatomic,strong,readonly) ArmorMode *fallArmor;

/**
 * 掉落金币
 */
@property (nonatomic,assign,readonly) NSInteger fallGold;

/**
 *  创建一个敌人的数据模型
 *  @param name 敌人的名称
 *  @param level 敌人的等级
 */
-(instancetype)initWithName:(NSString *)name level:(NSInteger)level isBoss:(BOOL)isBoss isHaveMoney:(BOOL)haveMoney;

/**
 *  根据等级更新敌人的属性
 *  @param level 敌人的等级
 */
-(void)upDataForlevel:(NSInteger)level;
@end
