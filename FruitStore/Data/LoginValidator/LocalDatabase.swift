//
//  LocalDatabase.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 20/09/21.
//

import Foundation

protocol LocalDatabase {
    func getAllFruits() -> (Result<Data?, LocalError>)
}
