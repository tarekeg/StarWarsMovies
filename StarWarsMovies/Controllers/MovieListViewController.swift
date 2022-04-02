//
//  MovieListViewController.swift
//  StarWarsMovies
//
//  Created by Tarek El Ghoul on 02/04/2022.
//

import UIKit

class MovieListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalMoviesLabel: UILabel!
    @IBOutlet weak var topView: UIView!
    
    
    private var movieListVM: MovieListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        loadData()
        topView.setShadow()
        
    }
    
    func registerCell() {
        tableView.register(UINib(nibName: CONSTANT.CELLIdentifier.movieCell, bundle: nil), forCellReuseIdentifier: CONSTANT.CELLIdentifier.movieCell)
    }
    
    func loadData() {
        StarWarsAPI().getAllMovies { movieData in
            if let movies = movieData?.results {
                self.movieListVM = MovieListViewModel(movies)
            }
            DispatchQueue.main.async {
                self.totalMoviesLabel.text = "Total \(movieData?.count ?? 0) Movies"
                self.tableView.reloadData()
            }
            
        }
    }
    
}

extension MovieListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.movieListVM == nil ? 0 : self.movieListVM.numberOfSection
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieListVM.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CONSTANT.CELLIdentifier.movieCell, for: indexPath) as? MovieTableViewCell else {
            fatalError("TableViewCell not found")
        }
        
        let movieVM = self.movieListVM.movieAtIndex(index: indexPath.row)
        
        cell.movieTitleLabel.text = movieVM.title
        cell.directorLabel.text = movieVM.director
        cell.producerLabel.text = movieVM.producer
        cell.releaseDateLabel.text = movieVM.releaseDate
        cell.openingCrawlLabel.text = movieVM.openingCrawl
        
        return cell
        
    }
    
    
    
    
}

