//
//  HexaNode.swift
//  HexaworldSpriteKit
//
//  Created by Cyril Wei on 7/11/14.
//  Copyright (c) 2014 Cyril Wei. All rights reserved.
//

import SpriteKit

class HexaNode: SKSpriteNode {
    var column: Int!
    var row: Int!
    var _radius: CGFloat!
    var radius: CGFloat! {
        get {
            return _radius
        }
        set {
            _radius = newValue
            createHexaPath()
        }
    }
    
    var hexaPath: CGPath!
    
    func createHexaPath() {
        let xOffset = sin(M_PI / 6) * _radius
        let yOffset = cos(M_PI / 6) * _radius
        
        let pa = CGPathCreateMutable()
        CGPathMoveToPoint(pa, nil, -xOffset, yOffset)
        CGPathAddLineToPoint(pa, nil, -_radius, 0)
        CGPathAddLineToPoint(pa, nil, -xOffset, -yOffset)
        CGPathAddLineToPoint(pa, nil, xOffset, -yOffset)
        CGPathAddLineToPoint(pa, nil, _radius, 0)
        CGPathAddLineToPoint(pa, nil, xOffset, yOffset)
        CGPathCloseSubpath(pa)
        
        hexaPath = pa
    }
    
    override func containsPoint(p: CGPoint) -> Bool {

        return CGPathContainsPoint(hexaPath, nil, self.convertPoint(p, fromNode: self.scene), true)
    }
    
//    init(column: Int, row: Int, radius: CGFloat) {
//        self.column = column
//        self.row = row
//        self.radius = radius
//
//        super.init()

//        let xOffset = cos(M_PI / 6) * radius
//        let yOffset = sin(M_PI / 6) * radius
//        
//        let p = CGPathCreateMutable()
//        CGPathMoveToPoint(p, nil, 0.0, radius)
//        CGPathAddLineToPoint(p, nil, -xOffset, yOffset)
//        CGPathAddLineToPoint(p, nil, -xOffset, -yOffset)
//        CGPathAddLineToPoint(p, nil, 0.0, -radius)
//        CGPathAddLineToPoint(p, nil, xOffset, -yOffset)
//        CGPathAddLineToPoint(p, nil, xOffset, yOffset)
//        CGPathCloseSubpath(p)
        
//    }
    
}