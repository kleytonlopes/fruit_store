//
//  String+extensions.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 19/09/21.
//

import Foundation

extension String {
    func localized() -> String {
        return NSLocalizedString(self, tableName: "Localizable", bundle: .main, value: self, comment: self)
    }
}
