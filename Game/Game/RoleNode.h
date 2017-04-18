//
//  RoleNode.h
//  Game
//
//  Created by ledu on 17/4/13.
//  Copyright © 2017年 xzh. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "RoleMode.h"
@interface RoleNode : SKSpriteNode

/**
 * 角色的名称
 */
@property (nonatomic,strong,readonly) NSString *roleName;

/**
 * 角色的血量
 */
@property (nonatomic,assign,readonly) NSInteger hp;

/**
 * 角色的攻击
 */
@property (nonatomic,assign,readonly) NSInteger attack;

/**
 *  根据数据模型创建一个角色节点
 *  @param role 数据模型
 */
-(instancetype)initWithRoleMode:(RoleMode *)role;

/**
 *  受到的攻击伤害
 *  @param injury 伤害值
 */
-(void)brokenInjury:(NSInteger)injury;
@end
