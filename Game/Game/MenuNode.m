//
//  MenuNode.m
//  Game
//
//  Created by ledu on 17/4/14.
//  Copyright © 2017年 xzh. All rights reserved.
//

#import "MenuNode.h"

@interface MenuNode(){
    SKSpriteNode *ordinary;       //普通闯关模式
    SKSpriteNode *BOSS;           //全名BOSS模式
    SKSpriteNode *equipment;      //角色的所有信息
    SKSpriteNode *Money;          //有钱任性模式
   
}
@end

@implementation MenuNode

-(instancetype)init{
    if (self = [super init]) {
        self.color = [UIColor redColor];
        self.size = CGSizeMake([UIScreen mainScreen].bounds.size.width, 60);
        self.position = CGPointMake([UIScreen mainScreen].bounds.size.width / 2.0, 30);
        [self initOrdinary];
        [self initBOSS];
        [self initEquipment];
        [self initMoney];
    }
    return self;
}

-(void)initOrdinary{
    ordinary = [[SKSpriteNode alloc]initWithColor:[UIColor greenColor] size:CGSizeMake([UIScreen mainScreen].bounds.size.width / 5.0, 60)];
    ordinary.position = CGPointMake(-[UIScreen mainScreen].bounds.size.width/8.0*3, 0);
    SKLabelNode *ordinaryLabel = [SKLabelNode labelNodeWithText:@"闯关"];
    ordinaryLabel.name = ordinaryLabel.text;
    ordinaryLabel.fontColor = [UIColor blackColor];
    ordinaryLabel.position = CGPointMake(0, 0);
    ordinaryLabel.fontSize = 17.0;
    [ordinary addChild:ordinaryLabel];
    [self addChild:ordinary];
}

-(void)initBOSS{
    BOSS = [[SKSpriteNode alloc]initWithColor:[UIColor greenColor] size:CGSizeMake([UIScreen mainScreen].bounds.size.width / 5.0, 60)];
    BOSS.position = CGPointMake(-[UIScreen mainScreen].bounds.size.width/8.0*1, 0);
    SKLabelNode *BOSSLabel = [SKLabelNode labelNodeWithText:@"全民BOSS"];
    BOSSLabel.name = BOSSLabel.text;
    BOSSLabel.fontColor = [UIColor blackColor];
    BOSSLabel.position = CGPointMake(0, 0);
    BOSSLabel.fontSize = 17.0;
    [BOSS addChild:BOSSLabel];
    [self addChild:BOSS];
}

-(void)initEquipment{
    equipment = [[SKSpriteNode alloc]initWithColor:[UIColor greenColor] size:CGSizeMake([UIScreen mainScreen].bounds.size.width / 5.0, 60)];
    equipment.position = CGPointMake([UIScreen mainScreen].bounds.size.width/8.0*1, 0);
    SKLabelNode *equipmentLabel = [SKLabelNode labelNodeWithText:@"装备"];
    equipmentLabel.name = equipmentLabel.text;
    equipmentLabel.fontColor = [UIColor blackColor];
    equipmentLabel.position = CGPointMake(0, 0);
    equipmentLabel.fontSize = 17.0;
    [equipment addChild:equipmentLabel];
    [self addChild:equipment];
}

-(void)initMoney{
    Money = [[SKSpriteNode alloc]initWithColor:[UIColor greenColor] size:CGSizeMake([UIScreen mainScreen].bounds.size.width / 5.0, 60)];
    Money.position = CGPointMake([UIScreen mainScreen].bounds.size.width/8.0*3, 0);
    SKLabelNode *moneyLable = [SKLabelNode labelNodeWithText:@"有钱任性"];
    moneyLable.name = moneyLable.text;
    moneyLable.fontColor = [UIColor blackColor];
    moneyLable.position = CGPointMake(0, 0);
    moneyLable.fontSize = 17.0;
    [Money addChild:moneyLable];
    [self addChild:Money];
}


@end
