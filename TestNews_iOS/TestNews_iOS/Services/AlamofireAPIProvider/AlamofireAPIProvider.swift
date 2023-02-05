//
//  AlamofireAPIProvider.swift
//  TestNews_iOS
//
//  Created by admin on 4.02.23.
//

import Foundation
import UIKit
import Alamofire

protocol RestAPIProviderProtocol {
    func getNews(completion: @escaping (Result<News, Error>) -> Void)
}

class AlamofireAPIProvider: RestAPIProviderProtocol {
    func getNews(completion: @escaping (Result<News, Error>) -> Void) {
        let parameters = addParametrs(queryItems: ["category" : "world", "language" : "en"])
        AF.request(URLConstants.getNewsURL, method: .get, parameters: parameters).responseDecodable(of: News.self) {
            response in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
            print(response.result)
        }
    }
    
    private func addParametrs(queryItems: [String: String]) -> [String: String] {
        var parametrs: [String: String] = [:]
        parametrs = queryItems
        if let valueAPIKey = Bundle.main.infoDictionary?["API_KEY"] as? String {
        parametrs["apikey"] = valueAPIKey
        }
        return parametrs
    }
}

