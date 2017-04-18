//
//  HeroScene.m
//  Game
//
//  Created by ledu on 17/4/6.
//  Copyright © 2017年 xzh. All rights reserved.
//

#import "HeroScene.h"

@interface HeroScene()
@property (nonatomic,strong) SKSpriteNode *bgNode;
@end

@implementation HeroScene
-(instancetype)initWithSize:(CGSize)size{
    if (self = [super initWithSize:size]) {
        self.backgroundColor = [UIColor yellowColor];
        [self createBgNode];
        self.paused = NO;
    }
    return self;
}

-(void)createBgNode{
    self.bgNode = [SKSpriteNode spriteNodeWithImageNamed:@"hero_info_bg"];
    self.bgNode.position = CGPointMake(self.frame.size.width / 2.0, self.frame.size.height / 2.0);
    [self addChild:self.bgNode];
}

@end
