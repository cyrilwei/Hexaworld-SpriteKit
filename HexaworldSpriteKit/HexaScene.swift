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

class HexaScene: SKScene {
    var world: Hexaworld!
    
    var cellSize: CGFloat!
    
    init(size: CGSize, columns: Int, rows: Int) {
        super.init(size: size)

        world = Hexaworld(layout: HexaLayout.createLayout(columns, rows: rows))
        
        cellSize = CGFloat(min(Int(self.size.width) / columns, Int(self.size.height) / rows))
        
        let radius = cellSize / 2
        
        let xOffset = (1 + sin(M_PI / 6)) * radius
        let yOffset = 2 * cos(M_PI / 6) * radius
        
        for cell in world.cells {
            if let realCell = cell? {
                let node = HexaNode(cell: realCell, size: cellSize)
                
                var x = CGFloat(realCell.column) * xOffset + cellSize
                var y = CGFloat(realCell.row) * yOffset + 100
                
                if realCell.column % 2 == 1 {
                    y -= yOffset * 0.5
                }
                
                node.position = CGPointMake(x, y)
                
                addChild(node)
            }
        }
    }
}
