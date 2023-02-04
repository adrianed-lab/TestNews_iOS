//
//  NewsModel.swift
//  TestNews_iOS
//
//  Created by admin on 4.02.23.
//

import Foundation

struct News: Codable {
    let status: String?
    let totalResults: Int?
    let results: [NewsResult]?
    let nextPage: String?
}

struct NewsResult: Codable {
    let title: String?
    let link: String?
    let keywords: [String]?
    let creator, videoURL: String?
    let description: String?
    let content: String?
    let pubDate: String?
    let imageURL: String?
    let sourceID: String?
    let category: [String]?
    let country: [String]?
    let language: String?

    enum CodingKeys: String, CodingKey {
        case title, link, keywords, creator
        case videoURL = "video_url"
        case description, content, pubDate
        case imageURL = "image_url"
        case sourceID = "source_id"
        case category, country, language
    }
}


