//
//  LevelsNode.h
//  Game
//
//  Created by ledu on 17/4/12.
//  Copyright © 2017年 xzh. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "RoleMode.h"
@interface LevelsNode : SKSpriteNode

///可开启的关卡
@property (nonatomic,assign) NSInteger openLevel;

///所有关卡
@property (nonatomic,strong) NSMutableArray *levels;

-(instancetype)initWithRole:(RoleMode *)role;

///更新关卡状态
-(void)updataLevelStateForRole:(RoleMode *)role;
@end
