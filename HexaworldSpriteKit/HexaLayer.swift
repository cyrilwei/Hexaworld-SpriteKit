//
//  HexaLayer.swift
//  HexaworldSpriteKit
//
//  Created by Cyril Wei on 7/16/14.
//  Copyright (c) 2014 Cyril Wei. All rights reserved.
//

import SpriteKit

enum HexaLayerType: CGFloat {
    case StaticBackgroundLayer = -100
    case DynamicBackgroundLayer = -10
    case SpriteLayer = 0
    case HUDLayer = 10
    case DebugLayer = 100
}

extension SKNode {
    var layer: HexaLayerType {
        get {
            return HexaLayerType(rawValue: self.zPosition)!
        }
        set {
            self.zPosition = newValue.rawValue
        }
    }
}

public class HexaLayer: SKNode {
    func scrollByDeltaX(deltaX: CGFloat, deltaY: CGFloat) {
        self.position = CGPointMake(position.x + deltaX, position.y + deltaY)
    }
}