//
//  HexaLayer.swift
//  HexaworldSpriteKit
//
//  Created by Cyril Wei on 7/16/14.
//  Copyright (c) 2014 Cyril Wei. All rights reserved.
//

import UIKit
import SpriteKit
import HexaworldCore

enum HexaLayerType: CGFloat {
    case StaticBackgroundLayer = -100
    case DynamicBackgroundLayer = -10
    case SpriteLayer = 0
    case HUDLayer = 10
    case DebugLayer = 100
}

class HexaLayer: SKNode {
    func convertCellPoint(point: CGPoint) -> (column: Int, row: Int) {
        let node = self.nodeAtPoint(point)
        
        if let realNode = node as? HexaNode {
            return (realNode.column, realNode.row)
        } else {
            return (HEXA_NOT_FOUND, HEXA_NOT_FOUND)
        }
    }
}

extension UITouch {
    func locationInLayer(layer: HexaLayer!) -> (column: Int, row: Int) {
        let location = self.locationInNode(layer)
        
        return layer.convertCellPoint(location)
    }
}
