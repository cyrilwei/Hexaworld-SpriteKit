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

let M_2_COS_PI_6 = 2 * cos(M_PI / 6)

class HexaScene: SKScene {
    var world: Hexaworld!
    
    var radius: CGFloat!
    
    init(size: CGSize, columns: Int, rows: Int) {
        super.init(size: size)

        world = Hexaworld(layout: HexaLayout.createLandscapeLayout(columns, rows: rows))
        
        let xRadiusCount = CGFloat(columns) * 1.5 + 0.5
        let yRadiusCount = CGFloat(rows + 1) / M_2_COS_PI_6
        
        radius = min(self.size.width / xRadiusCount, self.size.height / yRadiusCount)
        
        let xOffset = 1.5 * radius
        let yOffset = M_2_COS_PI_6 * radius
        let halfYOffset = yOffset / 2

        for cell in world.cells {
            if let realCell = cell? {
                let node = HexaNode(cell: realCell, radius: radius)
                
                var x = CGFloat(realCell.column) * xOffset + radius
                var y = CGFloat(realCell.row + 1) * yOffset
                
                if realCell.column % 2 == 1 {
                    y -= halfYOffset
                }
                
                node.position = CGPointMake(x, y)
                
                addChild(node)
            }
        }
    }
}
