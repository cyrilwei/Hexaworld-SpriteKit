//
//  HexaScene.swift
//  HexaworldSpriteKit
//
//  Created by Cyril Wei on 7/9/14.
//  Copyright (c) 2014 Cyril Wei. All rights reserved.
//

import UIKit
import SpriteKit
import HexaworldCore

//extension SKNode {
//    var layer: HexaLayer {
//        get {
//            return HexaLayer.fromRaw(self.zPosition)!
//        }
//        set {
//            self.zPosition = newValue.toRaw()
//        }
//    }
//}

public class HexaScene: SKScene {
    public var world: Hexaworld!
    
    public var radius: CGFloat!
    
    public let staticBackgroundLayer = HexaLayer()
    public let dynamicBackgroundLayer = HexaLayer()
    public let spriteLayer = HexaLayer()
    public let HUDLayer = HexaLayer()
    public let debugLayer = HexaLayer()
    
    public init(size: CGSize, columns: Int, rows: Int) {
        super.init(size: size)

        createWorld(columns, rows: rows)

        createLayers()

        let xRadiusCount = CGFloat(columns) * world.xFactor + 0.5
        let yRadiusCount = CGFloat(rows + 1) / world.yFactor
        
        radius = min(self.size.width / xRadiusCount, self.size.height / yRadiusCount)
    }
    
    func createLayers() {
        staticBackgroundLayer.zPosition = HexaLayerType.StaticBackgroundLayer.toRaw()
        dynamicBackgroundLayer.zPosition = HexaLayerType.DynamicBackgroundLayer.toRaw()
        spriteLayer.zPosition = HexaLayerType.SpriteLayer.toRaw()
        HUDLayer.zPosition = HexaLayerType.HUDLayer.toRaw()
        debugLayer.zPosition = HexaLayerType.DebugLayer.toRaw()
        
        addChild(staticBackgroundLayer)
        addChild(dynamicBackgroundLayer)
        addChild(spriteLayer)
        addChild(HUDLayer)
        addChild(debugLayer)
    }
    
    public func createWorld(columns: Int, rows: Int) {
        world = Hexaworld(layout: HexaLayout.createRectLandscapeLayout(columns, rows: rows))
    }
}
