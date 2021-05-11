//
//  SceneManager.swift
//  VolvonOrigin
//
//  Created by CaiGou on 2021/5/11.
//  Copyright © 2021 xzh. All rights reserved.
//

import Foundation
import SpriteKit

protocol SceneManagerDelegate: class {
    
    /// 当场景管理器跳转到新的场景时调用
    /// - Parameters:
    ///   - sceneManager: 场景管理器
    ///   - scene: 新的场景
    func sceneManager(_ sceneManager: SceneManager, didTransitionTo scene: SKScene)
}

/// SceneManager 负责呈现场景，请求下载将来的场景以及在后台加载资源。
final class SceneManager{
    
    /// 枚举所有场景的类型
    enum SceneIdentifier {
        
    }
    
    /// 用于编排场景过渡的视图
    let presentingView: SKView
    
    
    weak var delegate: SceneManagerDelegate?
    
    init(presentingView: SKView) {
        self.presentingView = presentingView
    }
}
