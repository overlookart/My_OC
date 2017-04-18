//
//  MainScence.m
//  Game
//
//  Created by ledu on 17/2/19.
//  Copyright © 2017年 xzh. All rights reserved.
//

#import "MainScence.h"
#import "EnemyNode.h"
#import "RoleInfoNode.h"
#import "RoleNode.h"
#import "EnemyMode.h"
#import "RewardGoods.h"

@interface MainScence()<EnemyModeDelegate>{
    SKSpriteNode *backgroundNode;  //背景节点
    RoleInfoNode *roleInfoNode;    //角色基本信息节点
    EnemyNode *enemyNode;          //敌人节点
    RoleNode *roleNode;            //角色节点
    SKLabelNode *hurt;             //伤害值显示
    SelectLevel *mySelectLevel;
    RewardGoods *rewardGoods;      //掉落物品节点
    levelType currentType;        //当前的战斗模式
    SKSpriteNode *levelShowMode;   //关卡显示模式节点
    SKLabelNode *levelModeLabel;
    
    SKSpriteNode *consumptionGold; //消耗金币
    SKSpriteNode *remainingGold;   //剩余金币
    SKLabelNode *remainingGoldLabel;
}
@end

@implementation MainScence

-(instancetype)initWithEnemyMode:(EnemyMode *)enemyMode roleMode:(RoleMode *)roleMode selectLevel:(SelectLevel *)selectLevel{
    if (self = [self initWithSize:[UIScreen mainScreen].bounds.size]) {
        self.level = roleMode.level;
        backgroundNode = [SKSpriteNode spriteNodeWithImageNamed:@"main_bg"];
        backgroundNode.position = CGPointMake(self.frame.size.width / 2.0, self.frame.size.height / 2.0);
        [self addChild:backgroundNode];
        roleInfoNode = [[RoleInfoNode alloc]initWithRole:roleMode];
        [self addChild:roleInfoNode];
        mySelectLevel = selectLevel;
        [self initLevelShowMode];
    }
    return self;
}

-(instancetype)initWithSize:(CGSize)size{
    self = [super initWithSize:size];
    if (self) {
    }
    return self;
}


-(void)createNodesWithEnemy:(EnemyMode *)enemy role:(RoleMode *)role{
    
    [roleInfoNode updataWithRole:role];
    roleNode = [[RoleNode alloc]initWithRoleMode:role];
    [self addChild:roleNode];
    
    enemyNode = [[EnemyNode alloc]initEnemyNodeWithMode:enemy];
    enemyNode.delegate = self;
    [self addChild:enemyNode];
}

-(void)initLevelShowMode{
    levelShowMode = [[SKSpriteNode alloc]initWithColor:[UIColor greenColor] size:CGSizeMake([UIScreen mainScreen].bounds.size.width/2.0-50, 50)];
    levelShowMode.position = CGPointMake([UIScreen mainScreen].bounds.size.width - levelShowMode.size.width + levelShowMode.size.width / 2.0, [UIScreen mainScreen].bounds.size.height - 55);
    
    levelModeLabel = [SKLabelNode labelNodeWithText:@""];
    levelModeLabel.fontSize = 17.0;
    levelModeLabel.fontColor = [UIColor blackColor];
    levelModeLabel.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
    levelModeLabel.position = CGPointMake(0, 0);
    [levelShowMode addChild:levelModeLabel];
    [self addChild:levelShowMode];
}


-(void)cut{
//    [heroNode runAction:[SKAction animateWithTextures:@[[SKTexture textureWithImage:[UIImage imageNamed:@"hero_1"]],[SKTexture textureWithImage:[UIImage imageNamed:@"hero_2"]],[SKTexture textureWithImage:[UIImage imageNamed:@"hero_3"]],[SKTexture textureWithImage:[UIImage imageNamed:@"hero_1"]]] timePerFrame:0.1]];
    hurt = [SKLabelNode labelNodeWithText:@""];
    hurt.fontColor = [UIColor redColor];
    hurt.position = CGPointMake(30, 70);
    [hurt setFontName:@"Kohinoor Telugu"];

//    NSLog(@"%@",[UIFont familyNames]);
    [backgroundNode addChild:hurt];
    [hurt setText:@"-10"];
    [hurt runAction:[SKAction sequence:@[[SKAction moveToY:180 duration:0.3],[SKAction scaleBy:0.3 duration:0.3],[SKAction removeFromParent]]]];
}






