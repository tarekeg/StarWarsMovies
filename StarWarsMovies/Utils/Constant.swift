//
//  Constant.swift
//  StarWarsMovies
//
//  Created by Tarek El Ghoul on 02/04/2022.
//

import Foundation

struct CONSTANT {
    // MARK: Path
    struct PATH {
        static let baseURL = "https://swapi.dev/api"
        static let allMovies = "/films"
    }
    // MARK: Cell
    struct CellIdentifier {
        static let movieCell = "MovieTableViewCell"
    }
    // MARK: Identifier
    struct SegueIdentifier {
        static let toDetails = "toDetails"
    }
}
