//
//  GuideVc.swift
//  tolxx
//
//  Created by mac on 2019/11/11.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import SnapKit
class GuideVc: UIViewController,UIScrollViewDelegate {
    var window: UIWindow?
    var Scroll:UIScrollView?=nil
    var numberOfPage = 4
    let color :Array<UIColor> = [#colorLiteral(red: 0.5109232068, green: 0.7851083875, blue: 0.6277396679, alpha: 1),#colorLiteral(red: 0.3981503248, green: 0.5985657573, blue: 0.7974270582, alpha: 1),#colorLiteral(red: 0.7942704558, green: 0.6020501256, blue: 0.7709236741, alpha: 1),#colorLiteral(red: 0.9823203683, green: 0.3528756797, blue: 0.3530002832, alpha: 1)]
    let strings :Array<String> = ["仗剑红尘已是癫","有酒平步上青天","游星气斗弄日月","醉卧云端笑人间"]
    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = self.view.bounds
        Scroll = UIScrollView()
        Scroll!.frame = self.view.bounds
        Scroll!.delegate = self
        Scroll!.contentSize = CGSize(width:frame.size.width * CGFloat(numberOfPage), height: frame.size.height)
        Scroll!.isPagingEnabled = true
        Scroll!.showsHorizontalScrollIndicator = false
        Scroll!.showsVerticalScrollIndicator = false
        Scroll!.scrollsToTop = false
        for i in 0..<numberOfPage{
            let SView = UIView()
            SView.frame = CGRect(x: frame.size.width*CGFloat(i), y: CGFloat(0), width: frame.size.width, height: frame.size.height)
            SView.backgroundColor = color[i]
//            baotuxiaobaiti
            let lab = UILabel()
            lab.font = UIFont(name: "baotuxiaobaiti", size: 44*AppFrame.Scale_Width)
            lab.textColor = UIColor.white
            lab.verticalText = strings[i]
            lab.numberOfLines = 0
            lab.tag = 100+i
            SView.addSubview(lab)
            lab.snp.makeConstraints { (make) in
                make.center.equalToSuperview()
                make.height.equalTo(Ad(digital: 500))
                make.width.equalTo(Ad(digital: 50))
            }
            let labAnimation = CABasicAnimation(keyPath: "opacity")
            labAnimation.fromValue = 0
            labAnimation.toValue = 1
            labAnimation.duration = 2
            lab.layer.add(labAnimation, forKey: "opactiy")
            Scroll!.addSubview(SView)
            
        }
        Scroll!.contentOffset = CGPoint.zero
        self.view.addSubview(Scroll!)
        // Do any additional setup after loading the view.
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let mWidth = CGFloat(numberOfPage-1)*self.view.bounds.width
        
        for view in self.Scroll?.subviews as! [UIView]{
            for la in view.subviews as! [UILabel]{
                let aw = scrollView.contentOffset.x/self.view.bounds.width
                if( Int(round(aw))+101  == la.tag){
//                    la.tag = la.tag+200
//                    la.layer.removeAllAnimations()
                    let labAnimation = CABasicAnimation(keyPath: "opacity")
                                        labAnimation.fromValue = 0
                                        labAnimation.toValue = 1
                                        labAnimation.duration = 1
                                        la.layer.add(labAnimation, forKey: "opactiy")
                  
                }
            }
        }
        if scrollView.contentOffset.x>mWidth{
            let tab = BaseUITabBarController()
            let rootVC = UIApplication.shared.delegate as! AppDelegate
            let loginVc = Login()
            let loginNav = BaseNavigationController.init(rootViewController: loginVc)
            if #available(iOS 13.0, *) {
                window = (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.window
//              window?.rootViewController = tab
                window?.rootViewController = loginNav
            } else {
                // Fallback on earlier versions
                rootVC.window?.rootViewController = loginNav
            }
//            rootVC.window?.rootViewController = tab
           
            
        }
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
