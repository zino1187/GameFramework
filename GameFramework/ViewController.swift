//
//  ViewController.swift
//  GameFramework
//
//  Created by zino-mac on 2020/02/27.
//  Copyright © 2020 zino-mac. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController ,AVAudioPlayerDelegate{

    var objectManager:ObjectManager!
    var hero:Hero!
    var url:URL!
    var audio:AVAudioPlayer!
    
    //touch up inside
    @IBAction func stopX(_ sender: Any) {
        hero.velX = 0
    }
    //touch down
    @IBAction func goRight(_ sender: Any) {
        hero.velX = 2
    }
    //touch down
    @IBAction func goLeft(_ sender: Any) {
        hero.velX = -2
    }
    //touch up inside
    @IBAction func stopLeft(_ sender: Any) {
        hero.velX = 0
    }
    //touch down
    @IBAction func goUp(_ sender: Any) {
        hero.velY = -2
    }
    //touch up inside
    @IBAction func stopY(_ sender: Any) {
        hero.velY = 0
    }
    //touch down
    @IBAction func goDown(_ sender: Any) {
        hero.velY = 2
    }
    
    @IBAction func stopDown(_ sender: Any) {
        hero.velY = 0
    }
    
    @IBAction func fire(_ sender: Any) {
        //총알 클래스로부터 인스턴스 생성하고,
        let bullet = Bullet(objectId:ObjectId.Bullet,objectManager:objectManager,parent: self.view, url: "ball.png", x: hero.x + hero.width, y: hero.y + hero.height/2, width: 20, height: 20, velX: 10, velY: 0)
        
        //매니저에게 등록을 의뢰하자!!
        objectManager.addObject(obj: bullet)
        
        fireSound()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(gameLoop), userInfo: nil, repeats: true)
        
        //명단을 매니저에 넘기자!!
        objectManager = ObjectManager()
        
        createHero()
        createEnemy()
        soundInit()
    }
    
    //주인공 생성
    func createHero(){
        hero = Hero(objectId:ObjectId.Hero,objectManager:objectManager,parent: self.view, url: "plane.png", x: 50, y: 150, width: 80, height: 60, velX: 0, velY: 0)
        //생성된 주인공을 오브젝트 메니저에게 등록을
        //의뢰하자!!
        objectManager.addObject(obj: hero)
    }
    
    //적군 생성하기
    func createEnemy(){
        var name=["e1.png",
                  "e2.png",
                  "e3.png",
                  "e5.png"]
        
        for i in 0..<name.count{
            let en = Enemy(objectId:ObjectId.Enemy,objectManager: objectManager, parent: self.view, url: name[i], x: 750, y:50 + (CGFloat(i)*(50)), width: 40, height: 40, velX: 0, velY: 0)
            
            //적군 등록!!
            objectManager.addObject(obj: en)
        }
    }
    
    func soundInit(){
        url = Bundle.main.url(forResource: "fire", withExtension: "wav")!
        
    }
    
    func fireSound(){
        do{
            audio = try AVAudioPlayer(contentsOf: url)
            audio.delegate = self
            audio.play()
        }catch{
            print("Cannot Load from url")
        }
    }
    
    //게임에 등장하는 대부분의 오브젝트는 에니메이션이 적용되어
    //야 하므로, 눈에 보이지 않더라도 무한루프가 실행되고 있어
    //야 한다. 이 무한루프의 속도는 게임 유저가 설정에서 변경
    //할 수 있다..(FPS)
    @objc func gameLoop(){
        
        //print("루프 실행중..")
        //게임루프에서는 게임에 등장할 명단이 들어있는
        //배열을 대상으로 tick(), render()무조건
        //호출하면 된다..배열에 들어있는 객체가 없을경우
        //nil로 인한 문제도 발생하지 않는다!!
        for obj in objectManager.objectArray{
            obj.tick()
            obj.render()
        }
    }
}













