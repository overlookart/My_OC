//
//  RoleMode.m
//  Game
//
//  Created by ledu on 17/4/12.
//  Copyright © 2017年 xzh. All rights reserved.
//

#import "RoleMode.h"

@implementation RoleMode
-(instancetype)initWithName:(NSString *)name{
    if (self = [super init]) {
        _name = name;
        _level = 1;
        _haveMoneyLevel = 1;
        _hp = 2*self.level*10;
        _attack = 2*self.level*1;
        _arms = nil;
        _armor = nil;
        _gold = 0;
        _challengeBoss = 0;
    }
    return self;
}

+(instancetype)sharedRole{
    static dispatch_once_t predicate;
    static RoleMode *sharedRole;
    dispatch_once(&predicate, ^{
        sharedRole=[[RoleMode alloc] init];
    });
    return sharedRole;
}
-(instancetype)initWithInfo:(NSDictionary *)info{
    if (self = [super init]) {
        
    }
    return self;
}

-(void)updataWithLevel:(NSUInteger)level gold:(NSInteger)gold :(NSArray *)goods isBoss:(BOOL)isBOSS isHaveMoney:(BOOL)isHaveMoney{
    _level = level;
    _gold = self.gold + gold;
    _hp = self.armor.hp +2*self.level*10;
    _attack = self.arms.attack + 2*self.level*1;
    if (isBOSS) {
        _challengeBoss = _challengeBoss - 1;
    }else{
        if (!isHaveMoney) {
            if ((level-1)%10 == 0) {
                _challengeBoss = _challengeBoss + 1;
            }
        }
    }
    if (isHaveMoney) {
        _haveMoneyLevel = _haveMoneyLevel + 1;
    }
    if (goods!=nil && goods.count >0) {
        for (id objc in goods) {
            if ([objc isKindOfClass:[ArmsMode class]]) {
                ArmsMode *newArms = objc;
                NSLog(@"获得武器:%@",newArms.name);
                if (newArms.level > _arms.level) {
                    _arms = newArms;
                    _attack = _attack+_arms.attack;
                }
                
            }else if ([objc isKindOfClass:[ArmorMode class]]){
                ArmorMode *newArmor = objc;
                NSLog(@"获得护甲:%@",newArmor.name);
                if (newArmor.level >=_armor.level) {
                    _armor = newArmor;
                    _hp = _hp+_armor.hp;
                }
            }
        }
    }
}

-(void)consumptionGold:(NSInteger)gold{
    _gold = _gold-gold;
}
@end
