//
//  URLConstants.swift
//  TestNews_iOS
//
//  Created by admin on 4.02.23.
//

import Foundation

struct URLConstants {
    static var baseURL = "https://newsdata.io/"
    
    static var getNewsURL: String {
        return baseURL.appending("api/1/news")
    }
}
