//
//  DetaliedNewsViewPresenter.swift
//  TestNews_iOS
//
//  Created by admin on 4.02.23.
//

import Foundation
import UIKit
import SnapKit

protocol DetaliedNewsViewPresenterProtocol: AnyObject {
    func configureDetaliedNewsTableViewCell(indexPath: IndexPath, cell: DetaliedNewsTableViewCellProtocol)
    func configureNewsTitleTableViewCell(cell: NewsTitleTableViewCellProtocol)
    func getLinkURL() -> String
}

class DetaliedNewsViewPresenter: DetaliedNewsViewPresenterProtocol {
    weak var view: DetaliedNewsViewProtocol?
    var detaliedNews: NewsResult?
    
    required init(view: DetaliedNewsViewProtocol?, detaliedNews: NewsResult? ) {
        self.view = view
        self.detaliedNews = detaliedNews
    }
    
    func configureDetaliedNewsTableViewCell(indexPath: IndexPath, cell: DetaliedNewsTableViewCellProtocol) {
        guard let content = detaliedNews?.content else {return}
        cell.configureCell(content: content)
    }
    
    func configureNewsTitleTableViewCell(cell: NewsTitleTableViewCellProtocol) {
        guard let title = detaliedNews?.title, let date = detaliedNews?.pubDate else {return}
        cell.configureCell(title: title, date: date)
    }
    
    func getLinkURL() -> String {
        guard let linkURL = detaliedNews?.link else {return ""}
        return linkURL
    }
}
