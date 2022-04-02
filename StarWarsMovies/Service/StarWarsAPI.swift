//
//  StarWarsAPI.swift
//  StarWarsMovies
//
//  Created by Tarek El Ghoul on 02/04/2022.
//

import Foundation


class StarWarsAPI {
    
    func getAllMovies(completion: @escaping(MovieData?) -> ()) {
        
        let baseURL = URL(string: CONSTANT.PATH.baseURL)
        
        let components = URLComponents(url: baseURL!.appendingPathComponent(CONSTANT.PATH.allMovies), resolvingAgainstBaseURL: true)
        
        if let components = components {
            URLSession.shared.dataTask(with: (components.url)!) { data, response, error in
                
                if let error = error {
                    print(error.localizedDescription)
                    completion(nil)
                } else if let data = data {
                    let data = try? JSONDecoder().decode(MovieData.self, from: data)
                    if let data = data {
                        completion(data)
                    }
                }
            }.resume()
        }
        
    }
    
}
