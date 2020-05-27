//
//  NetWork.swift
//  tolxx
//
//  Created by Mac on 2020/5/27.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
import Alamofire
class NetWork: NSObject {
    private var Networking:NetWork?
    static let share = NetWork()
//    override init() {
//        super.init()
//        Networking = NetWork.init()
//    }

}

extension NetWork {
    func requestData(urlString:String,  finished:@escaping (_ result: AnyObject?, _ error: NSError?) -> ())
    {
    
    }
    
    
    func getUrlData(url:String,finished:@escaping (_ result: AnyObject?, _ error: NSError?)->()){
        request(url).responseJSON { (response) in
        switch response.result {
        case .success(let json):
//            debugPrint(json)
            finished(json as AnyObject, nil)
            break
        case .failure(let error):
            finished(error as AnyObject, nil)
            print("error:\(error)")
            break
        }
            }
        }
}
