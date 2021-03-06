//
//  BaseUITabBarController.swift
//  tolxx
//
//  Created by mac on 2019/10/31.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
class BaseUITabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildControllers()
        tabBar.isTranslucent = false
        // Do any additional setup after loading the view.
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
extension BaseUITabBarController{
    private func setupChildControllers(){
        
        let array = [
            ["clsName":"CatMainVc","title":"首页","imageName":"home"],
            ["clsName":"EatMainVc","title":"西瓜视频","imageName":"new_video"],
            ["clsName":"BeautyMainVc","title":"小视频","imageName":"huoshan"],
            ["clsName":"LxxMainVc","title":"我的","imageName":"mine"],
        ]
        var arrayM = [UIViewController]()
        for dict in array {
            arrayM.append(controller(dict: dict))
        }
        viewControllers = arrayM
        tabBar.barTintColor = UIColor.white
        
    }
    private func controller(dict:[String:String])->UIViewController{
        guard
            let clsName = dict["clsName"],
            let title = dict["title"],
            let imageName = dict["imageName"],
            let cls = NSClassFromString(Bundle.main.namespace+"."+clsName) as? UIViewController.Type
        else{
            return UIViewController()
        }
        
        // 创建视图控制器
        let vc = cls.init()
        // 创建视图控制器
        vc.title = title
        vc.tabBarItem.image = UIImage(named: imageName+"_tabbar")?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.selectedImage = UIImage(named: imageName + "_tabbar_press")?.withRenderingMode(.alwaysOriginal)
        
        vc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.black ], for: .normal)
        vc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.init(red: 237 / 255.0, green: 57 / 255.0, blue: 61 / 255.0, alpha: 1.0)], for: .highlighted)
//        vc.tabBarItem.badgeValue = "10"
        let nav = BaseNavigationController(rootViewController: vc)
        return nav
    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        for (k,v) in (tabBar.items?.enumerated())! {
            if v == item{
                print(v)
                animationWithIndex(index: k+1)
            }
        }
    }

    func animationWithIndex(index:Int){
        var tabbarbuttonArrary:[Any] = [Any]()
        for tabBarBtn in self.tabBar.subviews{
            tabbarbuttonArrary.append(tabBarBtn)
        }
        let pulse = CABasicAnimation(keyPath: "transform.scale")
        pulse.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeOut)
        pulse.duration = 0.15
        pulse.repeatCount = 1
        pulse.autoreverses = true
        pulse.fromValue = 0.9
        pulse.toValue = 1.1
        let tabBarLayer:CALayer
        if #available(iOS 13.0, *) {
            tabBarLayer = (tabbarbuttonArrary[index] as AnyObject).layer
        } else {
            tabBarLayer = (tabbarbuttonArrary[index] as! CALayer)
        }
        tabBarLayer.add(pulse, forKey: nil)
    }
}
