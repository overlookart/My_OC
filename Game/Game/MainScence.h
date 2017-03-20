//
//  MainScence.h
//  Game
//
//  Created by ledu on 17/2/19.
//  Copyright © 2017年 xzh. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface MainScence : SKScene<SKPhysicsContactDelegate>
/**
 小飞机出现的时间
 */
@property (nonatomic,assign) int smallPlaneTime;

/**
 中型飞机出现的时间
 */
@property (nonatomic,assign) int mediumPlaneTime;

/**
大型飞机出现的时间
 */
@property (nonatomic,assign) int bigPlaneTime;

/**
 显示分值的label
 */
@property (nonatomic,strong) SKLabelNode *scoreLabel;

/**
 玩家sprite
 */
@property (nonatomic,strong) SKSpriteNode *playerPlane;
//背景
@property (nonatomic,strong) SKSpriteNode *background1;
@property (nonatomic,strong) SKSpriteNode *background2;

@property (nonatomic,strong) SKAction *smallPlaneHitAction;
@property (nonatomic,strong) SKAction *mediumPlaneHitAction;
@property (nonatomic,strong) SKAction *bigPlaneHitAaction;

@property (nonatomic,strong) SKAction *smallPlaneBlowupAction;
@property (nonatomic,strong) SKAction *mediumPlaaneBlowupAaction;
@property (nonatomic,strong) SKAction *bigPlaneBlowupAction;
@end
