//
//  MainScence.h
//  Game
//
//  Created by ledu on 17/2/19.
//  Copyright © 2017年 xzh. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "EnemyMode.h"
#import "RoleMode.h"
#import "SelectLevel.h"


typedef enum {
    level_ordinary = 0,
    level_allpeopleBOSS,
    level_havemoney,
}levelType;

@protocol MainScenceDelegate <NSObject>

-(void)challengeSuccess:(NSUInteger)gole :(NSArray *)goods :(NSInteger)level isBoss:(BOOL)isBOSS isHaveMoney:(BOOL)ishaveMoney;

//金币的支出
-(void)consumptionGold:(NSInteger)gold;
@end


@interface MainScence : SKScene

@property (nonatomic,weak) id<MainScenceDelegate> myDelegate;

///本关卡等级
@property (nonatomic,assign) NSInteger level;


-(instancetype)initWithEnemyMode:(EnemyMode *)enemyMode roleMode:(RoleMode *)roleMode selectLevel:(SelectLevel *)selectLevel;

///更新战斗场景
-(void)updataMainScenceWithRole:(RoleMode *)role type:(levelType)levelType;

//更新有钱任性战斗中的信息
-(void)updataHaveMoneyWith:(RoleMode *)role;
@end
