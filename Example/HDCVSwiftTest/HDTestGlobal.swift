//
//  HDTestGlobal.swift
//  HDCVSwiftTest_Example
//
//  Created by chenhaodong on 2019/10/30.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

func swiftClassFromString(className: String) -> AnyClass! {
    // get the project name
    if  let appName: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleExecutable") as! String? {
        // YourProject.className
        let classStringName = appName + "." + className
        return NSClassFromString(classStringName)
    }
    return nil;
}

func currentViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController?
{
    if let nav = base as? UINavigationController
    {
         return currentViewController(base: nav.visibleViewController)
    }
    if let tab = base as? UITabBarController
    {
         return currentViewController(base: tab.selectedViewController)
    }
    if let presented = base?.presentedViewController
    {
         return currentViewController(base: presented)
    }
    return base
}

func HDRandomColor() -> UIColor {
    return UIColor.init(red: CGFloat((Float(arc4random()%255))/255.0), green: CGFloat((Float(arc4random()%255))/255.0), blue: CGFloat((Float(arc4random()%255))/255.0), alpha: 1.0)
}

let HDScreenWidth = UIScreen.main.bounds.size.width
let HDScreenHeight = UIScreen.main.bounds.size.height
let HDisPhone = Bool(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone)
let HDisPhoneX = Bool(HDScreenWidth >= 375.0 && HDScreenHeight >= 812.0 && HDisPhone)
let HDTopSafeHeight = CGFloat(HDisPhoneX ? 44 : 20)
let HDBottomSafeHeight = CGFloat(HDisPhoneX ? 34: 0) 
let HDNavHeight = CGFloat(44)


