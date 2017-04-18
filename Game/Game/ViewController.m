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
#import "StartView.h"
@interface ViewController ()<SKSceneDelegate>{
    StartView *startView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    self.view.backgroundColor = [UIColor whiteColor];
    [self configureSKView];
//    [self addScnView];
    
    
}

-(BOOL)prefersStatusBarHidden
{
    return YES;// 返回YES表示隐藏，返回NO表示显示
}
///配置视图
-(void)configureSKView{
    startView = [[StartView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:startView];
#pragma mark - 显示性能值
    startView.showsFPS = YES;
    startView.showsNodeCount = YES;
    startView.showsDrawCount = YES;
    startView.showsQuadCount = YES;
    startView.showsFields = YES;
    startView.showsPhysics = YES;
    
#pragma mark - 创建场景
    
}


#pragma mark - SKSceneDelegate
//-(void)update:(NSTimeInterval)currentTime forScene:(SKScene *)scene{
//    NSLog(@"开始更新");
//}
//
//-(void)didEvaluateActionsForScene:(SKScene *)scene{
//    NSLog(@"2");
//}
//
//-(void)didSimulatePhysicsForScene:(SKScene *)scene{
//    NSLog(@"3");
//}
//
//-(void)didApplyConstraintsForScene:(SKScene *)scene{
//    NSLog(@"4");
//}
//
//-(void)didFinishUpdateForScene:(SKScene *)scene{
//    NSLog(@"更新完成");
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
