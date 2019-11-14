//
//  UILable+Extension.swift
//  
//
//  Created by mac on 2019/11/12.
//

import UIKit
extension UILabel{
    open var verticalText : String{
        set{
            let verticalTextKey = UnsafeRawPointer.init(bitPattern: "verticalTextKey".hashValue)!
                   objc_setAssociatedObject(self,verticalTextKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
                   
                   let str = NSMutableString(string: verticalText)
                   for var i in 0..<str.length*2-1{
                       if i%2 != 0 {
                           str.insert("\n", at: i)
                       }
                       i+=1
                   }
                   self.text = str as String
                   self.numberOfLines = 0
               }
               get{
                   let verticalTextKey = UnsafeRawPointer.init(bitPattern: "verticalTextKey".hashValue)
                return objc_getAssociatedObject(self, verticalTextKey!) as! String
               }
           }
    }

