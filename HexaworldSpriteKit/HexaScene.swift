//
//  HexaScene.swift
//  HexaworldSpriteKit
//
//  Created by Cyril Wei on 7/9/14.
//  Copyright (c) 2014 Cyril Wei. All rights reserved.
//

import SpriteKit

public class HexaScene: SKScene {
    public let staticBackgroundLayer = HexaLayer()
    public let dynamicBackgroundLayer = HexaLayer()
    public let spriteLayer = HexaLayer()
    public let HUDLayer = HexaLayer()
    public let debugLayer = HexaLayer()
    
    public var backgroundMusicFileName: String!

    public var touchHandler: TouchHandler!
    var defaultHandler: TouchHandler {
        return TouchHandler(scene: self)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initialize()
    }
    
    public override init(size: CGSize) {
        super.init(size: size)

        initialize()
    }
    
    func initialize() {
        self.scaleMode = .aspectFill
        
        createLayers()

        useDefaultHandler()
    }
    
    func createLayers() {
        staticBackgroundLayer.layer = HexaLayerType.StaticBackgroundLayer
        dynamicBackgroundLayer.layer = HexaLayerType.DynamicBackgroundLayer
        spriteLayer.layer = HexaLayerType.SpriteLayer
        HUDLayer.layer = HexaLayerType.HUDLayer
        debugLayer.layer = HexaLayerType.DebugLayer
        
        addChild(staticBackgroundLayer)
        addChild(dynamicBackgroundLayer)
        addChild(spriteLayer)
        addChild(HUDLayer)
        addChild(debugLayer)
    }
    
    public func scrollByDeltaX(_ deltaX: CGFloat, deltaY: CGFloat) {
        staticBackgroundLayer.scrollByDeltaX(deltaX, deltaY: deltaY)
        dynamicBackgroundLayer.scrollByDeltaX(deltaX, deltaY: deltaY)
        spriteLayer.scrollByDeltaX(deltaX, deltaY: deltaY)
    }

    public func screenPositionForHexaPoint(_ point: HexaPoint) -> CGPoint {
        return .zero
    }

    public func convertCGPointToHexaPoint(_ point: CGPoint) -> HexaPoint {
        return HexaPoint(cube: (0, 0, 0))
    }

    public func useDefaultHandler() {
        touchHandler = defaultHandler
    }

    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchHandler?.touchesBegan(touches, with: event)
    }

    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchHandler?.touchesMoved(touches, with: event)
    }

    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchHandler?.touchesEnded(touches, with: event)
    }

    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchHandler?.touchesCancelled(touches, with: event)
    }
}
