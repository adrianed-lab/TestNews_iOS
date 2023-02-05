//
//  ModuleBuilder.swift
//  TestNews_iOS
//
//  Created by admin on 4.02.23.
//

import Foundation
import UIKit

protocol BuilderProtocol {
    func createNewsModule() -> UIViewController
    func createDetailedNewsModule(detailedNews: NewsResult) -> UIViewController
}

class ModuleBuilder: BuilderProtocol {
    func createNewsModule() -> UIViewController {
        let view = NewsViewController()
        let apiProvider = AlamofireAPIProvider()
        let presenter = NewsViewPresenter(apiProvider: apiProvider, view: view)
        view.presenter = presenter
        return view
    }
    
    func createDetailedNewsModule(detailedNews: NewsResult) -> UIViewController {
        let view = DetaliedNewsViewController()
        let presenter = DetaliedNewsViewPresenter(view: view, detaliedNews: detailedNews)
        view.presenter = presenter
        return view
    }
}
