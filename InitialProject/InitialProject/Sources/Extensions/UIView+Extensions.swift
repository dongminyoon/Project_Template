//
//  UIView+Extensions.swift
//  InitialProject
//
//  Created by 윤동민 on 2019/12/20.
//  Copyright © 2019 윤동민. All rights reserved.
//

import Foundation
import UIKit

// UIView Extension 자주 사용하는 기능

extension UIView {
    
    // Nib이 Bundle에 있는지 확인
    static var isExistNibFile: Bool {
        let identifier = String(describing: self)
        return Bundle.main.path(forResource: identifier, ofType: "nib") != nil
    }
    
    // 타입으로부터 Nib 파일 불러오기
    static func fromNib<T: UIView>() -> T? {
        guard let nib = Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil) else { return nil }
        return nib.first as? T
    }
    
    // 부분적으로 Corner 주기
    func makeRoundCorner(directions: UIRectCorner = .allCorners, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds,
                                byRoundingCorners: directions,
                                cornerRadii: CGSize(width: radius, height: radius))
        
        let mask        = CAShapeLayer()
        mask.path       = path.cgPath
        self.layer.mask = mask
    }
    
    // View Shadow 지정
    func makeShadow(opacity: Float, radius: CGFloat) {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = .zero
    
        // 지정한 Shadow 투명도
        self.layer.shadowOpacity = opacity
        // 지정한 Shadow Radius
        self.layer.shadowRadius = radius
    }
    
    // View Border Width 지정
    func setBorderWidth(width: CGFloat) {
        self.layer.borderWidth = width
    }
    
    // View Border Color 지정
    func setBorderColor(color: CGColor) {
        self.layer.borderColor = color
    }
}
