//
//  LevelsNode.m
//  Game
//
//  Created by ledu on 17/4/12.
//  Copyright © 2017年 xzh. All rights reserved.
//

#import "LevelsNode.h"

@implementation LevelsNode
-(instancetype)initWithRole:(RoleMode *)role{
    if (self = [super init]) {
        self.levels = [[NSMutableArray alloc]init];
        self.name = @"LevelsNode";
        self.size = CGSizeMake([UIScreen mainScreen].bounds.size.width, 1000);
        self.openLevel = role.level;
        for (int i = 0; i<20; i++) {
            SKSpriteNode *node = [[SKSpriteNode alloc]initWithColor:[UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1] size:CGSizeMake(50, 50)];
            SKLabelNode *levelNode = [[SKLabelNode alloc]init];
            levelNode.text = [NSString stringWithFormat:@"第%d关",i+1];
            levelNode.fontSize = 12.0;
            float x;
            float y;
            if ((i+1)%2 ==0) {
                x = [UIScreen mainScreen].bounds.size.width/3.0;
            }else{
                x = -[UIScreen mainScreen].bounds.size.width/3.0;
            }
            if (i<10) {
                y = -500+i*50+25;
            }else{
                y = (i-10)*50+25;
            }
            if (role.level == i+1) {
                levelNode.fontSize = 20.0;
                
            }
            node.position = CGPointMake(x, y);
            levelNode.name = [NSString stringWithFormat:@"open%d",i+1];
            levelNode.position = CGPointMake(0, 0);
            [node addChild:levelNode];
            [self addChild:node];
            [self.levels addObject:levelNode];
        }
    }
    return self;
}

-(void)updataLevelStateForRole:(RoleMode *)role{
    self.openLevel = role.level;
        for (int i = 0; i<self.levels.count;i++) {
             SKLabelNode *label = self.levels[i];
            label.hidden = NO;
            if ((role.level-1)%20 == 0) {
                label.text = [NSString stringWithFormat:@"第%d关",(role.level/20)*20+i+1];
                label.name = [NSString stringWithFormat:@"open%d",(role.level/20)*20+i+1];
                self.position = CGPointMake(self.size.width/2.0, 500+60);
            }
            if (role.level%20 == i+1 ||role.level%20==(i+1)%20) {
                label.fontSize = 20;
            }
            else{
                label.fontSize = 12.0;
            }
    }
}

@end
