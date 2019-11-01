//
//  Bundle+Extensions.swift
//  tolxx
//
//  Created by mac on 2019/10/31.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
extension Bundle{
    var namespace:String{
        return  infoDictionary?["CFBundleName"] as? String ?? ""
    }
}
