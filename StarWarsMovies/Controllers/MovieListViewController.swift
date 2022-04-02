//
//  MovieListViewController.swift
//  StarWarsMovies
//
//  Created by Tarek El Ghoul on 02/04/2022.
//

import UIKit

class MovieListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        StarWarsAPI().getAllMovies { movieData in
            print(movieData?.results?.count)
        }
    }
    

    

}
