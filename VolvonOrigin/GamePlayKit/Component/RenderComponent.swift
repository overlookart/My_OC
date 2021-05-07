//
//  RenderComponent.swift
//  VolvonOrigin
//
//  Created by CaiGou on 2021/5/7.
//  Copyright © 2021 xzh. All rights reserved.
//

import UIKit
import GameplayKit
import SpriteKit
/**
 渲染组件
 */
class RenderComponent: GKComponent {
    let renderNode: SKNode = SKNode()
    
    override func didAddToEntity() {
        renderNode.entity = entity
    }
    
    override func willRemoveFromEntity() {
        renderNode.entity = nil
    }
}
