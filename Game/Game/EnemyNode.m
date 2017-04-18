//
//  EnemyNode.m
//  Game
//
//  Created by ledu on 17/4/6.
//  Copyright © 2017年 xzh. All rights reserved.
//

#import "EnemyNode.h"

@interface EnemyNode()
{
    SKSpriteNode *hpNode;
    SKLabelNode *hpLabel;
    SKLabelNode *attackLabel;
    SKLabelNode *showAttackLabel;
}
@end

@implementation EnemyNode

-(instancetype)initEnemyNodeWithMode:(EnemyMode *)enemyMode{
//    self = [[EnemyNode alloc]initEnemyWithID:arc4random()%10];
    if (self = [super init]) {
        self.name = @"EnemyNode";
        _HP = enemyMode.hp;
        _hpUpperLimit = enemyMode.hp;
        _attack = enemyMode.attack;
        _arms = enemyMode.fallArms;
        _armor = enemyMode.fallArmor;
        _fallGold = enemyMode.fallGold;
        if(enemyMode.haveMoney){
            self.size = CGSizeMake([UIScreen mainScreen].bounds.size.width - 60, [UIScreen mainScreen].bounds.size.height / 3.0);
            self.position = CGPointMake([UIScreen mainScreen].bounds.size.width / 2.0, [UIScreen mainScreen].bounds.size.height / 2.0);
            SKLabelNode *armsLabel = [SKLabelNode labelNodeWithText:[NSString stringWithFormat:@"击杀可获得%d级武器",_arms.level]];
            armsLabel.fontSize = 17.0;
            armsLabel.fontColor = [UIColor blackColor];
            armsLabel.position = CGPointMake(0, 0);
            [self addChild:armsLabel];
        }else{
            self.size = CGSizeMake(100, 200);
            self.position = CGPointMake([UIScreen mainScreen].bounds.size.width - 50, [UIScreen mainScreen].bounds.size.height /2.0);
        }
        self.color = [UIColor yellowColor];
        hpNode = [[SKSpriteNode alloc]initWithColor:[UIColor redColor] size:CGSizeMake(self.size.width, 10)];
        hpNode.position = CGPointMake(0, 95);
        [self addChild:hpNode];
        
        [self initHpLabelWithStr:[NSString stringWithFormat:@"血量:%d",enemyMode.hp]];
        [self initAttackLabelWithStr:[NSString stringWithFormat:@"攻击:%d",enemyMode.attack]];
        
//        [self randomAction];
    }
    return self;
}


-(void)initHpLabelWithStr:(NSString *)str{
    hpLabel = [SKLabelNode labelNodeWithText:str];
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

-(instancetype)initEnemyWithID:(NSInteger)id{
    self = [super initWithTexture:[SKTexture textureWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"enemy_%d",id]]]];
    if(self){
        self.enemyTyoe = [self distinguishEnemyType:id];
    }
    return self;
}


-(void)brokenInjury:(NSInteger)injury{
    _HP = self.HP - injury;
    if (self.HP<=0) {
        _HP = 0;
        [self.delegate death];
        [self runAction:[SKAction removeFromParent]];
//        return;
    }
    hpLabel.text = [NSString stringWithFormat:@"血量:%d",_HP];
//    [self initHpLabelWithStr:];
    [self initShowAttackLabelWithStr:[NSString stringWithFormat:@"-%d",injury]];
    [showAttackLabel runAction:[SKAction sequence:@[[SKAction moveToY:180 duration:0.3],[SKAction scaleBy:0.3 duration:0.3],[SKAction removeFromParent]]] completion:^{
        [self.delegate counterAttack];
    }];
    
}

-(void)randomAction{
    if (self) {
        [self runAction:[SKAction animateWithTextures:@[[self enemyTextureWithId:arc4random()%10],
                                                        [self enemyTextureWithId:arc4random()%10],
                                                        [self enemyTextureWithId:arc4random()%10],
                                                        [self enemyTextureWithId:arc4random()%10],
                                                        [self enemyTextureWithId:arc4random()%10],
                                                        [self enemyTextureWithId:arc4random()%10],
                                                        [self enemyTextureWithId:arc4random()%10],
                                                        [self enemyTextureWithId:arc4random()%10],
                                                        [self enemyTextureWithId:arc4random()%10],
                                                        [self enemyTextureWithId:arc4random()%10],
                                                        ] timePerFrame:0.1]];
    }
}

-(void)deathAction{
    [self runAction:[SKAction rotateToAngle:0.5 duration:1.5]];
}


///辨别敌人的类型
-(EnemyType)distinguishEnemyType:(NSInteger)tp{
    switch (tp) {
        case 1:
            return enemy_pig;
            break;
            case 2:
            return enemy_goblins;
            break;
            case 3:
            return enemy_snake;
            break;
            case 4:
            return enemy_mermaid;
            break;
            case 5:
            return enemy_dragon;
            break;
            case 6:
            return enemy_scorpion;
            break;
            case 7:
            return enemy_crocodile;
            break;
            case 8:
            return enemy_pangolin;
            break;
            case 9:
            return enemy_lizard;
            break;
            case 10:
            return enemy_Bumblebee;
            break;
        default:
            return enemy_pig;
            break;
    }
}

-(SKTexture *)enemyTextureWithId:(NSInteger)id{
    SKTexture *enemyTexture = [SKTexture textureWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"enemy_%ld",id+1]]];
    return enemyTexture;
}

@end
