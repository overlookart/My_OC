//
//  GameViewController.swift
//  VolvonOrigin
//
//  Created by xzh on 2019/7/3.
//  Copyright © 2019 xzh. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //加载 GameScene.sks 为 GKScene。 提供与游戏相关的内容
        // 包括entities和图形
        if let scene = GKScene(fileNamed: "GameScene") {
            // 从加载的GKScene中获取SKScene
            if let sceneNode = scene.rootNode as! GameScene? {
                
                // 将与游戏相关的内容复制到场景中
                sceneNode.entities = scene.entities
                sceneNode.graphs = scene.graphs
                
                // 设置缩放模式以缩放以适合窗口
                sceneNode.scaleMode = .aspectFill
                
                // 呈现 scene
                if let view = self.view as! SKView? {
                    view.presentScene(sceneNode)
                    view.ignoresSiblingOrder = true
                    view.showsFPS = true
                    view.showsNodeCount = true
                }
            }
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
