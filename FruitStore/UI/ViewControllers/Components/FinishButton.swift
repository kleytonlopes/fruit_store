//
//  ButtonNext.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 16/09/21.
//

import UIKit

final class FinishButton: UIButton {
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.backgroundColor = .green
    }
    
    init(frame: CGRect = .zero, title: String) {
        super.init(frame: frame)
        self.backgroundColor = .green
        self.setTitle(title, for: .normal)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
