//
//  TextFieldPassword.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 16/09/21.
//

import UIKit

final class LoginTextField: UITextField {
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.backgroundColor = .green
    }
    init(frame: CGRect = .zero, placeholder: String, isSecureTextEntry: Bool = false) {
        super.init(frame: frame)
        self.borderStyle = .roundedRect
        self.textAlignment = .center
        self.placeholder = placeholder
        self.isSecureTextEntry = isSecureTextEntry
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
