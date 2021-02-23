//
//  UITableView.swift
//  InitialProject
//
//  Created by USER on 2021/02/23.
//  Copyright © 2021 윤동민. All rights reserved.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(_ cell: T.Type, forIndexPath indexPath: IndexPath) -> T? {
        let cellName = String(describing: cell)
        return self.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as? T
    }
    
    func registerCell<T: UITableViewCell>(cell: T.Type) {
        let identifier = String(describing: cell)
        let nib = UINib(nibName: identifier, bundle: nil)
    
        if cell.isExistNibFile { self.register(nib, forCellReuseIdentifier: identifier) }
        else { self.register(cell, forCellReuseIdentifier: identifier) }
    }
}
