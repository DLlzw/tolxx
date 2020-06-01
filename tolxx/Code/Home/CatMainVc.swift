//
//  CatMainVc.swift
//  tolxx
//
//  Created by mac on 2019/10/31.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class CatMainVc: UIViewController,PagesContainerDelegate {
    var pageContainer:PagesContainer?
    let margin:CGFloat = 0
    var tempTableView = Array<Any>()
    var arrAdd = Array<Any>()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController
        let url = Address.titleUrl
        var TitleArrary = Array<Any>()
        let name = MainTitleVc()
      
        NetWork.share.getUrlData(url: url, finished: {(result,error) in
            if result != nil {
                let json = JSON(result ?? nil!)
                let  data =  json["data"]["data"].arrayValue
                for dicIndex in data {
                    TitleArrary.append((dicIndex["name"].rawString()) as Any )
                }
       print(TitleArrary)
                name.arrayViews = TitleArrary
                self.addChild(name)
                self.view.addSubview(name.view)
                self.view.backgroundColor = UIColor.blue
  
//                self.pageContainer  = PagesContainer(frame: CGRect.init(x: self.margin, y: 40, width: self.view.frame.size.width-self.margin*2, height: self.view.frame.size.height))
//                self.pageContainer?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//                self.pageContainer?.backgroundColor = UIColor.white
//                self.pageContainer?.delegate = self
//                self.pageContainer?.updateContent(withTitles: TitleArrary)
//                self.pageContainer?.setIsButtonAlignmentLeft(true)
//                self.pageContainer?.setCursorHeight(3.0)
//                self.pageContainer?.setCursorColor(UIColor.white)
//                self.pageContainer?.setTextColor(UIColor.black, andSelectedColor: AppColor.themeRed)
//
//                let topBar = self.pageContainer!.topBarr()
//                for _ in TitleArrary {
//                        let subView = ContentView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height-topBar-40))
//                        let color = UIColor(red: CGFloat(arc4random()%255) / CGFloat(255.0) , green: CGFloat(arc4random()%255) / CGFloat(255.0) , blue: CGFloat(arc4random()%255) / CGFloat(255.0), alpha: 0.3)
//                        subView.backgroundColor = color
//                    self.tempTableView.append(subView)
//
//                    }
//
//                self.arrAdd.append(self.tempTableView[0])
//                self.pageContainer?.updateContent(withViews: self.tempTableView)
//                self.view.addSubview(self.pageContainer!)
//
            }
        })

    
//        request(url).responseJSON { (response) in
//            switch response.result {
//            case .success(let json):
//                print(json)
//                break
//            case .failure(let error):
//                print("error:\(error)")
//                break
//            }
//
//
//        }
        // Do any additional setup after loading the view.
    }
    
    func setData(titleArrar:Array<Any>){
        
    }

}
