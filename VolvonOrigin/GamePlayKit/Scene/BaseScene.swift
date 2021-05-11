//
//  BaseScene.swift
//  VolvonOrigin
//
//  Created by CaiGou on 2021/5/8.
//  Copyright © 2021 xzh. All rights reserved.
//

import Foundation
import GameplayKit
#if os(iOS)
import ReplayKit
#endif
class BaseScene: GKScene {
    
    #if os(iOS)
    /// 查看录制内容时使用的ReplayKit预览视图控制器
    var previewViewController: RPPreviewViewController?
    #endif
    
    /**
     此场景的原始大小。
     这是场景的高度
     如果不需要缩放以适合窗口或设备，则将渲染该对象。
     默认为`zeroSize`; 使用的实际值在`createCamera（）`中设置。
     */
    var nativeSize = CGSize.zero
    
    /**
     如果需要背景节点。 由这些子类提供在他们的SKS文件中使用背景场景将场景居中显示在屏幕上
     */
    
    var backgroundNode: SKSpriteNode? {
        return nil
    }
    
    
    
    override init() {
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func addEntity(_ entity: GKEntity) {
        super.addEntity(entity)
    }
    
    
    
    
}
