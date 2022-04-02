//
//  Movie.swift
//  StarWarsMovies
//
//  Created by Tarek El Ghoul on 02/04/2022.
//

import Foundation

struct Movie: Decodable {
    var title: String?
    var director: String?
    var producer: String?
    var releaseDate: String?
    var openingCrawl: String?
    var created: String?
    var edited: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case director
        case producer
        case releaseDate = "release_date"
        case openingCrawl = "opening_crawl"
        case created
        case edited
    }
}


