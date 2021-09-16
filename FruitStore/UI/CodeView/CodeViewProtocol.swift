//
//  CodeViewProtocol.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 16/09/21.
//

import Foundation
import SnapKit

protocol CodeViewProtocol {
    func buildViewHierarchy()
    func setupConstraints()
    func setupConfiguration()
    func setupView()
}

extension CodeViewProtocol{
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupConfiguration()
    }
}
