//
//  RoleInfoNode.h
//  Game
//
//  Created by ledu on 17/4/12.
//  Copyright © 2017年 xzh. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "RoleMode.h"
@interface RoleInfoNode : SKSpriteNode

@property (nonatomic,strong,readonly) RoleMode* myRole;

///根据角色信息创建一个显示角色基本信息的节点
-(instancetype)initWithRole:(RoleMode *)role;

///更新角色的基本信息
-(void)updataWithRole:(RoleMode *)role;
@end
