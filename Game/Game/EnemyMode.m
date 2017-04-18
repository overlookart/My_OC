//
//  EnemyMode.m
//  Game
//
//  Created by ledu on 17/4/12.
//  Copyright © 2017年 xzh. All rights reserved.
//

#import "EnemyMode.h"

@implementation EnemyMode

-(instancetype)initWithName:(NSString *)name level:(NSInteger)level isBoss:(BOOL)isBoss isHaveMoney:(BOOL)haveMoney{
    if (self = [super init]) {
        self.name = name;
        self.level = level;
        _isBOSS = isBoss;
        _haveMoney = haveMoney;
        //当等级是5的倍数是出装备
        if (_isBOSS) {
            _hp = level*10*1.8;
            _attack = level*1*1.8;
            _fallGold = 500;
            _fallArms = [[ArmsMode alloc]initWithLevel:level/5 name:[NSString stringWithFormat:@"武器%d级",level/5]];
            _fallArmor = [[ArmorMode alloc]initWithLevel:level/5 name:[NSString stringWithFormat:@"护甲%d级",level/5]];
        }else if(_haveMoney){
            _hp = 5*level*10;
            _attack = 0;
            _fallArms = [[ArmsMode alloc]initWithLevel:5*level name:[NSString stringWithFormat:@"武器%d级",level*5]];
        }else{
            _hp = level*10;
            _attack = level*1;
            _fallGold = 10;
            if (level%5 == 0) {
                if((level/5)%2 == 0){
                    //掉落武器
                    _fallArms = [[ArmsMode alloc]initWithLevel:level/5 name:[NSString stringWithFormat:@"武器%d级",level/5]];
                }else{
                    //掉落护甲
                    _fallArmor = [[ArmorMode alloc]initWithLevel:level/5 name:[NSString stringWithFormat:@"护甲%d级",level/5]];
                }
            }
        }
    }
    return self;
}

-(void)upDataForlevel:(NSInteger)level{
    _hp = level*10;
    _attack = level*1;
}
@end
