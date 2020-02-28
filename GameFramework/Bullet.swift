//
//  Bullet.swift
//  GameFramework
//
//  Created by zino-mac on 2020/02/27.
//  Copyright © 2020 zino-mac. All rights reserved.
//

import UIKit

class Bullet: GameObject {
    
    override func tick(){
        x = x + velX
        
        //적군과 나(총알)와 충돌검사!!
        for obj in objectManager.objectArray{
            //적군만 추출한다!!
            if obj.objectId == ObjectId.Enemy{
                //총알과 충돌 여부를 검사할 대상이 됨
                let result = self.imgView.frame.intersects(obj.imgView.frame)
                
                if result == true{
                    //나죽고(배열제거 + 그래픽처리)
                    objectManager.removeObject(obj: self)
                    self.imgView.removeFromSuperview()
                    
                    
                    //너죽고(배열제거 + 그래픽처리)
                    objectManager.removeObject(obj: obj)
                    
                    obj.imgView.removeFromSuperview()
                }
                
            }
        }
        
        //적군을 만나지 않고, 지정한 화면을 넘어
        //서면 자살하기!!
        //자살=배열에서 삭제 + 그래픽적으로제거
        if x > 900{
            //배열에서 제거
            objectManager.removeObject(obj:self)
            
            //부모 뷰로부터 이미지뷰 제거
            self.imgView.removeFromSuperview()
        }
    }
    
    override func render(){
        imgView.frame.origin.x = x
    }
}
