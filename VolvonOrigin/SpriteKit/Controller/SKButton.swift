//
//  SKButton.swift
//  VolvonOrigin
//
//  Created by xzh on 2019/7/3.
//  Copyright © 2019 xzh. All rights reserved.
//

import UIKit
import SpriteKit
class SKButton: SKSpriteNode {
    enum SKButtonState {
        case SKButtonStateNormal
        case SKButtonStateSelect
    }
    
    private var normaltexture : SKTexture?
    private var selecttexture : SKTexture?
    private var normalColor : UIColor?
    private var selectColor : UIColor?
    private var normalTitle : String?
    private var selectTitle : String?
    private var normalTitleColor : UIColor?
    private var selectTitleColor : UIColor?
    private var target : Any?
    private var action : Selector?
    
    var isHighlighted : Bool = false
    var selected : Bool = false
    
    lazy var titleLab : SKLabelNode = {
        let labNode = SKLabelNode.init()
        labNode.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
        labNode.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        return labNode
    }()

    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -
    func button(Size size : CGSize) -> SKButton {
        let button : SKButton = SKButton.init(color: UIColor.gray, size: size)
        return button
    }
    
    //TODO: 添加点击事件
    func add(Target target : Any, Action action : Selector) {
        
    }
    
    //TODO: 设置按钮高亮状态
    func set(Highlighted highlighted : Bool) {
        
    }
    
    //TODO: 设置按钮不同状态下的颜色
    func set(Color color : UIColor, State state : SKButtonState) {
        
    }
    
    //TODO: 设置按钮不同状态下的标题
    func set(Title title : String, State state : SKButtonState) {
        
    }
    
    //TODO: 设置按钮不同状态下的标题颜色
    func set(TitleColor titleColor : UIColor, State state : SKButtonState) {
        
    }
    
    //TODO: 设置按钮不同状态下的纹理
    func set(Texture texture : SKTexture, State state : SKButtonState) {
        
    }
}
