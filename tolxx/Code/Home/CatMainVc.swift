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
class CatMainVc: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController
        let url = Address.titleUrl
        NetWork.share.getUrlData(url: url, finished: {(result,error)
                in
            if result != nil {
                let json = JSON(result ?? nil!)
                print(json["data"]["data"][0])
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
