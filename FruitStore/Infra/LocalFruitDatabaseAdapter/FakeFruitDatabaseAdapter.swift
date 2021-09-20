//
//  FakeDatabaseFruitList.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 20/09/21.
//

import Foundation

private func makeFakeDatabaseFruitList() -> FruitListModel {
    return FruitListModel(fruis: [
                            FruitModel(
                                identifier: 0,
                                name: "Banana",
                                imageURL: URL(string: "https://www.infoescola.com/wp-content/uploads/2010/04/banana_600797891.jpg")!,
                                price: 3.0,
                                unit: "kg"),
                            FruitModel(
                                identifier: 1,
                                name: "Manga",
                                imageURL: URL(string: "https://bonissimaviladaserra.com.br/web/image/product.template/14019/image_256/%5B35988%5D%20MANGA%20PALMER%20KG?unique=95a7823")!,
                                price: 6.0,
                                unit: "kg"),
                            FruitModel(
                                identifier: 2,
                                name: "Pêra",
                                imageURL: URL(string: "https://www.pensenatural.com.br/wp-content/uploads/2018/09/pera-1.jpg")!, price: 10.0, unit: "kg"),
                            FruitModel(
                                identifier: 3,
                                name: "Abacaxi",
                                imageURL: URL(string: "https://zonasul.vtexassets.com/arquivos/ids/176835/4554VF4qT-qqCUAA.png?v=637383821812170000")!,
                                price: 4.0, unit: "un"),
                            FruitModel(
                                identifier: 4,
                                name: "Maçã",
                                imageURL: URL(string: "https://storage.googleapis.com/facily-images/8f7cff8d-maca-cx-vendido-por-jb-frutas-e-legumes-0-1621020093.jpg")!,
                                price: 7.0,
                                unit: "kg")])
}
class FakeFruitDatabaseAdapter: LocalDatabase {
    private let fruitsArray = makeFakeDatabaseFruitList()
    func getAllFruits() -> (Result<Data?, LocalError>) {
        return .success(fruitsArray.toData())
    }
}
