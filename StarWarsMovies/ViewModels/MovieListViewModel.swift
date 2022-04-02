//
//  MovieListViewModel.swift
//  StarWarsMovies
//
//  Created by Tarek El Ghoul on 02/04/2022.
//

import Foundation

struct MovieListViewModel {
    
    private let movies: [Movie]
    
    init(_ movies : [Movie]){
        self.movies = movies
    }
    
    var numberOfSection: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.movies.count
    }
    
    func movieAtIndex(index : Int) -> MovieViewModel {
        let movie = movies[index]
        return MovieViewModel(movie)
    }
}
