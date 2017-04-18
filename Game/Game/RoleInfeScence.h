//
//  RoleInfeScence.h
//  Game
//
//  Created by ledu on 17/4/14.
//  Copyright © 2017年 xzh. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "RoleMode.h"

@protocol RoleInfeScenceDelegate <NSObject>

-(void)presentScenceSelectLevel;
-(void)presentSceneToMainWithType:(NSInteger)type;

@end


@interface RoleInfeScence : SKScene

@property (nonatomic,weak) id<RoleInfeScenceDelegate> myDelegate;


-(instancetype)initWithRoleMode:(RoleMode *)role select:(SKScene *)select main:(SKScene *)main;
@end