-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint prevLocation = [touch previousLocationInNode:self];
    SKSpriteNode *node = (SKSpriteNode *)[self nodeAtPoint:prevLocation];
    if ([node.name isEqualToString:enemyNode.name]) {
        if(currentType == level_havemoney){
            [enemyNode brokenInjury:enemyNode.hpUpperLimit/10];
            [self.myDelegate consumptionGold:enemyNode.hpUpperLimit/10];
        }else{
            [enemyNode brokenInjury:roleNode.attack];
        }
        
    }else if ([node.name isEqualToString:@"GetGoods"]){
        NSLog(@"角色已经获得奖励");
        [roleNode runAction:[SKAction removeFromParent]];
        if (currentType == level_ordinary) {
            [self.myDelegate challengeSuccess:rewardGoods.gole :rewardGoods.goods :self.level+1 isBoss:NO isHaveMoney:NO];
            [self.view presentScene:mySelectLevel];
        }else if (currentType == level_allpeopleBOSS){
            [self.myDelegate challengeSuccess:rewardGoods.gole :rewardGoods.goods :self.level isBoss:YES isHaveMoney:NO];
            if (roleInfoNode.myRole.challengeBoss>0) {
                //继续挑战下一个BOSS
                [self updataMainScenceWithRole:roleInfoNode.myRole type:level_allpeopleBOSS];
            }else{
                NSLog(@"系统:大侠 %@ 的挑战BOSS次数已用完,请继续闯关获得挑战BOSS次数",roleInfoNode.myRole.name);
                UIAlertView *myAlert = [[UIAlertView alloc]initWithTitle:@"系统:全民BOSS" message:@"您的挑战BOSS次数已用完,不能继续挑战,请继续闯关获得挑战BOSS次数" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [myAlert show];
                [self.view presentScene:mySelectLevel];
            }
        }else if (currentType == level_havemoney){
            [self.myDelegate challengeSuccess:rewardGoods.gole :rewardGoods.goods :self.level isBoss:NO isHaveMoney:YES];
            [consumptionGold runAction:[SKAction removeFromParent]];
            [remainingGold runAction:[SKAction removeFromParent]];
            if (roleInfoNode.myRole.gold>=roleInfoNode.myRole.haveMoneyLevel*50) {
                //进行下一关的挑战
                [self updataMainScenceWithRole:roleInfoNode.myRole type:level_havemoney];
            }else{
                NSLog(@"系统:您的余额不足,请通过其他玩法获得金币");
                UIAlertView *myAlert = [[UIAlertView alloc]initWithTitle:@"系统:有钱任性" message:@"您的余额不足,不能继续挑战,请通过其他玩法获得金币" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [myAlert show];
                mySelectLevel.levelsNode.hidden = NO;
                [self.view presentScene:mySelectLevel];
                
            }
        }
        
         [rewardGoods runAction:[SKAction removeFromParent]];
    }
}

-(void)counterAttack{
    [roleNode brokenInjury:enemyNode.attack];
}

-(void)death{
    NSLog(@"敌人已经死亡");
    NSLog(@"要出现掉落物品");
    rewardGoods = [[RewardGoods alloc]initWithGold:enemyNode.fallGold arms:enemyNode.arms armor:enemyNode.armor];
    [self addChild:rewardGoods];
     [enemyNode runAction:[SKAction removeFromParent]];
}

-(void)updataMainScenceWithRole:(RoleMode *)role type:(levelType)levelType{
     [roleInfoNode updataWithRole:role];
    self.level = role.level;
    if (levelType == level_ordinary) {
        //普通闯关模式
        [self ordinaryModeWithRole:role];
    }else if (levelType == level_allpeopleBOSS){
        //全民BOSS模式
        [self allpeopleBOSSModeWithRole:role];
    }else if (levelType == level_havemoney){
        //有钱任性模式
        [self havemoneyModeWithRole:role];
    }
}



-(void)ordinaryModeWithRole:(RoleMode *)role {
    currentType = level_ordinary;
    [self createNodesWithEnemy:[[EnemyMode alloc]initWithName:@"aa" level:role.level isBoss:NO isHaveMoney:NO] role:role];
    levelModeLabel.text = [NSString stringWithFormat:@"闯关:第%d关",self.level];
}

-(void)allpeopleBOSSModeWithRole:(RoleMode *)role{
    currentType = level_allpeopleBOSS;
    [self createNodesWithEnemy:[[EnemyMode alloc]initWithName:@"aa" level:(role.level/10 - (role.challengeBoss - 1))*10 isBoss:YES isHaveMoney:NO] role:role];
    levelModeLabel.text = [NSString stringWithFormat:@"BOSS:%d",role.level/10 - (role.challengeBoss - 1)];
}

-(void)havemoneyModeWithRole:(RoleMode *)role{
    currentType = level_havemoney;
    EnemyMode *moneyEnemy = [[EnemyMode alloc]initWithName:@"aa" level:role.haveMoneyLevel isBoss:NO isHaveMoney:YES];
    levelModeLabel.text = [NSString stringWithFormat:@"有钱:第%d关",role.haveMoneyLevel];
    enemyNode = [[EnemyNode alloc]initEnemyNodeWithMode:moneyEnemy];
    enemyNode.delegate =self;
    [self addChild:enemyNode];
    consumptionGold = [[SKSpriteNode alloc]initWithColor:[UIColor magentaColor] size:CGSizeMake([UIScreen mainScreen].bounds.size.width / 2.0 - 30, 60)];
    consumptionGold.position = CGPointMake(consumptionGold.size.width / 2.0+15, 120);
    SKLabelNode *consumptionGoldLabel = [SKLabelNode labelNodeWithText:[NSString stringWithFormat:@"每次消耗金币:%d",enemyNode.HP/10]];
    consumptionGoldLabel.fontColor = [UIColor blackColor];
    consumptionGoldLabel.fontSize = 17.0;
    consumptionGoldLabel.position = CGPointMake(0, 0);
    [consumptionGold addChild:consumptionGoldLabel];
    [self addChild:consumptionGold];
    
    remainingGold = [[SKSpriteNode alloc]initWithColor:[UIColor cyanColor] size:CGSizeMake([UIScreen mainScreen].bounds.size.width / 2.0 - 30, 60)];
    remainingGold.position = CGPointMake([UIScreen mainScreen].bounds.size.width / 2.0 + remainingGold.size.width / 2.0+15, 120);
    remainingGoldLabel = [SKLabelNode labelNodeWithText:[NSString stringWithFormat:@"剩余金币:%d",role.gold]];
    remainingGoldLabel.fontColor = [UIColor blackColor];
    remainingGoldLabel.fontSize = 17.0;
    remainingGoldLabel.position = CGPointMake(0, 0);
    [remainingGold addChild:remainingGoldLabel];
    [self addChild:remainingGold];
}

-(void)updataHaveMoneyWith:(RoleMode *)role{
    [roleInfoNode updataWithRole:role];
    remainingGoldLabel.text = [NSString stringWithFormat:@"剩余金币:%d",role.gold];
}

@end
