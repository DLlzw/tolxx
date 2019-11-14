//
//  Login.swift
//  tolxx
//
//  Created by mac on 2019/11/13.
//  Copyright © 2019 mac. All rights reserved.
//
import AVKit
import UIKit
class Scroll: UIView {
    override class var layerClass: AnyClass{
        get {
            return AVPlayerLayer.self
        }
    }
}
class Login: UIViewController {
    var play:AVPlayer?=nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.purple
        reloadBgVideo()
        // Do any additional setup after loading the view.
    }

    func reloadBgVideo(){
        let filePath = Bundle.main.path(forResource: "loginVideo", ofType: "mp4")!
        let videoUrl = URL(fileURLWithPath: filePath)
        let playerItem = AVPlayerItem(url: videoUrl)
       
        play = AVPlayer(playerItem: playerItem)
        let player = AVPlayerLayer(player: play)
        player.frame = self.view.frame
        player.videoGravity = .resizeAspectFill
        self.view.layer.addSublayer(player)
        play?.play()
        NotificationCenter.default.addObserver(self, selector: #selector(self.moviePlayDidEnd(notif:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
    }
    @objc func moviePlayDidEnd(notif:NSNotification){
        print("-!@#!@#@!#@!#!@#@!#")
        let playerItem  = notif.object as! (AVPlayerItem)
        playerItem.seek(to: CMTime.zero, completionHandler: nil)
        play?.play()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
