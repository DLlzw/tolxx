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
            ["clsName":"LxxMainVc","title":"首页","imageName":"home"],
            ["clsName":"EatMainVc","title":"吃","imageName":"find"],
            ["clsName":"BeautyMainVc","title":"美","imageName":"extend"],
            ["clsName":"CatMainVc","title":"猫","imageName":"account"],
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
        vc.tabBarItem.image = UIImage(named: imageName+"_normal")?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.selectedImage = UIImage(named: imageName + "_highlight")?.withRenderingMode(.alwaysOriginal)
        
        vc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.red], for: .normal)
        vc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.blue], for: .highlighted)
//        vc.tabBarItem.badgeValue = "10"
        let nav = BaseNavigationController(rootViewController: vc)
        return nav
    }
}
