//
//  MovieDetalViewController.swift
//  StarWarsMovies
//
//  Created by Tarek El Ghoul on 02/04/2022.
//

import UIKit

class MovieDetalViewController: UIViewController {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var producerLabel: UILabel!
    @IBOutlet weak var openingCrawLabel: UILabel!
    @IBOutlet weak var createdLabel: UILabel!
    @IBOutlet weak var editedLabel: UILabel!
    
    var movieVM : MovieViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDesign()
        if let movieVM = movieVM {
                self.setupData(movie: movieVM)
        }
        

    }
    
    func setDesign() {
        topView.setShadow()
    }
    
    func setupData(movie : MovieViewModel) {
        
        movieTitleLabel.text = movie.title
        releaseDateLabel.text = movie.releaseDate
        directorLabel.text = movie.director
        producerLabel.text = movie.producer
        openingCrawLabel.text = movie.openingCrawl
        createdLabel.text = movie.created
        editedLabel.text = movie.edited
        self.title = movie.title
        
    }
   
  

}
