//
//  EnemyNode.h
//  Game
//
//  Created by ledu on 17/4/6.
//  Copyright © 2017年 xzh. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "EnemyMode.h"
#import "ArmsMode.h"
#import "ArmorMode.h"
typedef enum EnemyType{
    enemy_pig = 1, //野猪
    enemy_goblins, //哥布林
    enemy_snake,   //大蛇
    enemy_mermaid, //人鱼
    enemy_dragon,  //大龙
    enemy_scorpion,//蝎子
    enemy_crocodile,//鳄鱼
    enemy_pangolin,//穿山甲
    enemy_lizard,  //蜥蜴
    enemy_Bumblebee//大黄蜂
}EnemyType;


@protocol EnemyModeDelegate <NSObject>

/**
 *  敌人受到攻击后开始反击
 */
-(void)counterAttack;

/**
 *  敌人死亡
 */
-(void)death;

@end

@interface EnemyNode : SKSpriteNode

@property (nonatomic,weak) id<EnemyModeDelegate> delegate;

/**
 *  敌人的类型
 */
@property (nonatomic,assign) EnemyType enemyTyoe;

/**
 *  敌人的血量
 */
@property (nonatomic,assign,readonly) NSInteger HP;

/**
 * //血量上限
 */
@property (nonatomic,assign,readonly) NSInteger hpUpperLimit;

/**
 * 敌人的攻击
 */
@property (nonatomic,assign,readonly) NSInteger attack;


/**
 * 掉落的武器
 */
@property (nonatomic,strong,readonly) ArmsMode *arms;

/**
 * 掉落的护甲
 */
@property (nonatomic,strong,readonly) ArmorMode *armor;

/**
 * 掉落的金币
 */
@property (nonatomic,assign,readonly) NSInteger fallGold;

/**
 *  随机初始化一个敌人
 */
-(instancetype)initEnemyNodeWithMode:(EnemyMode *)enemyMode;

/**
 *  受到的攻击伤害
 *  @param injury 伤害值
 */
-(void)brokenInjury:(NSInteger)injury;

@end
