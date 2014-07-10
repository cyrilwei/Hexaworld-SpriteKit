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

        world = Hexaworld(columns: columns, rows: rows)
        
        cellSize = CGFloat(min(Int(self.size.width) / columns, Int(self.size.height) / rows))
        
        for cell in world.cells {
            if let realCell = cell? {
                let node = SKShapeNode(rectOfSize: CGSizeMake(CGFloat(cellSize) / 1.5, CGFloat(cellSize) / 1.5), cornerRadius: 10.0)
                
                var x = CGFloat(realCell.column) * cellSize + cellSize * 0.5
                var y = CGFloat(realCell.row) * cellSize + 100
                
                if realCell.column % 2 == 1 {
                    y -= cellSize * 0.5
                }
                
                node.position = CGPointMake(x, y)
                
                addChild(node)
            }
        }
    }
}
