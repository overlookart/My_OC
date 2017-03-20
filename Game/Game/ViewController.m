//
//  ViewController.m
//  Game
//
//  Created by ledu on 17/2/19.
//  Copyright © 2017年 xzh. All rights reserved.
//

#import "ViewController.h"
#import <SpriteKit/SpriteKit.h>
#import <SceneKit/SceneKit.h>
#import "MainScence.h"
#import "StartScene.h"
@interface ViewController ()<StartSceneDelegate>{
    SKView *kView;
    UIButton *actionLeft;
    UIButton *actionRight;
    UIButton *actionUp;
    UIButton *actionDown;
    StartScene *startScence;
    MainScence *mainScene;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self configureSKView];
    [self addScnView];
    
    
}




///创建一个游戏引擎专属View视图(SCNView)
-(void)addScnView{
  
    
    startScence = [[StartScene alloc]initWithSize:self.view.bounds.size];
    startScence.startDelegate = self;
    [kView presentScene:startScence transition:[SKTransition revealWithDirection:(SKTransitionDirectionDown) duration:1.0]];
    kView.paused = NO;
    kView.allowsTransparency = YES;
    
}

-(void)presentToMainScene{
    mainScene = [[MainScence alloc]initWithSize:self.view.bounds.size];
    [kView presentScene:mainScene transition:[SKTransition revealWithDirection:(SKTransitionDirectionDown) duration:1.0]];
    kView.paused = NO;
//    kView.allowsTransparency = YES;
}




///配置视图
-(void)configureSKView{
    kView = [[SKView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:kView];
#pragma mark - 显示性能值
    kView.showsFPS = YES;
    kView.showsNodeCount = YES;
    kView.showsDrawCount = YES;
    kView.showsQuadCount = YES;
    kView.showsFields = YES;
    kView.showsPhysics = YES;
    
#pragma mark - 创建场景
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
