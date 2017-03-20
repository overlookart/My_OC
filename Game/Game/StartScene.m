//
//  StartScene.m
//  Game
//
//  Created by ledu on 17/3/19.
//  Copyright © 2017年 xzh. All rights reserved.
//

#import "StartScene.h"
#import "MainScence.h"
@interface StartScene()
@property (nonatomic,strong) SKLabelNode *startLabel;
@end
@implementation StartScene

-(instancetype)initWithSize:(CGSize)size{
    self = [super initWithSize:size];
    if (self) {
        [self setUserInteractionEnabled:YES];
        self.backgroundColor = [UIColor whiteColor];
        self.startLabel = [[SKLabelNode alloc]init];
        self.startLabel.text = @"开始游戏";
        self.startLabel.fontColor = [UIColor blackColor];
        self.startLabel.name = @"开始";
        self.startLabel.fontSize = 24;
        self.startLabel.position = CGPointMake(CGRectGetWidth(self.frame)/2.0, CGRectGetHeight(self.frame)/2.0);
        [self addChild:self.startLabel];
    }
    return self;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint positionInScene = [touch locationInNode:self];
    SKSpriteNode *touchNode = (SKSpriteNode *)[self nodeAtPoint:positionInScene];
    if ([touchNode.name isEqualToString:self.startLabel.name]) {
        NSLog(@"开始游戏");
        [self.startDelegate presentToMainScene];
    }
}



-(void)initUI{
    
}
@end
