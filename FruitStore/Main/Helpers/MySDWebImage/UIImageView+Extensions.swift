//
//  UIImageView+Extensions.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 20/09/21.
//

import UIKit

extension UIImageView {
    func setImageWithCache(url: URL) {
        self.sd_setImage(with: url)
    }
}
