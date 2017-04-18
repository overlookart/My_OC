//
//  RewardGoods.h
//  Game
//
//  Created by ledu on 17/4/13.
//  Copyright © 2017年 xzh. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "ArmsMode.h"
#import "ArmorMode.h"

@interface RewardGoods : SKSpriteNode

/**
 * 奖励的金币数量
 */
@property (nonatomic,assign,readonly) NSInteger gole;

@property (nonatomic,strong,readonly) NSArray *goods;

/**
 *  创建一个奖励物品的节点
 *  @param gole 金币数量
 *  @param arms 武器
 *  @param armor 护甲
 */
-(instancetype)initWithGold:(NSUInteger)gole arms:(ArmsMode *)arms armor:(ArmorMode *)armor;
@end
