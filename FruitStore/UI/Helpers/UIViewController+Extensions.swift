//
//  UIViewController+Extensions.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 16/09/21.
//

import Foundation
import UIKit

extension UIViewController {
    func hideKeyboardOnTap() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        gesture.cancelsTouchesInView = false
        view.addGestureRecognizer(gesture)
    }

    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
}
