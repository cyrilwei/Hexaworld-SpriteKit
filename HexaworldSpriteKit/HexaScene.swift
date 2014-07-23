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

class HexaScene: SKScene {
    var world: Hexaworld!
    
    var radius: CGFloat!
    
    let staticBackgroundLayer = HexaLayer()
    let dynamicBackgroundLayer = HexaLayer()
    let spriteLayer = HexaLayer()
    let HUDLayer = HexaLayer()
    let debugLayer = HexaLayer()
    
    init(size: CGSize, columns: Int, rows: Int) {
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
    
    func createWorld(columns: Int, rows: Int) {
        world = Hexaworld(layout: HexaLayout.createRectLandscapeLayout(columns, rows: rows))
    }
}
