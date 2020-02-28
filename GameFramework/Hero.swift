//
//  Hero.swift
//  GameFramework
//
//  Created by zino-mac on 2020/02/27.
//  Copyright © 2020 zino-mac. All rights reserved.
//

import UIKit

class Hero: GameObject {
    //부모의 메서드 나한테 맞게 커스터마이징 하자!!
    //즉 오버라이딩 하자
    
    //물리량 변화 메서드
    override func tick(){
        x = x + velX
        y = y + velY
    }
    //화면에 표시될 그래픽 처리
    override func render(){
        imgView.frame.origin.x = x
        imgView.frame.origin.y = y
    }
}






