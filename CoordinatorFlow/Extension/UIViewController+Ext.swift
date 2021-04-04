//
//  UIViewController+Ext.swift
//  CoordinatorFlow
//
//  Created by Jakub Gawecki on 04/04/2021.
//

import UIKit

extension UIViewController {
    func configureVC(title stringTitle: String?, backgroundColor color: UIColor, isTitleLarge bool: Bool?) {
        if stringTitle != nil { self.title = stringTitle }
        self.view.backgroundColor = color
        if bool != nil { self.navigationController?.navigationBar.prefersLargeTitles = true }
    }
}
