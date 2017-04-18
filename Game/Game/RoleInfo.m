//
//  RoleInfo.m
//  Game
//
//  Created by ledu on 17/4/6.
//  Copyright © 2017年 xzh. All rights reserved.
//

#import "RoleInfo.h"

@interface RoleInfo()
@property (nonatomic,strong) UILabel *roleName;
@property (nonatomic,strong) UILabel *GoldCoins;
@property (nonatomic,strong) UILabel *power;
@end

@implementation RoleInfo
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:CGRectMake(0, 0, frame.size.width, 90)]) {
        self.image = [UIImage imageNamed:@"role_info_img"];
    }
    return self;
}


@end
