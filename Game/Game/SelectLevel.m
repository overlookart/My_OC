//
//  SelectLevel.m
//  Game
//
//  Created by ledu on 17/4/11.
//  Copyright © 2017年 xzh. All rights reserved.
//

#import "SelectLevel.h"
#import "MainScence.h"
#import "RoleInfeScence.h"

@interface SelectLevel()<MainScenceDelegate,RoleInfeScenceDelegate>
{
    MainScence *mainScence;
    RoleMode *roleMode;
    RoleInfeScence *roleInfoScence;
}
@end

@implementation SelectLevel

-(instancetype)initWithRole:(RoleMode *)role szie:(CGSize)size{
    if (self = [super initWithSize:size]) {
        [self initHeroInfoNodeWithRole:role];
        [self initLevelsNodeWithRole:role];
       
        mainScence = [[MainScence alloc]initWithEnemyMode:nil roleMode:role selectLevel:self];
        mainScence.myDelegate = self;
        roleMode = role;
        [self initMenuNode];
        roleInfoScence = [[RoleInfeScence alloc]initWithRoleMode:role select:self main:mainScence];
        roleInfoScence.myDelegate = self;
    }
    return self;
}
-(instancetype)initWithSize:(CGSize)size{
    self = [super initWithSize:size];
    if (self) {
        
        
    }
    return self;
}

-(void)initLevelsNodeWithRole:(RoleMode *)role{
    self.levelsNode = [[LevelsNode alloc]initWithRole:role];
    self.levelsNode.position = CGPointMake(self.size.width/2.0, 500+60);
    self.levelsNode.color = [UIColor blueColor];
    [self addChild:self.levelsNode];
}

-(void)initHeroInfoNodeWithRole:(RoleMode *)role{
    self.roleInfoNode = [[RoleInfoNode alloc]initWithRole:role];
    [self addChild:self.roleInfoNode];
}

-(void)initMenuNode{
    self.menuNode = [[MenuNode alloc]init];
    [self addChild:self.menuNode];
}

-(void)upDataInfoWithRole:(RoleMode *)role{
    [self initHeroInfoNodeWithRole:role];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [mainScence touchesBegan:touches withEvent:event];
    [roleInfoScence touchesBegan:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    CGPoint prevLocation = [touch previousLocationInNode:self];
    SKSpriteNode *node = (SKSpriteNode *)[self nodeAtPoint:prevLocation];
    if ([node.name isEqualToString:[NSString stringWithFormat:@"open%d",self.levelsNode.openLevel]]) {
        node.hidden = YES;
        [mainScence updataMainScenceWithRole:roleMode type:level_ordinary];
        [self.view presentScene:mainScence];
    }else if ([node.name isEqualToString:@"装备"]){
        self.levelsNode.hidden = YES;
        [self.view presentScene:roleInfoScence];
    }else if ([node.name isEqualToString:@"全民BOSS"]){
        if(roleMode.challengeBoss > 0){
            [mainScence updataMainScenceWithRole:roleMode type:level_allpeopleBOSS];
            [self.view presentScene:mainScence];
        }else{
            NSLog(@"系统:大侠 %@ 的挑战BOSS次数已用完,请继续闯关获得挑战BOSS次数",roleMode.name);
            UIAlertView *myAlert = [[UIAlertView alloc]initWithTitle:@"系统:全民BOSS" message:@"您的挑战BOSS次数已用完,请继续闯关获得挑战BOSS次数" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [myAlert show];
        }
    }else if([node.name isEqualToString:@"有钱任性"]){
        if (roleMode.level>=6) {
            if (roleMode.gold>=roleMode.haveMoneyLevel*50) {
                [mainScence updataMainScenceWithRole:roleMode type:level_havemoney];
                self.levelsNode.hidden = YES;
                [self.view presentScene:mainScence];
            }else{
                NSLog(@"系统:您的余额不足,请通过其他玩法获得金币");
                UIAlertView *myAlert = [[UIAlertView alloc]initWithTitle:@"系统:有钱任性" message:@"您的余额不足,请通过其他玩法获得金币" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [myAlert show];
            }
        }else{
            NSLog(@"系统:大侠 %@ 没有权限开启有钱任性玩法,请继续闯关获得有钱任性权限",roleMode.name);
            UIAlertView *myAlert = [[UIAlertView alloc]initWithTitle:@"系统:有钱任性" message:@"没有权限开启有钱任性玩法,请继续闯关获得有钱任性权限" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [myAlert show];
        }
        
    }
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    CGPoint prevLocation = [touch previousLocationInNode:self];
    float offsetY = location.y - prevLocation.y;
    SKSpriteNode *node = (SKSpriteNode *)[self nodeAtPoint:location];
    if ([node.name isEqualToString:self.levelsNode.name]) {
        if (self.levelsNode.position.y+offsetY >500+60) {
            [self.levelsNode runAction:[SKAction moveToY:500+60 duration:0.3]];
        }else if (self.levelsNode.position.y+offsetY <40){
            [self.levelsNode runAction:[SKAction moveToY:40 duration:0.3]];
        }else{
            [self.levelsNode runAction:[SKAction moveByX:0 y:offsetY duration:0.1]];
        }
    }
}

-(void)challengeSuccess:(NSUInteger)gole :(NSArray *)goods :(NSInteger)level isBoss:(BOOL)isBOSS isHaveMoney:(BOOL)ishaveMoney{
    [roleMode updataWithLevel:level gold:gole :goods isBoss:isBOSS isHaveMoney:ishaveMoney];
    [self.roleInfoNode updataWithRole:roleMode];
    [self.levelsNode updataLevelStateForRole:roleMode];
    if (ishaveMoney) {
        [mainScence updataHaveMoneyWith:roleMode];
    }
}

-(void)consumptionGold:(NSInteger)gold{
    [roleMode consumptionGold:gold];
    [self.roleInfoNode updataWithRole:roleMode];
    [mainScence updataHaveMoneyWith:roleMode];
}

#pragma mark -RoleInfeScenceDelegate

-(void)presentSceneToMainWithType:(NSInteger)type{
    if (type == 1) {
        [mainScence updataMainScenceWithRole:roleMode type:level_allpeopleBOSS];
    }else if (type == 2){
        [mainScence updataMainScenceWithRole:roleMode type:level_havemoney];
    }
    
}
-(void)presentScenceSelectLevel{
    self.levelsNode.hidden = NO;
}
@end
