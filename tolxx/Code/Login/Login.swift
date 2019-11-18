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
class Login: UIViewController,UITextFieldDelegate {
    
    var play:AVPlayer?=nil
    var LoginView:UIView!
    var TextUser:UITextField!
    var TexPwd:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        reloadBgVideo()
        Mask()
        loginView()
    }
    func loginView() {
        LoginView = UIView()
        LoginView.backgroundColor = UIColor.clear
        self.view.addSubview(LoginView)
        LoginView?.snp.makeConstraints({ (make) in
            make.center.equalToSuperview()
            make.centerY.equalToSuperview().offset(Ad(digital: -40))
            make.height.equalToSuperview().dividedBy(4)
            make.width.equalToSuperview().multipliedBy(0.8)
        })
        TextUser = UITextField()
        TextUser.backgroundColor = UIColor.white
        TextUser.alpha = 0.3
        LoginView.addSubview(TextUser)
        TextUser.delegate = self
        TextUser.layer.cornerRadius = 5
        TextUser.layer.borderColor = UIColor.lightGray.cgColor
        TextUser.leftView = UIView(frame: CGRect(x: 0, y: 0, width: CGFloat(Ad(digital: 44)) , height: CGFloat(Ad(digital: 44))))
        TextUser.leftViewMode = .always
        TextUser.leftView?.backgroundColor = UIColor.red
        TextUser.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(Ad(digital: 30))
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.29)
        }
        
        TexPwd = UITextField()
        TexPwd.backgroundColor = UIColor.white
        TexPwd.alpha = 0.3
        LoginView.addSubview(TexPwd)
        TexPwd.delegate = self
        TexPwd.layer.cornerRadius = 5
        TexPwd.layer.borderColor = UIColor.lightGray.cgColor
        TexPwd.leftView = UIView(frame: CGRect(x: 0, y: 0, width: CGFloat(Ad(digital: 44)) , height: CGFloat(Ad(digital: 44))))
        TexPwd.leftViewMode = .always
        TexPwd.leftView?.backgroundColor = UIColor.green
        TexPwd.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(TextUser.snp_bottomMargin).offset(Ad(digital: 30))
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.29)
        }
    }
    func Mask(){
         let MView = UIView()
         MView.frame = UIScreen.main.bounds
         MView.backgroundColor = UIColor.gray
         MView.alpha = 0.5
         self.view.addSubview(MView)
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
        let playerItem  = notif.object as! (AVPlayerItem)
        playerItem.seek(to: CMTime.zero, completionHandler: nil)
        play?.play()
    }

   
}
extension UIViewController{
         //隐藏键盘
       func hideKeyboardWhenTappedAround() {
               let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
               tap.cancelsTouchesInView = false
               view.addGestureRecognizer(tap)
        }
       @objc private func dismissKeyboard() {
              view.endEditing(true)
    }
    
}
