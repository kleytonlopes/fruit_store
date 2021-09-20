//
//  SetImageFromURL.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 20/09/21.
//

import UIKit

protocol AsyncImageDownloader {
    func setImageURL(url: String) -> UIImageView
}
