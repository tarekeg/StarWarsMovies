//
//  MovieData.swift
//  StarWarsMovies
//
//  Created by Tarek El Ghoul on 02/04/2022.
//

import Foundation

struct MovieData: Decodable {
    
    var count: Int?
    var results: [Movie]?
    
    enum CodingKeys: String, CodingKey {
        case count
        case results
    }
    
}
