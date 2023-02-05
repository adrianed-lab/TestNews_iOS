//
//  NewsViewPresenter.swift
//  TestNews_iOS
//
//  Created by admin on 4.02.23.
//

import Foundation
import UIKit
import Alamofire

protocol NewsViewPresenterProtocol: AnyObject {
    func countNews() -> Int
    func getNews()
    func configureNewsTitleTableViewCell(indexPath: IndexPath, cell: NewsTitleTableViewCellProtocol)
    func showDetaliedNews(indexPath: IndexPath) -> UIViewController
    var news: News? {get}
}

class NewsViewPresenter: NewsViewPresenterProtocol {
    private (set) var apiProvider: RestAPIProviderProtocol!
    weak var view: NewsViewProtocol?
    var news: News?
    
    required init(apiProvider: RestAPIProviderProtocol!, view: NewsViewProtocol?) {
        self.apiProvider = apiProvider
        self.view = view
        getNews()
    }
    
    func getNews() {
        apiProvider.getNews { [weak self] result in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch result {
                case .success(let value):
                    self.news = value
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func countNews() -> Int {
        news?.results?.count ?? 0
    }
       
    func configureNewsTitleTableViewCell(indexPath: IndexPath, cell: NewsTitleTableViewCellProtocol) {
        guard let news = news?.results else {return}
        guard let title = news[indexPath.row].title else {return}
        guard let date = news[indexPath.row].pubDate else {return}
        cell.configureCell(title: title, date: date)
    }
    
    func showDetaliedNews(indexPath: IndexPath) -> UIViewController {
        guard let news = news?.results else {return UIViewController()}
        let detaliedNews = news[indexPath.row]
        let builder = ModuleBuilder()
        let detaliedNewsVC = builder.createDetailedNewsModule(detailedNews: detaliedNews)
        return detaliedNewsVC
    }
}
