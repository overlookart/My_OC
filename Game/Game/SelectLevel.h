//
//  SelectLevel.h
//  Game
//
//  Created by ledu on 17/4/11.
//  Copyright © 2017年 xzh. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "RoleInfoNode.h"
#import "LevelsNode.h"
#import "RoleMode.h"
#import "MenuNode.h"
@interface SelectLevel : SKScene
@property (nonatomic,strong) LevelsNode *levelsNode;
@property (nonatomic,strong) RoleInfoNode *roleInfoNode;
@property (nonatomic,strong) MenuNode *menuNode;


-(instancetype)initWithRole:(RoleMode *)role szie:(CGSize)size;

-(void)upDataInfoWithRole:(RoleMode *)role;
@end
