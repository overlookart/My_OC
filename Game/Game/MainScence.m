//
//  MainScence.m
//  Game
//
//  Created by ledu on 17/2/19.
//  Copyright © 2017年 xzh. All rights reserved.
//

#import "MainScence.h"

//角色类别
typedef NS_ENUM(uint32_t, SKRoleCategory){
    SKRoleCategoryBullet = 1,//子弹
    SKRoleCategoryFoePlane = 4,//飞机
    SKRoleCategoryPlayerPlane = 8//玩家
};

@implementation MainScence
-(instancetype)initWithSize:(CGSize)size{
    self = [super initWithSize:size];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self initPhysicsWorld];
        [self initScroeLabel];
    }
    return self;
}

//初始化物理环境
-(void)initPhysicsWorld{
    /*
     每个场景自动创建一个物理世界对象，以模拟场景中节点上的物理。 
     您可以使用此属性访问场景的全局物理属性，如重力，以及管理节点之间的物理交互。 
     要使场景中的节点参与物理模拟，请使用其physicsBody和physicsField属性中的一个或两个。
     */
    
    //当两个物理体相互接触时调用的委托。
    self.physicsWorld.contactDelegate = self;
    //重力
    self.physicsWorld.gravity = CGVectorMake(0, 0);
}

-(void)initAction{
    self.smallPlaneHitAction ;
}

-(void)initScroeLabel{
   
    
    self.scoreLabel = [SKLabelNode labelNodeWithText:@"Hello"];
//    self.scoreLabel.text = @"斯柯达罚款束带结发";
    //zPosition属性 该节点显示次序,值越大,越优先显示
    self.scoreLabel.zPosition = 3;
    self.scoreLabel.fontColor = [UIColor redColor];
    
    //文字水平显示模式
    self.scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
    //文字垂直显示模式
    self.scoreLabel.fontSize = 42;
    self.scoreLabel.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
    self.scoreLabel.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame));
    [self addChild:self.scoreLabel];
    self.scoreLabel.color = [UIColor blueColor];
    self.scaleMode = SKSceneScaleModeAspectFit;
    
//    [self.scoreLabel runAction:[SKAction sequence:@[[SKAction moveToY:0 duration:1]]]];
}

@end
