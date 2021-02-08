//
//  Entity.swift
//  VolvonOrigin
//
//  Created by xzh on 2021/2/7.
//  Copyright © 2021 xzh. All rights reserved.
//

import UIKit
import GameplayKit
/**
 与游戏性有关的对象，其功能完全由一组组件对象提供
 
 GKEntity对象代表具有实体组件体系结构的游戏中的实体。 在这种设计中，实体是与游戏相关的对象的通用类型。 实体通常不定义其自身的功能-而是通过添加每个组件以通用方式处理实体行为的特定方面的组件，通过组合来定义实体的功能。 由于组件（GKComponent子类）是通用且可重用的，因此您可以通过以不同方式组合组件来向游戏添加多种实体，而无需设计新的实体类。
 */
class Entity: GKEntity {

    override init() {
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK:- 管理 entity 的组件列表
extension Entity {
    
    /// 获取 entity 全部的组件
    /// - Returns: 全部组件
    func allComponents() -> [GKComponent] {
        return components
    }
    
    /// 添加一个组件
    /// - Parameter component
    override func addComponent(_ component: GKComponent) {
        super.addComponent(component)
    }
    
    /// 移除一个组件 removeComponent<ComponentType>
    
    /// 获取一个组件 component<ComponentType>
    
}

// MARK:- 执行定期更新
extension Entity {
    
    /// 对实体的每个组件执行定期更新
    /// - Parameter seconds: 用于此方法执行的任何与时间有关的操作的时间步长（通常是自上次调用此方法以来经过的时间）
    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)
    }
    
    
}
