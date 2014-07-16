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
    var radius: CGFloat!
    
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
        
//        addPath()
//    }
    
//    func addPath() {
//        let xOffset = sin(M_PI / 6) * radius
//        let yOffset = cos(M_PI / 6) * radius
//        
//        let p = CGPathCreateMutable()
//        CGPathMoveToPoint(p, nil, -xOffset, yOffset)
//        CGPathAddLineToPoint(p, nil, -radius, 0)
//        CGPathAddLineToPoint(p, nil, -xOffset, -yOffset)
//        CGPathAddLineToPoint(p, nil, xOffset, -yOffset)
//        CGPathAddLineToPoint(p, nil, radius, 0)
//        CGPathAddLineToPoint(p, nil, xOffset, yOffset)
//        CGPathCloseSubpath(p)
//        
//        path = p
//    }
}