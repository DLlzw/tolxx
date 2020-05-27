//
//  Login.swift
//  tolxx
//
//  Created by mac on 2019/11/13.
//  Copyright © 2019 mac. All rights reserved.
//
import AVKit
import UIKit
import SVProgressHUD
enum LoginShowType {
    case YES
    case NO
}
class Scroll: UIView {
    override class var layerClass: AnyClass{
        get {
            return AVPlayerLayer.self
        }
    }
}
class Login: UIViewController,UITextFieldDelegate {
    
    var showType:LoginShowType = LoginShowType.NO
    var play:AVPlayer?=nil
    var LoginView:UIView!
    var TextUser:Child!
    var TexPwd:Child!
    var MaoImageView:UIImageView!
    var SureBtn:UIButton!
    
    var user:String!
    var mima:String!
    override func viewWillAppear(_ animated: Bool) {
       
    }
    override func viewDidLoad() {
       
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
//        reloadBgVideo()
        loginImage()
        loginView()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardHidden), name: UIResponder.keyboardWillHideNotification, object: nil)
//        SVProgressHUD.showInfo(withStatus: "正在加载...", maskType: SVProgressHUDMaskType.black);

        
    }
    deinit {
               NotificationCenter.default.removeObserver(self)
           }
    @objc func keyboardShow(){
         if (showType != LoginShowType.NO){
                 return
            }
             showType = LoginShowType.YES
        UIView.animate(withDuration: 0.5) {
                 self.LoginView?.snp.updateConstraints({ (make) in
                        make.centerY.equalTo(self.MaoImageView).offset(Ad(digital: 130))

                    })
                 self.SureBtn.snp.updateConstraints { (make) in
                     make.top.equalTo(self.LoginView.snp_bottomMargin).offset(Ad(digital: 10))
                 }
                   self.view.layoutIfNeeded()
             }


    }
    @objc func keyboardHidden(){
        showType = LoginShowType.NO
        UIView.animate(withDuration: 0.5) {
                self.LoginView?.snp.updateConstraints({ (make) in
                       make.centerY.equalTo(self.MaoImageView).offset(Ad(digital: 150))
                   })
                self.SureBtn.snp.updateConstraints { (make) in
                    make.top.equalTo(self.LoginView.snp_bottomMargin).offset(Ad(digital: 80))
                      }
              self.view.layoutIfNeeded()
            }

    }
    func loginImage(){
        let Bg = UIImageView()
        Bg.frame = self.view.bounds
        self.view .addSubview(Bg)
        Bg.image = UIImage(named: "logobg.png")
    }
    func loginView() {
        LoginView = UIView()
        LoginView.backgroundColor = UIColor.clear
        MaoImageView = UIImageView()
        self.view.addSubview(MaoImageView)
        MaoImageView.image = UIImage(named: "圆")
        MaoImageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(Ad(digital: 100))
            make.width.equalTo(Ad(digital: 300/2.4))
            make.height.equalTo(Ad(digital: 300/2.4))
        }
        self.view.addSubview(LoginView)
        LoginView?.snp.makeConstraints({ (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(MaoImageView).offset(Ad(digital: 150))
            make.height.equalTo(Ad(digital: 200))
            make.width.equalToSuperview().multipliedBy(0.8)
        })
        TextUser = Child()
        TextUser.backgroundColor = UIColor.white
        TextUser.alpha = 0.5
        TextUser.delegate = self
        TextUser.layer.cornerRadius = 5
        TextUser.layer.borderColor = UIColor.lightGray.cgColor
        TextUser.placeholder = "请输入用户名"
        LoginView.addSubview(TextUser)
    
        let UserLeft =  UIImageView(frame: CGRect(x: 0, y: 0, width: CGFloat(Ad(digital: 30)) , height: CGFloat(Ad(digital: 30))))
        UserLeft.image = UIImage(named: "管理")
        TextUser.leftView = UserLeft
        TextUser.font = UIFont.boldSystemFont(ofSize: 18)
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
        TexPwd.placeholder = "请输入密码"
        TexPwd.delegate = self
             TexPwd.layer.cornerRadius = 5
             TexPwd.layer.borderColor = UIColor.lightGray.cgColor
        LoginView.addSubview(TexPwd)
     
        let TexLeft =  UIImageView(frame: CGRect(x: 0, y: 0, width: CGFloat(Ad(digital: 30)) , height: CGFloat(Ad(digital: 30))))
        TexLeft.image = UIImage(named: "密码")
        TexPwd.leftView = TexLeft
        TexPwd.font = UIFont.boldSystemFont(ofSize: 18)
        TexPwd.leftViewMode = .always
        TexPwd.isSecureTextEntry = true
        TexPwd.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(TextUser.snp_bottomMargin).offset(Ad(digital: 30))
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.29)
        }
        
        SureBtn = UIButton()
        self.view.addSubview(SureBtn)
        SureBtn.setBackgroundImage(UIImage.init(named: "向右"), for: .normal)
        SureBtn.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(LoginView.snp_bottomMargin).offset(Ad(digital: 80))
            make.width.equalTo(Ad(digital: 128/2))
            make.height.equalTo(Ad(digital: 128/2))
        }
        SureBtn.addTarget(self, action: #selector(self.click), for:.touchUpInside)

    }
    @objc func click(){
        if user == "User" && mima == "mima" {
            let tabVC = BaseUITabBarController()
            self.navigationController?.pushViewController(tabVC, animated: true)
            
        }else{
        
        }
        
        
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
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.isEqual(TextUser) {
            user = textField.text
        }else{
            mima = textField.text
        }
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

