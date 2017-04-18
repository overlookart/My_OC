//
//  RewardGoods.m
//  Game
//
//  Created by ledu on 17/4/13.
//  Copyright © 2017年 xzh. All rights reserved.
//

#import "RewardGoods.h"

@interface RewardGoods()
{
    SKSpriteNode *titleNode;
    SKSpriteNode *congratulations;
    SKSpriteNode *goleNode;
    SKSpriteNode *getGoodsNode;
    SKSpriteNode *armsNode;
    SKSpriteNode *armorNode;
}
@end


@implementation RewardGoods

-(instancetype)initWithGold:(NSUInteger)gole arms:(ArmsMode *)arms armor:(ArmorMode *)armor{
    if (self = [super init]) {
        _gole = gole;
        if (arms!=nil || armor!=nil) {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            if (arms != nil) {
                [arr addObject:arms];
            }
            if (armor != nil) {
                [arr addObject:armor];
            }
            _goods = arr;
        }
        
        self.size = CGSizeMake([UIScreen mainScreen].bounds.size.width / 5.0*4, [UIScreen mainScreen].bounds.size.height/6.0*2.5);
        self.color = [UIColor purpleColor];
        self.position = CGPointMake([UIScreen mainScreen].bounds.size.width/2.0, [UIScreen mainScreen].bounds.size.height/2.0);
        [self initTitleNode];
        [self initCongratulations];
        [self goodsNode:gole equipments:_goods];
        [self initGetGoodsNode];
    }
    return self;
}

-(void)initTitleNode{
    titleNode = [[SKSpriteNode alloc]initWithColor:[UIColor blueColor] size:CGSizeMake(self.size.width, 40)];
    titleNode.position = CGPointMake(0, self.size.height / 2.0 - 20);
    SKLabelNode *label = [SKLabelNode labelNodeWithText:@"闯关成功"];
//
    label.position = CGPointMake(0, -10);
    [titleNode addChild:label];
    [self addChild:titleNode];
}

-(void)initCongratulations{
    congratulations = [[SKSpriteNode alloc]initWithColor:[UIColor grayColor] size:CGSizeMake(self.size.width, 40)];
    congratulations.position = CGPointMake(0, self.size.height / 2.0 - 60);
    [self addChild:congratulations];
    SKLabelNode *label = [SKLabelNode labelNodeWithText:@"恭喜获得"];
    label.position = CGPointMake(0, -10);
    label.fontName = @"Kohinoor Telugu";
    [congratulations addChild:label];
}
-(void)goodsNode:(NSInteger)gole equipments:(NSArray *)equipments{
    goleNode = [[SKSpriteNode alloc]initWithColor:[UIColor yellowColor] size:CGSizeMake(self.size.width/3.0, 60)];
    SKLabelNode *goleLabel = [SKLabelNode labelNodeWithText:[NSString stringWithFormat:@"%d金币",gole]];
    goleLabel.position = CGPointMake(0, 0);
    goleLabel.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
    goleLabel.fontSize = 18.0;
    goleLabel.fontColor = [UIColor redColor];
    [goleNode addChild:goleLabel];
    [self addChild:goleNode];
    
    if (equipments==nil||equipments.count<=0) {
        goleNode.position = CGPointMake(0, self.size.height/2.0 - 130);
        
    }else{
        goleNode.position = CGPointMake(-self.size.width / 3.0, self.size.height/2.0 - 130);
            for (id objc in equipments) {
                if ([objc isKindOfClass:[ArmsMode class]]) {
                    ArmsMode *armsMode = objc;
                    armsNode = [[SKSpriteNode alloc]initWithColor:[UIColor blueColor] size:CGSizeMake(self.size.width/3.0, 60)];
                    SKLabelNode *armsLabel = [SKLabelNode labelNodeWithText:armsMode.name];
                    armsLabel.fontSize = 18.0;
                    armsLabel.fontColor = [UIColor blackColor];
                    armsLabel.position = CGPointMake(0, 0);
                    [armsNode addChild:armsLabel];
                    armsNode.position = CGPointMake(0, self.size.height/2.0 - 130);
                    [self addChild:armsNode];
                }else if ([objc isKindOfClass:[ArmorMode class]]){
                    ArmorMode *armorMode = objc;
                    armorNode = [[SKSpriteNode alloc]initWithColor:[UIColor redColor] size:CGSizeMake(self.size.width/3.0, 60)];
                    SKLabelNode *armorLabel = [SKLabelNode labelNodeWithText:armorMode.name];
                    armorLabel.fontSize = 18.0;
                    armorLabel.fontColor = [UIColor blackColor];
                    armorLabel.position = CGPointMake(0, 0);
                    [armorNode addChild:armorLabel];
                    armorNode.position = CGPointMake(self.size.width / 3.0, self.size.height/2.0 - 130);
                    [self addChild:armorNode];
                }
        }
        if (equipments.count == 2) {
            
        }
    }
}

-(void)initGetGoodsNode{
    getGoodsNode = [[SKSpriteNode alloc]initWithColor:[UIColor brownColor] size:CGSizeMake(self.size.width/ 2.0, 30)];
    getGoodsNode.name = @"GetGoods";
    getGoodsNode.position = CGPointMake(0, self.size.height/2.0 - 195);
    SKLabelNode *label = [SKLabelNode labelNodeWithText:@"领取奖励"];
    label.name = @"GetGoods";
    label.position = CGPointMake(0, 0);
    label.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
    label.fontSize = 18.0;
    label.fontName = @"Kohinoor Telugu";
    [getGoodsNode addChild:label];
    [self addChild:getGoodsNode];
    
}
@end
