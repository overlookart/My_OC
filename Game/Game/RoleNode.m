//
//  RoleNode.m
//  Game
//
//  Created by ledu on 17/4/13.
//  Copyright © 2017年 xzh. All rights reserved.
//

#import "RoleNode.h"

@interface RoleNode()
{
    SKSpriteNode *hpNode;
    SKLabelNode *hpLabel;
    SKLabelNode *attackLabel;
    SKLabelNode *showAttackLabel;
}
@end


@implementation RoleNode

-(instancetype)initWithRoleMode:(RoleMode *)role{
    if (self = [super init]) {
        self.name = @"RoleNode";
        _roleName = role.name;
        _hp = role.hp;
        _attack = role.attack;
        self.color = [UIColor cyanColor];
        self.size = CGSizeMake(100, 200);
        hpNode = [[SKSpriteNode alloc]initWithColor:[UIColor redColor] size:CGSizeMake(100, 10)];
        hpNode.position = CGPointMake(0, 95);
        [self addChild:hpNode];
        [self initHpLabelWithStr:[NSString stringWithFormat:@"血量:%d",role.hp]];
        [self initAttackLabelWithStr:[NSString stringWithFormat:@"攻击:%d",role.attack]];
        self.position = CGPointMake(50, [UIScreen mainScreen].bounds.size.height /2.0);
    }
    return self;
}

-(void)initHpLabelWithStr:(NSString *)str{
    hpLabel = [[SKLabelNode alloc]init];
    hpLabel.text = str;
    hpLabel.fontSize = 12.0;
    hpLabel.fontColor = [UIColor redColor];
    hpLabel.position = CGPointMake(0, 60);
    [self addChild:hpLabel];
}

-(void)initAttackLabelWithStr:(NSString *)str{
    attackLabel = [[SKLabelNode alloc]init];
    attackLabel.text = str;
    attackLabel.fontSize = 12.0;
    attackLabel.fontColor = [UIColor blackColor];
    attackLabel.position = CGPointMake(0, 40);
    [self addChild:attackLabel];
}

-(void)initShowAttackLabelWithStr:(NSString *)str{
    showAttackLabel = [SKLabelNode labelNodeWithText:str];
    showAttackLabel.fontSize = 24.0;
    showAttackLabel.fontName = @"Kohinoor Telugu";
    showAttackLabel.fontColor = [UIColor redColor];
    showAttackLabel.position = CGPointMake(0, 0);
    [self addChild:showAttackLabel];
}

-(void)brokenInjury:(NSInteger)injury{
    _hp = _hp-injury;
    if (_hp <=0) {
        _hp = 0;
    }
    hpLabel.text = [NSString stringWithFormat:@"血量:%d",self.hp];
    [self initShowAttackLabelWithStr:[NSString stringWithFormat:@"-%d",injury]];
    [showAttackLabel runAction:[SKAction sequence:@[[SKAction moveToY:180 duration:0.3],[SKAction scaleBy:0.3 duration:0.3],[SKAction removeFromParent]]]];
}
@end
