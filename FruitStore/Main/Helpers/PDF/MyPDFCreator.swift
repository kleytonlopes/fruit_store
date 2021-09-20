//
//  MyPDFCreator.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 19/09/21.
//

import UIKit
import PDFKit

class MyPDFCreator: PDFCreator {
  let title: String
  let body: String
  init(title: String, body: String) {
    self.title = title
    self.body = body
  }
  func create() -> Data {
    let pdfMetaData = [
      kCGPDFContextCreator: "Fruit Store",
      kCGPDFContextAuthor: "kleyton.lopes.com",
      kCGPDFContextTitle: title
    ]
    let format = UIGraphicsPDFRendererFormat()
    format.documentInfo = pdfMetaData as [String: Any]
    let pageWidth = 8.5 * 72.0
    let pageHeight = 11 * 72.0
    let pageRect = CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)
    let renderer = UIGraphicsPDFRenderer(bounds: pageRect, format: format)
    let data = renderer.pdfData { (context) in
      context.beginPage()
      addBodyText(pageRect: pageRect, textTop: 18.0)
    }
    return data
  }

  private func addBodyText(pageRect: CGRect, textTop: CGFloat) {
    let textFont = UIFont.systemFont(ofSize: 12.0, weight: .regular)
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.alignment = .natural
    paragraphStyle.lineBreakMode = .byWordWrapping
    let textAttributes = [
      NSAttributedString.Key.paragraphStyle: paragraphStyle,
      NSAttributedString.Key.font: textFont
    ]
    let attributedText = NSAttributedString(string: body, attributes: textAttributes)
    let textRect = CGRect(x: 10, y: textTop, width: pageRect.width - 20,
                          height: pageRect.height - textTop - pageRect.height / 5.0)
    attributedText.draw(in: textRect)
  }
}
