//
//  GameObject.swift
//  GameFramework
//
//  Created by zino-mac on 2020/02/27.
//  Copyright © 2020 zino-mac. All rights reserved.
//
//게임에 등장할 모든 오브젝트의 최상위 클래스 정의!!
import UIKit

//열거형은 상수 집합!!
enum ObjectId{
    case Hero, Enemy, Bullet, Item
}

class GameObject: NSObject {
    var objectId:ObjectId
    var objectManager:ObjectManager!
    var parent:UIView! //이 물체를 어느 뷰에 붙일지
    var url:String //이미지 경로
    var imgView:UIImageView! //사용될 이미지뷰
    var x:CGFloat
    var y:CGFloat
    var width:CGFloat
    var height:CGFloat
    var velX:CGFloat
    var velY:CGFloat
    
    //Swift의 생성자명은 클래스명을 따라가지 않음
    //자바와는 틀리게 생성자는 자식에게 상속된다!!
    init(objectId:ObjectId,objectManager:ObjectManager,parent:UIView, url:String, x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat,velX:CGFloat,velY:CGFloat){
        self.objectId = objectId
        self.objectManager = objectManager
        self.parent = parent
        self.url = url
        self.x = x
        self.y = y
        self.width = width
        self.height = height
        self.velX = velX
        self.velY = velY
        
        //이미지뷰 생성하고, 뷰에 부착!!
        imgView = UIImageView(image: UIImage(named: url))
        
        //이미지 크기
        imgView.frame = CGRect(x: x, y: y, width: width, height: height)
        
        //이미지 뷰에 부착!!
        parent.addSubview(imgView)
    }
    
    //모든 오브젝트가 구현해야 할 메서드 정의
    //자바였다면 추상메서드를 정의해야 하지만, 스위프트에서는
    //추상메서드가 지원되지 않으므로, 그냥 로직을 비워놓자!!
    //하지만 스위프트도 오버라이드를 지원하므로, 추후 자식이
    //아래의 메서드를 재정의하면 구현력은 자식의 메서드가 우선
    //시 된다!!
    func tick(){}
    func render(){}
}











