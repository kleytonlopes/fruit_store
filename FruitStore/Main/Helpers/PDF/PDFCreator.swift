//
//  PDFCreator.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 20/09/21.
//

import Foundation

protocol PDFCreator {
    var title: String {get}
    var body: String {get}
    func create() -> Data
}
