//
//  Macro.swift
//  tolxx
//
//  Created by mac on 2019/11/11.
//  Copyright © 2019 mac. All rights reserved.
//
import UIKit
import Foundation
enum AppConstants {
    
    //MARK: - 是否是测试环境
    static let NetDebug: Bool = true
    
    //MARK: - 随机颜色
    static let ColorDebug: Bool = false
    
    //MARK: - 日志输出
    static let LogDebug: Bool = true
    
    //存储-用户信息-键
    static let CurrentLoginUserInfo: String = ""
    
    static let KeyChainService: String = ""
    
    //存储-网络请求token-键
    static let NetworkToken: String = "NetworkToken"
    
    //MARK: - 协议（http/https）（含“//”后缀，不能为空）
    enum AppURLProtocol {
        
        //测试
        static let DebugProtocol = "https://"
        
        //生产
        static let ProduceProtocol = "https://"
    }
    
    //MARK: - 地址(host) （不能为空）
    enum AppURLHOST {
        
        //测试
        static let DebugHOST = "项目测试域名"
        
        //生产
        static let ProduceHOST = "项目生产域名"
    }
    
    //MARK: - 端口（port），（含“:”前缀，如果 URL_PORT 为空，则不含）
    enum AppURLPort {
        
        //测试
        static let DebugPort = ""
        
        //生产
        static let ProducePort = ""
    }
    
    //MARK: - 接口地址
    enum AppInterfaceAddress {
        
        //登录
        static let Login = "接口地址路由"
        
    }
    
    
    //MARK: - APP的key
    enum AppKey {
        
        static let UMeng = "三方Key"
        
        //......
        
    }
    
    //MARK: - APP的密钥
    enum AppSecret {
        
        static let UMeng = "三方密钥"
        
        //......
        
    }
    
    //MARK: - 错误类型
    enum ErrorType {
        
        static let ServerError = "服务器异常"
        
    }

}
func Ad(digital:Float) -> Float {
    return digital * Float(AppFrame.Scale_Width)
}
//MARK: - 日志输出
// <T>: 为泛型，外界传入什么就是什么
func BJDLog<T>(_ message: T, file: String = #file, method: String = #function, line: Int = #line) {
    
    if AppConstants.LogDebug {
        
        print("\(method)[\(line)]:\(message)")
        
    }
    
}

//MARK: - frame 相关
/************************  屏幕尺寸  ***************************/

public enum AppFrame {
    
    static let ScreenBounds = UIScreen.main.bounds
    
    // 屏幕宽度
    static let ScreenWidth = ScreenBounds.size.width
    
    // 屏幕高度
    static let ScreenHeight = ScreenBounds.size.height
    
    // iPhone4
    static let iPhone4 = ScreenHeight  < 568 ? true : false
    
    // iPhone 5
    static let iPhone5 = ScreenHeight  == 568 ? true : false
    
    // iPhone 6
    static let iPhone6 = ScreenHeight  == 667 ? true : false
    
    // iphone 6P
    static let iPhone6P = ScreenHeight == 736 ? true : false
    
    // iphone X
    static let iPhoneX = ScreenHeight == 812 ? true : false
    
    // navigationBarHeight
    static let kNavigationBarHeight : CGFloat = iPhoneX ? 88 : 64
    
    // tabBarHeight
    static let kTabBarHeight : CGFloat = iPhoneX ? 49 + 34 : 49
    
    /** 如果是iPhoneX按照Plus 尺寸计算比例 */
    static let Scale_Height = iPhoneX ? 736.0/667.0 : ScreenHeight / 667
    
    static let Scale_Width = ScreenWidth / 375
    
}

func ADAPTX(x:CGFloat) -> CGFloat {
    
    return AppFrame.Scale_Width * x
    
}

func ADAPTY(y:CGFloat) -> CGFloat {
    
    return AppFrame.Scale_Height * y
    
}

// MARK: ============================================================================
// MARK: 设置颜色

//MARK: - AppColor 相关
public enum AppColor {
    
    static let clear = UIColor.clear
    
    //APP主题色
    static let themeRed = RGB0X(hexValue: 0xED393D)
    //APP红色
    static let red = RGB0X(hexValue: 0xff2323)
    //APP蓝色
    static let blue = RGB0X(hexValue: 0x488ff0)
    //APP黑色
    static let black = RGB0X(hexValue: 0x333333)
    //APP深灰色
    static let darkgGray = RGB0X(hexValue: 0x666666)
    //APP灰色
    static let gray = RGB0X(hexValue: 0xf9f9f9)
    //APP轻灰色
    static let lightGray = RGB0X(hexValue: 0xf5f5f5)
}

/// RGBA的颜色设置
func RGB(_ r:CGFloat, g:CGFloat, b:CGFloat) -> UIColor {
    
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
    
}

func RGBA(_ r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
    
}

func HEXA(hexValue: Int, a: CGFloat) -> (UIColor) {
    
    return UIColor(red: ((CGFloat)((hexValue & 0xFF0000) >> 16)) / 255.0,
                   green: ((CGFloat)((hexValue & 0xFF00) >> 8)) / 255.0,
                   blue: ((CGFloat)(hexValue & 0xFF)) / 255.0,
                   alpha: a)
    
}

func RGB0X(hexValue: Int) -> (UIColor) {
    
    return HEXA(hexValue: hexValue, a: 1.0)
    
}

func FONT(font: CGFloat) -> UIFont {
    
    return UIFont.systemFont(ofSize: font*AppFrame.Scale_Width)
    
}
