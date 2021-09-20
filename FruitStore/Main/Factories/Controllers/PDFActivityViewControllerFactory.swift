//
//  PdfActivityViewControllerFactory.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 20/09/21.
//

import UIKit

func makePDFActivityViewController(body: String) -> UIActivityViewController {
    let pdfCreator = MyPDFCreator(title: "Nota fiscal", body: body)
    let pdfData = pdfCreator.create()
    return  UIActivityViewController(activityItems: [pdfData], applicationActivities: [])
}
