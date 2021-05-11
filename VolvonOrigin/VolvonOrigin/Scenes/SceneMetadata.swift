//
//  SceneMetadata.swift
//  VolvonOrigin
//
//  Created by CaiGou on 2021/5/11.
//  Copyright © 2021 xzh. All rights reserved.
//

import Foundation
/// 场景元数据
struct SceneMetadata {
    /// 场景名称(文件名)
    private(set) var sceneName: String
    ///场景的类型
    private(set) var sceneType: Any?
    /// 此场景应预加载的带有资源的类型列表
    private(set) var loadableTypes: [Any]?
    /// 与场景有关的所有随需应变资源标签
    private(set) var onDemandResourcesTags: Set<String>
    /// 一个标志，指示场景是否需要按需加载资源
    var requiresOnDemandResources: Bool {
        #if os(OSX)
        /**
         OS X不使用按需资源，因此资源将始终是在磁盘上可用
         */
        return false
        #else
        /**
         检查按需资源，并非所有场景都有资源需要下载
         */
        return !onDemandResourcesTags.isEmpty
        #endif
    }
    
    init(sceneConfig: [String : AnyObject]) {
        sceneName = (sceneConfig["sceneName"] as! String)
        
        if let tags = sceneConfig["onDemandResourcesTags"] as? [String]{
            onDemandResourcesTags = Set(tags)
        }else{
            onDemandResourcesTags = []
        }
    }
}

extension SceneMetadata: Hashable {
    static func == (lhs: SceneMetadata, rhs: SceneMetadata) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        
    }
    
}
