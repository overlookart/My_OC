//
//  TestEntity.swift
//  VolvonOrigin
//
//  Created by CaiGou on 2021/5/7.
//  Copyright © 2021 xzh. All rights reserved.
//

import Foundation
import GameplayKit
class TestEntity: GKEntity {
    
    private var renderComponent: RenderComponent {
        guard let component = component(ofType: RenderComponent.self) else {
            fatalError("A PlayerBot must have an RenderComponent.")
        }
        return component
    }
    
    override init() {
        super.init()
        addComponent(RenderComponent())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
