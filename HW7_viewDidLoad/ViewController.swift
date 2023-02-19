//
//  ViewController.swift
//  HW7_viewDidLoad
//
//  Created by Dawei Hao on 2023/2/16.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let player = AVPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
      
        let url = Bundle.main.url(forResource: "Lisa Money ringtone  Download Link", withExtension: "mp3")!  // function url 回傳的 URL 將是 optional ，因此我們加上 !
                let playerItem = AVPlayerItem(url: url)     //利用 AVPlayerItem 生成要播放的音樂
                player.replaceCurrentItem(with: playerItem) //設定 player 要播放的 AVPlayerItem
                player.play()                               //開始播放音樂
        // let player = AVQueuePlayer()
        //let item = AVPlayerItem(url: url)
        //looper = AVPlayerLooper(player: player, templateItem: item)
        
        let imageView = UIImageView(frame:CGRect(x: 0, y: 500, width: 420, height: 350))   //Call ImageView
        imageView.contentMode = .scaleToFill                                               //contentMode for ImageView
        view.addSubview(imageView)                                                         //add imageView
        let chickenBroImage = UIImage.animatedImageNamed("chicken-bro-money-", duration: 1)//animated for gif
        imageView.image = chickenBroImage
        
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        
        let moneyEmitterCell = CAEmitterCell()
        moneyEmitterCell.contents = UIImage(named: "money_2")?.cgImage
        moneyEmitterCell.birthRate = 10      //設定每秒發射幾個鈔票
        moneyEmitterCell.lifetime = 20       //鈔票維持的秒數
        moneyEmitterCell.velocity = 100      //移動鈔票速度
        moneyEmitterCell.spin = 0.5          //設定鈔票轉速的範圍為 -0.5(0.5–1) ~ 1.5(0.5+1)
        moneyEmitterCell.spinRange = 2       //鈔票轉速
        moneyEmitterCell.scale = 0.8         //控制鈔票大小的範圍
        moneyEmitterCell.scaleRange = -0.2   //控制鈔票大小的範圍
        moneyEmitterCell.scaleSpeed = -0.01  //鈔票大小改變的速度
        moneyEmitterCell.emissionRange = .pi
        
        let moneyEmitterLayer = CAEmitterLayer()
        moneyEmitterLayer.emitterPosition = CGPoint(x: view.bounds.width / 2, y: -50)
        moneyEmitterLayer.emitterSize = CGSize(width: view.bounds.width, height: 0)
        moneyEmitterLayer.emitterShape = .rectangle
        moneyEmitterLayer.emitterCells = [moneyEmitterCell]
        view.layer.addSublayer(moneyEmitterLayer)
    }
}

