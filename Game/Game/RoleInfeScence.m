//
//  RoleInfeScence.m
//  Game
//
//  Created by ledu on 17/4/14.
//  Copyright © 2017年 xzh. All rights reserved.
//

#import "RoleInfeScence.h"
#import "RoleInfoNode.h"
#import "MenuNode.h"
@interface RoleInfeScence(){
    
    RoleInfoNode *roleInfeNode;
    SKSpriteNode *titleLabelNode;
    SKSpriteNode *roleNode;
    SKSpriteNode *armsNode;
    SKSpriteNode *armorNode;
    SKSpriteNode *showHpNode;
    SKSpriteNode *showAttackNode;
    MenuNode *menuNode;
    SKScene *mySelect;
    SKScene *myMain;
    RoleMode *myRole;
}
@end

@implementation RoleInfeScence

-(instancetype)initWithRoleMode:(RoleMode *)role select:(SKScene *)select main:(SKScene *)main{
    
    if (self = [super init]) {
        self.size = [UIScreen mainScreen].bounds.size;
        roleInfeNode = [[RoleInfoNode alloc]initWithRole:role];
        [self addChild:roleInfeNode];
        [self initTitleLabelNode];
        [self initRoleNode];
        [self initArmsNode];
        [self initArmorNode];
        [self initShowHpNodeWithStr:[NSString stringWithFormat:@"血量:%d",role.hp]];
        [self initShowAttackNodeWithStr:[NSString stringWithFormat:@"攻击:%d",role.attack]];
        [self initMenuNode];
        mySelect = select;
        myMain = main;
        myRole = role;
    }
    return self;
}

-(void)initTitleLabelNode{
    titleLabelNode = [[SKSpriteNode alloc]initWithColor:[UIColor yellowColor] size:CGSizeMake([UIScreen mainScreen].bounds.size.width, 60)];
    titleLabelNode.position = CGPointMake([UIScreen mainScreen].bounds.size.width/2.0, [UIScreen mainScreen].bounds.size.height - 60);
    SKLabelNode *titleLabel = [SKLabelNode labelNodeWithText:@"人物属性和装备"];
    titleLabel.position = CGPointMake(0, 0);
    titleLabel.fontColor = [UIColor blackColor];
    [titleLabelNode addChild:titleLabel];
    [self addChild:titleLabelNode];
}


-(void)initRoleNode{
    roleNode = [[SKSpriteNode alloc]initWithColor:[UIColor brownColor] size:CGSizeMake(100, 200)];
    roleNode.position = CGPointMake([UIScreen mainScreen].bounds.size.width / 2.0, [UIScreen mainScreen].bounds.size.height / 2.0);
    [self addChild:roleNode];
}

-(void)initArmsNode{
    armsNode = [[SKSpriteNode alloc]initWithColor:[UIColor redColor] size:CGSizeMake(100, 100)];
    armsNode.position = CGPointMake([UIScreen mainScreen].bounds.size.width / 2.0 - 120, [UIScreen mainScreen].bounds.size.height / 2.0);
    [self addChild:armsNode];
}

-(void)initArmorNode{
    armorNode = [[SKSpriteNode alloc]initWithColor:[UIColor blueColor] size:CGSizeMake(100, 100)];
    armorNode.position = CGPointMake([UIScreen mainScreen].bounds.size.width / 2.0 + 120, [UIScreen mainScreen].bounds.size.height / 2.0);
    [self addChild:armorNode];
}

-(void)initShowHpNodeWithStr:(NSString *)str{
    showHpNode = [[SKSpriteNode alloc]initWithColor:[UIColor greenColor] size:CGSizeMake(150, 30)];
    showHpNode.position = CGPointMake([UIScreen mainScreen].bounds.size.width / 2.0, [UIScreen mainScreen].bounds.size.height / 2.0 - 135);
    SKLabelNode *hpLabel = [SKLabelNode labelNodeWithText:str];
    hpLabel.fontColor = [UIColor blackColor];
    hpLabel.fontSize = 17.0;
    hpLabel.position = CGPointMake(0, 0);
    hpLabel.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
    [showHpNode addChild:hpLabel];
    [self addChild:showHpNode];
}

-(void)initShowAttackNodeWithStr:(NSString *)str{
    showAttackNode = [[SKSpriteNode alloc]initWithColor:[UIColor greenColor] size:CGSizeMake(150, 30)];
    showAttackNode.position = CGPointMake([UIScreen mainScreen].bounds.size.width / 2.0, [UIScreen mainScreen].bounds.size.height / 2.0 - 170);
    SKLabelNode *attackLabel = [SKLabelNode labelNodeWithText:str];
    attackLabel.fontColor = [UIColor blackColor];
    attackLabel.fontSize = 17.0;
    attackLabel.position = CGPointMake(0, 0);
    attackLabel.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
    [showAttackNode addChild:attackLabel];
    [self addChild:showAttackNode];
}

-(void)initMenuNode{
    menuNode = [[MenuNode alloc]init];
    [self addChild:menuNode];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint prevLocation = [touch previousLocationInNode:self];
    SKSpriteNode *node = (SKSpriteNode *)[self nodeAtPoint:prevLocation];
    if ([node.name isEqualToString:@"闯关"]) {
        [self.myDelegate presentScenceSelectLevel];
        [self.view presentScene:mySelect];
    }
    else if ([node.name isEqualToString:@"全民BOSS"]){
        if (myRole.challengeBoss >0) {
            [self.myDelegate presentSceneToMainWithType:1];
            [self.view presentScene:myMain];
        }else{
            UIAlertView *myAlert = [[UIAlertView alloc]initWithTitle:@"系统:全民BOSS" message:@"您的挑战BOSS次数已用完,请继续闯关获得挑战BOSS次数" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [myAlert show];
        }
    }else if ([node.name isEqualToString:@"有钱任性"]){
        if (myRole.gold >= myRole.haveMoneyLevel*50) {
            [self.myDelegate presentSceneToMainWithType:2];
            [self.view presentScene:myMain];
        }else{
            UIAlertView *myAlert = [[UIAlertView alloc]initWithTitle:@"系统:有钱任性" message:@"您的余额不足,请通过其他玩法获得金币" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [myAlert show];
        }
        
    }
   
}

@end
