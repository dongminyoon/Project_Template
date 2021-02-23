//
//  UICollectionViewCell.swift
//  InitialProject
//
//  Created by USER on 2021/02/23.
//  Copyright © 2021 윤동민. All rights reserved.
//

import UIKit

extension UICollectionView {
    func dequeueReusableCell<T: UICollectionViewCell>(cell: T.Type, forIndexPath indexPath: IndexPath) -> T? {
        let identifier = String(describing: cell)
        return self.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? T
    }
    
    func registerCell<T: UICollectionViewCell>(cell: T.Type) {
        let identifier = String(describing: cell)
        let nib = UINib(nibName: identifier, bundle: nil)
        
        if cell.isExistNibFile { self.register(nib, forCellWithReuseIdentifier: identifier) }
        else { self.register(cell, forCellWithReuseIdentifier: identifier) }
    }
}
