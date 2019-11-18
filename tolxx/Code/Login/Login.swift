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
    var TextUser:Child!
    var TexPwd:Child!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
//        reloadBgVideo()
        loginImage()
        Mask()
        loginView()
        
    }
    func loginImage(){
        let Bg = UIImageView()
        Bg.frame = self.view.bounds
        self.view .addSubview(Bg)
        Bg.image = UIImage(named: "logobg.jpg")
    }
    func loginView() {
        LoginView = UIView()
        LoginView.backgroundColor = UIColor.clear
        let MaoImageView = UIImageView()
        self.view.addSubview(MaoImageView)
        MaoImageView.image = UIImage(named: "mao")
        MaoImageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.topMargin.equalToSuperview().offset(Ad(digital:80))
            make.width.equalTo(Ad(digital: 309))
            make.height.equalTo(Ad(digital: 277))
        }
        self.view.addSubview(LoginView)
        LoginView?.snp.makeConstraints({ (make) in
            make.center.equalToSuperview()
            make.centerY.equalToSuperview().offset(Ad(digital: -40))
            make.height.equalToSuperview().dividedBy(4)
            make.width.equalToSuperview().multipliedBy(0.8)
        })
        TextUser = Child()
        TextUser.backgroundColor = UIColor.white
        TextUser.alpha = 0.5
        LoginView.addSubview(TextUser)
        TextUser.delegate = self
        TextUser.layer.cornerRadius = 5
        TextUser.layer.borderColor = UIColor.lightGray.cgColor
        let UserLeft =  UIImageView(frame: CGRect(x: 0, y: 0, width: CGFloat(Ad(digital: 30)) , height: CGFloat(Ad(digital: 30))))
        UserLeft.image = UIImage(named: "管理")
        TextUser.leftView = UserLeft
        TextUser.font = UIFont.boldSystemFont(ofSize: 20)
        TextUser.leftViewMode = .always
        TextUser.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(Ad(digital: 30))
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.29)
        }
        
        TexPwd = Child()
        TexPwd.backgroundColor = UIColor.white
        TexPwd.alpha = 0.5
        LoginView.addSubview(TexPwd)
        TexPwd.delegate = self
        TexPwd.layer.cornerRadius = 5
        TexPwd.layer.borderColor = UIColor.lightGray.cgColor
        let TexLeft =  UIImageView(frame: CGRect(x: 0, y: 0, width: CGFloat(Ad(digital: 30)) , height: CGFloat(Ad(digital: 30))))
        TexLeft.image = UIImage(named: "密码")
        TexPwd.leftView = TexLeft
        TexPwd.leftViewMode = .always
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

