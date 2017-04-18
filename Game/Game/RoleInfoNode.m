//
//  RoleInfoNode.m
//  Game
//
//  Created by ledu on 17/4/12.
//  Copyright © 2017年 xzh. All rights reserved.
//

#import "RoleInfoNode.h"

@interface RoleInfoNode()
{
    SKLabelNode *roleName;
    SKLabelNode *roleGold;
    SKLabelNode *roleLevel;
}
@end

@implementation RoleInfoNode

-(instancetype)init{
    if (self = [super init]) {
        
    }
    return self;
}

-(instancetype)initWithRole:(RoleMode *)role{
    if (self = [super init]) {
        _myRole = role;
        self.size = CGSizeMake([UIScreen mainScreen].bounds.size.width, 30);
        self.color = [UIColor brownColor];
        [self initRoleNodeWithStr:role.name];
        [self initRoleGoldWithStr:[NSString stringWithFormat:@"%d",role.gold]];
        [self initRoleLevleWithStr:[NSString stringWithFormat:@"%d",role.level]];
        self.position = CGPointMake([UIScreen mainScreen].bounds.size.width/2.0, [UIScreen mainScreen].bounds.size.height - 15);
    }
    return self;
}

-(void)initRoleNodeWithStr:(NSString *)str{
    roleName = [[SKLabelNode alloc]init];
    roleName.text = str;
    [roleName setColor:[UIColor redColor]];
    roleName.fontSize = 14.0;
    roleName.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
    roleName.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
    roleName.position = CGPointMake(-[UIScreen mainScreen].bounds.size.width / 3.0, 0);
    [self addChild:roleName];
}

-(void)initRoleGoldWithStr:(NSString *)str{
    roleGold = [[SKLabelNode alloc]init];
    roleGold.text = [NSString stringWithFormat:@"金币:%@",str];;
    [roleGold setColor:[UIColor redColor]];
    roleGold.fontSize = 14.0;
    roleGold.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
    roleGold.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
    roleGold.position = CGPointMake(0, 0);
    [self addChild:roleGold];
}

-(void)initRoleLevleWithStr:(NSString *)str{
    roleLevel = [[SKLabelNode alloc]init];
    roleLevel.text = [NSString stringWithFormat:@"关卡:%@",str];
    [roleLevel setColor:[UIColor redColor]];
    roleLevel.fontSize = 14.0;
    roleLevel.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
    roleLevel.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
    roleLevel.position = CGPointMake([UIScreen mainScreen].bounds.size.width / 3.0, 0);
    [self addChild:roleLevel];
}

-(void)updataWithRole:(RoleMode *)role{
    _myRole = role;
    roleGold.text = [NSString stringWithFormat:@"金币:%d",role.gold];
    roleLevel.text = [NSString stringWithFormat:@"关卡:%d",role.level];
}
@end
