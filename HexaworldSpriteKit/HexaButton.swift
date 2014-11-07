//
//  HexaButton.swift
//  Hexagems
//
//  Created by Cyril Wei on 11/7/14.
//  Copyright (c) 2014 Cyril Wei. All rights reserved.
//

import SpriteKit

class HexaButton: SKSpriteNode {
    var isTouched = false
    var isDisabled = false

    var clickedCallback: ((button: HexaButton) -> ())?
    var imageName: String

    var disabledImageName: String {
        return "\(imageName)Disabled"
    }

    init(imageNamed: String, buttonName: String) {
        self.imageName = imageNamed

        let sprite = SKSpriteNode(imageNamed: imageNamed)
        let texture = sprite.texture
        let size = sprite.size

        super.init(texture: texture, color: SKColor.clearColor(), size: size)

        self.name = buttonName
        initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        self.imageName = ""
        super.init(coder: aDecoder)

        initialize()
    }

    func initialize() {
        self.userInteractionEnabled = true
    }

    func disable() {
        if isDisabled {
            return
        }

        self.isDisabled = true
        self.texture = SKTexture(imageNamed: self.disabledImageName)
    }

    func enable() {
        if !isDisabled {
            return
        }
        
        self.isDisabled = false
        self.texture = SKTexture(imageNamed: imageName)
    }

    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        if isDisabled {
            return
        }
        
        isTouched = true
    }

//    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
//        if !isTouched {
//            return
//        }
//
//        let touch = touches.anyObject() as UITouch
//        let point = touch.locationInNode(self.scene)
//
//        if !containsPoint(point) {
//            isTouched = false
//        }
//    }

    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        if !isTouched {
            return
        }

//        let touch = touches.anyObject() as UITouch
//        let point = touch.locationInNode(self)
//
//        if containsPoint(point) {
            if let callback = clickedCallback {
                callback(button: self)
            }
//        }

        isTouched = false
    }

    override func touchesCancelled(touches: NSSet!, withEvent event: UIEvent!) {
        isTouched = false
    }
}
