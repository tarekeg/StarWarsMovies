//
//  MovieViewModel.swift
//  StarWarsMovies
//
//  Created by Tarek El Ghoul on 02/04/2022.
//

import Foundation

struct MovieViewModel {
    private let movie: Movie
    
    init(_ movie: Movie) {
        self.movie = movie
    }
    
    var title: String {
        return self.movie.title ?? ""
    }
    
    var director: String {
        return self.movie.director ?? ""
    }
    var producer: String {
        return self.movie.producer ?? ""
    }
    
    var releaseDate: String {
        return formatDate(dateToFormat: self.movie.releaseDate ?? "", inputFormat: "yyyy-MM-dd", outputFormat: "yyyy/MM/dd")
    }
    
    var openingCrawl: String {
        return self.movie.openingCrawl!.replacingOccurrences(of: "\r\n", with: " ", options: NSString.CompareOptions.literal, range: nil) 
    }
    
    var created: String {
        return formatDate(dateToFormat: self.movie.created ?? "", inputFormat: "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", outputFormat: "yyyy-M-d")
    }
    
    var edited: String {
        return formatDate(dateToFormat: self.movie.edited ?? "", inputFormat: "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", outputFormat: "yyyy-M-d")
    }
    
    
    func formatDate(dateToFormat: String, inputFormat:String, outputFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = inputFormat
        let date = dateFormatter.date(from: dateToFormat)
        dateFormatter.dateFormat = outputFormat
        if let date = date {
            let resultString = dateFormatter.string(from: date)
            return resultString
        } else {
            return dateToFormat
        }
    }
    
}
