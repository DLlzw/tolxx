//
//  Child.swift
//  tolxx
//
//  Created by Mac on 2019/11/18.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class Child: UITextField {

    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect  = super.leftViewRect(forBounds: bounds)
        rect.origin.x = 16
        return rect
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.editingRect(forBounds: bounds)
        rect.origin.x = 70
        return rect
    }

}
