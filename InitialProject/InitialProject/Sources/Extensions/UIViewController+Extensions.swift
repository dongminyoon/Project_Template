//
//  UIViewController+Extensions.swift
//  InitialProject
//
//  Created by 윤동민 on 2019/12/20.
//  Copyright © 2019 윤동민. All rights reserved.
//

import Foundation
import UIKit

// UIViewController Extension 자주 사용하는 기능

extension UIViewController {
    /// RootViewController
    static var rootViewController: UIViewController? {
        return UIApplication.shared.windows.filter({ $0.isKeyWindow }).first?.rootViewController
    }
    
    /// 현재 보이는 ViewController 가져오기
    static func getVisibleController(_ viewController: UIViewController? = UIViewController.rootViewController) -> UIViewController? {
        if let navigationController = viewController as? UINavigationController {
            return getVisibleController(navigationController.visibleViewController)
        } else if let tabbarController = viewController as? UITabBarController {
            return getVisibleController(tabbarController.selectedViewController)
        } else if let presentedController = viewController?.presentedViewController {
            return getVisibleController(presentedController)
        } else {
            return viewController
        }
    }
    
    /// ViewController Storyboard로부터 가져오기
    static func instantiateFromStoryboard(_ name: String = "Main") -> Self? {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let identifier = String(describing: self)
        
        return storyboard.instantiateViewController(withIdentifier: identifier) as? Self
    }
    
    /// NavigationBar 투명하게 설정
    func setNavigationBarClear() {
        guard let bar = self.navigationController?.navigationBar else { return }
        bar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        bar.shadowImage = UIImage()
        bar.backgroundColor = UIColor.clear
    }
    
    func animateWithKeyboard(_ notification: NSNotification, animation: (CGRect?, Double?) -> Void) {
        let frameKey         = UIResponder.keyboardFrameEndUserInfoKey
        let keyboardFrame    = (notification.userInfo?[frameKey] as? NSValue)?.cgRectValue
        
        let durationKey      = UIResponder.keyboardAnimationDurationUserInfoKey
        let keyboardDuration = notification.userInfo?[durationKey] as? Double
        
        animation(keyboardFrame, keyboardDuration)
    }
    
}
