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
                
    }
    
    func setData(titleArrar:Array<Any>){
        
    }

}
        )
        
    }
    
}
