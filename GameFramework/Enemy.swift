//
//  Enemy.swift
//  GameFramework
//
//  Created by zino-mac on 2020/02/27.
//  Copyright © 2020 zino-mac. All rights reserved.
//

import UIKit

class Enemy: GameObject {
    
    override func tick(){
        x = x + velX
    }
    
    override func render(){
        imgView.frame.origin.x = x
    }
}
