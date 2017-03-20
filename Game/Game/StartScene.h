//
//  StartScene.h
//  Game
//
//  Created by ledu on 17/3/19.
//  Copyright © 2017年 xzh. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@protocol StartSceneDelegate <NSObject>
-(void)presentToMainScene;
@end

@interface StartScene : SKScene
@property (nonatomic,weak) id<StartSceneDelegate> startDelegate;
@end
