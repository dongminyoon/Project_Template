//
//  Array+Extension.swift
//  InitialProject
//
//  Created by USER on 2021/04/25.
//  Copyright © 2021 윤동민. All rights reserved.
//

import Foundation

extension Array {
    subscript(safe index: Index) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
