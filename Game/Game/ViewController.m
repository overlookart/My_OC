//
//  ViewController.m
//  Game
//
//  Created by ledu on 17/2/19.
//  Copyright © 2017年 xzh. All rights reserved.
//

#import "ViewController.h"
#import <SpriteKit/SpriteKit.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addScnView];
    [self createScence];
}

///创建一个游戏引擎专属View视图(SCNView)
-(void)addScnView{
    self.gameView = [[SCNView alloc]initWithFrame:CGRectMake(0, 0, 300, 300)];
    self.gameView.center = self.view.center;
    self.gameView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.gameView];
}

///创建场景
-(void)createScence{
    SCNScene *scence = [SCNScene scene];
    self.gameView.scene = scence;
    ///添加节点
    /**
     为什么Scene也有一个节点,上面说个，没有节点你没法放游戏元素上去，并且它有自身坐标系，这就是为什么scene也有一个根节点的原因。
     */
    SCNNode *node = [SCNNode node];
    [scence.rootNode addChildNode:node];
    
    //给节点绑定一个几何形状的物体
    SCNSphere *sphere = [SCNSphere sphereWithRadius:0.5];
    node.geometry = sphere;
    
    
    //给节点添加节点
    SCNNode * childNode = [SCNNode node];
    //设置节点的位置
    childNode.position = SCNVector3Make(-0.5, 0, 1);
    //设置几何形状,立体字体  字体深度(extrusionDepth)
    SCNText *text = [SCNText textWithString:@"飘飞吧" extrusionDepth:0.03];
    //字体颜色
    text.firstMaterial.diffuse.contents = [UIColor redColor];
    text.font = [ UIFont systemFontOfSize:0.15];
    //给子节点绑定几何体
    childNode.geometry = text;
    [node addChildNode:childNode];
    
    self.gameView.allowsCameraControl = true;
    
}




///配置视图
-(void)configureSKView{
    SKView *skView = (SKView *)self.view;
#pragma mark - 显示性能值
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    skView.showsDrawCount = YES;
    skView.showsQuadCount = YES;
    skView.showsFields = YES;
    skView.showsPhysics = YES;
    
#pragma mark - 创建场景
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
