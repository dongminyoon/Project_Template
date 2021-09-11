//
//  NSMutableAttributeString+Extension.swift
//  InitialProject
//
//  Created by Dongmin on 2021/09/11.
//  Copyright © 2021 윤동민. All rights reserved.
//

import UIKit

extension NSMutableAttributedString {
    
    func setLineHeight(_ lineHeight: CGFloat, _ font: UIFont) {
        let paragraphStyle = NSMutableParagraphStyle()
        
        paragraphStyle.minimumLineHeight = lineHeight
        paragraphStyle.maximumLineHeight = lineHeight
        
        let baseLineOffset = (lineHeight - font.lineHeight) / 4
        let effectiveRange = NSRange(location: 0, length: self.mutableString.length)
        
        let attributes: [NSMutableAttributedString.Key: Any] = [
            .paragraphStyle: paragraphStyle,
            .baselineOffset: baseLineOffset
        ]
        self.addAttributes(attributes, range: effectiveRange)
    }
    
}
