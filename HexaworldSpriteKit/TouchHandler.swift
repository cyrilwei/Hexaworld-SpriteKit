//
//  TouchHandler.swift
//  HexaworldSpriteKit
//
//  Created by Cyril Wei on 11/14/14.
//  Copyright (c) 2014 Cyril Wei. All rights reserved.
//

import Foundation
import UIKit

public class TouchHandler: UIResponder {
    public var scene: HexaScene

    public init(scene: HexaScene) {
        self.scene = scene
    }
}