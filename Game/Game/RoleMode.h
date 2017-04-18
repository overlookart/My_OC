//
//  RoleMode.h
//  Game
//
//  Created by ledu on 17/4/12.
//  Copyright © 2017年 xzh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ArmsMode.h"
#import "ArmorMode.h"
@interface RoleMode : NSObject

///角色的名称
@property (nonatomic,strong,readonly) NSString *name;

///角色的等级
@property (nonatomic,assign,readonly) NSInteger level;

///角色的血量
@property (nonatomic,assign,readonly) NSInteger hp;

///角色的攻击
@property (nonatomic,assign,readonly) NSInteger attack;

///角色的武器
@property (nonatomic,strong,readonly) ArmsMode *arms;

///角色的护甲
@property (nonatomic,strong,readonly) ArmorMode *armor;

///角色的金币
@property (nonatomic,assign,readonly) NSInteger gold;

///挑战全民BOSS的次数
@property (nonatomic,assign,readonly) NSInteger challengeBoss;

///挑战有钱任性关卡数
@property (nonatomic,assign,readonly) NSInteger haveMoneyLevel;

///首次创建角色
-(instancetype)initWithName:(NSString *)name;

///用本地数据创建角色
-(instancetype)initWithInfo:(NSDictionary *)info;

///得到唯一的角色
+(instancetype)sharedRole;

///更新角色信息
-(void)updataWithLevel:(NSUInteger)level gold:(NSInteger)gold :(NSArray *)goods isBoss:(BOOL)isBOSS isHaveMoney:(BOOL)isHaveMoney;

-(void)consumptionGold:(NSInteger)gold;
@end
