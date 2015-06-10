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
        self.scaleMode = .AspectFill
        
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
    
    public func scrollByDeltaX(deltaX: CGFloat, deltaY: CGFloat) {
        staticBackgroundLayer.scrollByDeltaX(deltaX, deltaY: deltaY)
        dynamicBackgroundLayer.scrollByDeltaX(deltaX, deltaY: deltaY)
        spriteLayer.scrollByDeltaX(deltaX, deltaY: deltaY)
    }

    public func screenPositionForHexaPoint(point: HexaPoint) -> CGPoint {
        return CGPointZero
    }

    public func convertCGPointToHexaPoint(point: CGPoint) -> HexaPoint {
        return HexaPoint(cube: (0, 0, 0))
    }

    public func useDefaultHandler() {
        touchHandler = defaultHandler
    }

    public override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        touchHandler?.touchesBegan(touches, withEvent: event)
    }

    public override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        touchHandler?.touchesMoved(touches, withEvent: event)
    }

    public override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        touchHandler?.touchesEnded(touches, withEvent: event)
    }

    public override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        touchHandler?.touchesCancelled(touches, withEvent: event)
    }
}